return {
  {
    'tronikelis/conflict-marker.nvim'
    -- , event = "VeryLazy"
    , opts = {
      highlights = true,
      on_attach = function( conflict )
        ---  Jump to markers
        ---
        local MID = "^=======$"
        vim.keymap.set( "n", "[x", function()
          vim.cmd( "?" .. MID )
        end, { buffer = conflict.bufnr })
        vim.keymap.set( "n", "]x", function()
          vim.cmd( "/" .. MID )
        end, { buffer = conflict.bufnr })

        ---  Choose outcome
        ---
        vim.keymap.set( "n", "co", function()
          conflict:choose_ours()
        end, { buffer = conflict.bufnr })
        vim.keymap.set( "n", "ct", function()
          conflict:choose_theirs()
        end, { buffer = conflict.bufnr })
        vim.keymap.set( "n", "cb", function()
          conflict:choose_both()
        end, { buffer = conflict.bufnr })
        vim.keymap.set( "n", "cn", function()
          conflict:choose_none()
        end, { buffer = conflict.bufnr })
      end
    }
  },
  {
    'theprimeagen/git-worktree.nvim'
    , dependencies = {
      'nvim-lua/plenary.nvim'
      , 'nvim-telescope/telescope.nvim'
    }
    , keys = {
      {
        '<leader>gw', function()
          require 'telescope'.extensions.git_worktree.git_worktrees()
        end, desc = 'git worktree list'
      },
      {
        '<leader>gW', function()
          require 'telescope'.extensions.git_worktree.create_git_worktree()
        end, desc = 'git worktree create'
      }
    }
    , config = function()
      require 'git-worktree'.setup {}
      require 'telescope'.load_extension( 'git_worktree' )
    end
  },
  {
    'pwntester/octo.nvim'
    , enabled = false
    , cmd = 'Octo'
    , dependencies = {
      'nvim-lua/plenary.nvim'
      , 'nvim-telescope/telescope.nvim'
      , 'nvim-tree/nvim-web-devicons'
    }
    , config = function()
      require 'configs.telescope.github.octo'
    end
  },
  {
    'lewis6991/gitsigns.nvim'
    , ft = 'gitcommit'
    , init = function()
      vim.api.nvim_create_autocmd( { 'BufRead' }, {
        group = vim.api.nvim_create_augroup( 'GitSignsLazyLoad', { clear = true } )
        , callback = function()
          vim.fn.system('git -C ' .. vim.fn.expand '%:p:h' .. ' rev-parse')
          if vim.v.shell_error == 0 then
            vim.api.nvim_del_augroup_by_name 'GitSignsLazyLoad'
            require 'lazy'.load { plugins = { 'gitsigns.nvim' } }
          end
        end
      })
    end
    , opts = {
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 350
          -- , virt_text_pos = 'right_align'
        },
        on_attach = function( bufnr )
          local gitsigns = require 'gitsigns'

          local function map( mode, l, r, desc, opts )
            opts        = opts or {}
            opts.desc   = desc
            opts.buffer = bufnr
            vim.keymap.set( mode, l, r, opts )
          end

          ---  Navigation
          ---
          map( 'n', ']c', function()
            if vim.wo.diff then return ']c' end
            ---@diagnostic disable-next-line: param-type-mismatch
            vim.schedule( function() gitsigns.nav_hunk( 'next' ) end )
            return '<Ignore>'
          end, 'next hunk', { expr = true })

          --- Does not work
          ---
          -- map( 'n', ']c', function()
          --   if vim.wo.diff then
          --     vim.cmd.normal { ']c', bang = true }
          --   else
          --     gitsigns.nav_hunk( 'next' )
          --   end
          -- end, 'next hunk', { expr = true })

          map( 'n', '[c', function()
            if vim.wo.diff then return '[c' end
            ---@diagnostic disable-next-line: param-type-mismatch
            vim.schedule( function() gitsigns.nav_hunk( 'prev' ) end )
            return '<Ignore>'
          end, 'prev hunk', { expr = true })

          ---  Actions
          ---
          local line = vim.fn.line

          map( 'n', '<leader>hs', gitsigns.stage_hunk,                                         'stage hunk'          )
          map( 'n', '<leader>hr', gitsigns.reset_hunk,                                         'reset hunk'          )

          map( 'v', '<leader>hs', function() gitsigns.stage_hunk { line("."), line("v") } end, 'stage hunk'          )
          map( 'v', '<leader>hr', function() gitsigns.reset_hunk { line("."), line("v") } end, 'reset hunk'          )

          map( 'n', '<leader>hS', gitsigns.stage_buffer,                                       'stage buffer'        )
          map( 'n', '<leader>hR', gitsigns.reset_buffer,                                       'reset buffer'        )

          map( 'n', '<leader>hp', gitsigns.preview_hunk,                                       'preview hunk'        )
          map( 'n', '<leader>hi', gitsigns.preview_hunk_inline,                                'preview hunk inline' )

          map( 'n', '<leader>hb', function() gitsigns.blame_line { full = true } end,          'blame line'          )

          map( 'n', '<leader>hd', gitsigns.diffthis,                                           'diff this'           )
          ---@diagnostic disable-next-line: param-type-mismatch
          map( 'n', '<leader>hD', function() gitsigns.diffthis( '~' ) end,                     'diff this ~'         )
          ---@diagnostic disable-next-line: param-type-mismatch
          map( 'n', '<leader>hQ', function() gitsigns.setqflist( 'all' ) end,                  'qf this diff'        )

          --- Toggles
          ---
          map( 'n', '<leader>tb', gitsigns.toggle_current_line_blame,                          'toggle blame line'   )
          map( 'n', '<leader>tw', gitsigns.toggle_word_diff,                                   'toggle word diff'    )

          ---  Text object
          ---
          map( { 'o', 'x' }, 'ih', gitsigns.select_hunk, 'select hunk' )
        end
    }
  }
}
