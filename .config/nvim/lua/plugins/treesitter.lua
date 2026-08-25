---  nvim-treesitter: migrated to main branch / Neovim 0.12 API
---
return {
  {
    'fei6409/log-highlight.nvim'
    -- , event = { 'BufReadPost' }
    , ft = { 'log' }
    , opts = {
      ---@type string|string[]: File extensions. Default: 'log'
      extension = 'log',

      ---@type string|string[]: File names or full file paths. Default: {}
      filename = {
        'syslog',
      },

      ---@type string|string[]: File name/path glob patterns. Default: {}
      pattern = {
        -- Use `%` to escape special characters and match them literally.
        '%/var%/log%/.*',
        'console%-ramoops.*',
        'log.*%.txt',
        'logcat.*',
      },

      ---@type table<string, string|string[]>: Custom keywords to highlight.
      ---This allows you to define custom keywords to be highlighted based on
      ---the group.
      ---
      ---The following highlight groups are supported:
      ---    'error', 'warning', 'info', 'debug' and 'pass'.
      ---
      ---The value for each group can be a string or a list of strings.
      ---All groups are empty by default. Keywords are case-sensitive.
      keyword = {
        error   = 'ERROR_MSG',
        warning = { 'WARN_X', 'WARN_Y' },
        info    = { 'INFORMATION' },
        debug   = {},
        pass    = {},
      }
    }
  },
  {
    'nvim-treesitter/nvim-treesitter'
    , branch = 'main'
    , lazy = false         -- main branch does NOT support lazy loading
    , build = ':TSUpdate'
    , dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-textobjects'
        , branch = 'main'
      }
      , 'HiPhish/rainbow-delimiters.nvim'
      , 'nvim-treesitter/nvim-treesitter-context'
    }
    , config = function()
      ---  core setup (install dir defaults to stdpath/data/site)
      ---
      require 'nvim-treesitter'.setup {
        install_dir = vim.fn.stdpath 'data' .. '/site'
      }

      ---  install the parsers Snacks and the config expect
      ---
      require 'nvim-treesitter'.install {
        'css'
        , 'html'
        , 'javascript'
        , 'latex'
        , 'scss'
        , 'svelte'
        , 'tsx'
        , 'typst'
        , 'vue'
        , 'regex'
      }

      ---  filetype -> language mapping overrides
      ---
      vim.treesitter.language.register('groovy', 'Jenkinsfile')

      ---  enable highlight / indent per-buffer on FileType, with on-demand
      ---  parser install for languages not in the eager `install { ... }` list.
      ---
      local installing = {}

      local function enable_for(buf, lang)
        local ok = pcall(vim.treesitter.start, buf, lang)
        if not ok then return false end
        if vim.bo[buf].filetype ~= 'yaml' then
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
        return true
      end

      local function request_install(lang, trigger_buf)
        if installing[lang] then return end
        local manifest_ok, manifest = pcall(require, 'nvim-treesitter.parsers')
        if not manifest_ok or not manifest[lang] then return end
        installing[lang] = true
        require 'nvim-treesitter'.install(lang):await(function()
          vim.schedule(function()
            installing[lang] = nil
            if vim.api.nvim_buf_is_valid(trigger_buf) then
              enable_for(trigger_buf, lang)
            end
            for _, b in ipairs(vim.api.nvim_list_bufs()) do
              if b ~= trigger_buf and vim.api.nvim_buf_is_loaded(b) then
                local bft = vim.bo[b].filetype
                if bft ~= '' and vim.treesitter.language.get_lang(bft) == lang then
                  enable_for(b, lang)
                end
              end
            end
          end)
        end)
      end

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('user_treesitter', { clear = true })
        , callback = function(args)
          local buf = args.buf
          if vim.bo[buf].buftype ~= '' then return end
          local ft = vim.bo[buf].filetype
          if ft == '' then return end
          local lang = vim.treesitter.language.get_lang(ft)
          if not lang then return end
          if enable_for(buf, lang) then return end
          request_install(lang, buf)
        end
      })

      ---  textobjects setup
      ---
      require 'nvim-treesitter-textobjects'.setup {
        select = {
          lookahead = true
          , include_surrounding_whitespace = true
          , selection_modes = {
            ['@parameter.outer'] = 'v'  -- charwise
            , ['@function.outer'] = 'V' -- linewise
            , ['@class.outer'] = '<c-v>' -- blockwise
          }
        }
        , move = {
          set_jumps = true
        }
      }

      ---  textobjects: select keymaps
      ---
      local ts_select = require 'nvim-treesitter-textobjects.select'
      local function sel(query)
        return function() ts_select.select_textobject(query, 'textobjects') end
      end

      for _, m in ipairs { 'x', 'o' } do
        vim.keymap.set(m, 'af', sel '@function.outer',    { desc = 'a function' })
        vim.keymap.set(m, 'if', sel '@function.inner',    { desc = 'inner function' })
        vim.keymap.set(m, 'aC', sel '@class.outer',       { desc = 'a Class' })
        vim.keymap.set(m, 'iC', sel '@class.inner',       { desc = 'inner Class' })
        vim.keymap.set(m, 'ac', sel '@conditional.outer', { desc = 'a conditional' })
        vim.keymap.set(m, 'ic', sel '@conditional.inner', { desc = 'inner conditional' })
        vim.keymap.set(m, 'al', sel '@loop.outer',        { desc = 'a loop' })
        vim.keymap.set(m, 'il', sel '@loop.inner',        { desc = 'inner loop' })
      end

      ---  textobjects: move keymaps
      ---
      local ts_move = require 'nvim-treesitter-textobjects.move'
      local nxo = { 'n', 'x', 'o' }

      vim.keymap.set(nxo, ']m', function() ts_move.goto_next_start('@function.outer', 'textobjects')                    end, { desc = 'next fn start'    })
      vim.keymap.set(nxo, ']M', function() ts_move.goto_next_end('@function.outer', 'textobjects')                      end, { desc = 'next fn end'      })
      vim.keymap.set(nxo, '[m', function() ts_move.goto_previous_start('@function.outer', 'textobjects')                end, { desc = 'prev fn start'    })
      vim.keymap.set(nxo, '[M', function() ts_move.goto_previous_end('@function.outer', 'textobjects')                  end, { desc = 'prev fn end'      })
      vim.keymap.set(nxo, ']o', function() ts_move.goto_next_start({ '@loop.inner', '@loop.outer' }, 'textobjects')     end, { desc = 'next loop'        })
      vim.keymap.set(nxo, '[o', function() ts_move.goto_previous_start({ '@loop.inner', '@loop.outer' }, 'textobjects') end, { desc = 'prev loop'        })
      vim.keymap.set(nxo, ']c', function() ts_move.goto_next('@conditional.outer', 'textobjects')                       end, { desc = 'next conditional' })
      vim.keymap.set(nxo, '[c', function() ts_move.goto_previous('@conditional.outer', 'textobjects')                   end, { desc = 'prev conditional' })
      vim.keymap.set(nxo, ']z', function() ts_move.goto_next_start('@fold', 'folds')                                    end, { desc = 'next fold'        })

      ---  repeatable motions (; and ,) and builtin f/F/t/T repeat
      ---
      local ts_rep = require 'nvim-treesitter-textobjects.repeatable_move'
      vim.keymap.set(nxo, ';', ts_rep.repeat_last_move_next)
      vim.keymap.set(nxo, ',', ts_rep.repeat_last_move_previous)
      vim.keymap.set(nxo, 'f', ts_rep.builtin_f_expr, { expr = true })
      vim.keymap.set(nxo, 'F', ts_rep.builtin_F_expr, { expr = true })
      vim.keymap.set(nxo, 't', ts_rep.builtin_t_expr, { expr = true })
      vim.keymap.set(nxo, 'T', ts_rep.builtin_T_expr, { expr = true })
    end
  }
}
