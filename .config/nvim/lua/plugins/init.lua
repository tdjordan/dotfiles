----------
---
---  Plugins
---
----------

---  Install all the plugins
---
return {
  {
    ---  Filetype Identification Replacement
    ---
    -- , {
    --   'nathom/filetype.nvim'
    --   , config = function()
    --     require 'configs.filetype'
    --   end
    -- }

    ---  lua performance
    ---
    -- {
    --   'lewis6991/impatient.nvim'
    --   -- , config = function()
    --   --   require 'impatient'.enable_profile()
    --   --   -- require 'impatient'
    --   -- end
    --   , config = function()
    --     vim.schedule(function()
    --       require 'impatient'.enable_profile()
    --     end)
    --     -- require 'impatient'
    --   end
    -- }

    -- , {
    --   'antoinemadec/FixCursorHold.nvim'
    -- }

    -- , {
    --   'fgheng/winbar.nvim'
    -- }

    ---  Browser Integration
    ---
    -- , {
    --   'glacambre/firenvim'
    --   , build = function()
    --     vim.fn['firenvim#install'](0)
    --   end
    --   , config = function()
    --     require 'configs.firenvim'
    --   end
    -- }

    ---  Notifications
    ---
    -- , {
    --   'rcarriga/nvim-notify'
    --   -- , event = 'CursorHold'
    --   -- , event = 'BufReadPost'
    --   , config = function()
    --     require 'configs.notifications.notify'
    --   end
    -- }
    -- {
    --   'vigoux/notifier.nvim'
    --   , config = function()
    --     require 'configs.notifications.notifier'
    --   end
    -- }
    -- , {
    --   'j-hui/fidget.nvim'
    --   , config = function()
    --     require 'configs.notifications.fidget'
    --   end
    -- }
    -- , {
    --   ---@diagnostic disable-next-line: spell-check
    --   'folke/noice.nvim'
    --   , event = 'CursorHold'
    --   , config = function()
    --     require 'configs.notifications.noice'
    --   end
    -- }

    {
      'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
      -- , dependencies = {
      --   'neovim/nvim-lspconfig'
      -- }
      , config = function()
        require 'configs.lsp.lines'
      end
    }

    -- , {
    --   'lvimuser/lsp-inlayhints.nvim'
    --   , config = function()
    --     require 'configs.lsp.inlay'
    --   end
    -- }

    ---  Lua Information
    ---
    , {
      'nanotee/nvim-lua-guide'
      , lazy = true
    }

    ---  Language Protocol Server - LSP
    ---
    , {
      'williamboman/mason.nvim'
      , event = 'BufReadPre'
      , config = function()
        require 'configs.lsp.mason'
      end
    }
    , {
      'williamboman/mason-lspconfig.nvim'
    }
    , {
      'jay-babu/mason-null-ls.nvim'
      -- , require = 'null-ls.nvim'
    }
    , {
      'jay-babu/mason-nvim-dap.nvim'
      , config = function()
        vim.schedule(function()
          require 'configs/dap/mason'
        end)
      end
    }
    -- , {
    --   'williamboman/nvim-lsp-installer'
    --   , event = 'CursorHold'
    --   , config = function()
    --     require 'configs.lsp.installer'
    --   end
    -- }
    , {
      'neovim/nvim-lspconfig'
      , dependencies = {
        'williamboman/mason-lspconfig.nvim'
        , 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
      }
    }
    , {
      'SmiteshP/nvim-navic'
      , event = 'VeryLazy'
      , config = function()
        require 'configs.lsp.navic'
      end
    }
    , {
      'b0o/schemastore.nvim'
      , event = 'VeryLazy'
    }
    , {
      'jose-elias-alvarez/null-ls.nvim'
      -- , event = { 'BufReadPre', 'BufNewFile' }
      , event = { 'CursorHold' }
      , config = function()
        require 'configs.lsp.null'
      end
    }
    , {
      "b0o/incline.nvim",
      event = "CursorHold",
      enabled = false,
      config = function()
        -- local function get_diagnostic_label(props)
        --   local icons = { error = '', warn = '', info = '', hint = '', }
        --   local label = {}
        --
        --   for severity, icon in pairs(icons) do
        --     local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
        --     if n > 0 then
        --       table.insert(label, { icon .. ' ' .. n .. ' ', group = 'DiagnosticSign' .. severity })
        --     end
        --   end
        --   if #label > 0 then
        --     table.insert(label, {'| '})
        --   end
        --   return label
        -- end
        --
        -- -- local function get_git_diff(props)
        -- --   local icons = { removed = "", changed = "", added = "" }
        -- --   local labels = {}
        -- --   vim.notify('hello')
        -- --   vim.notify(vim.api.vim_bug_get_var(props.buf, "gitsigns"))
        -- --   local signs = vim.api.nvim_buf_get_var(props.buf, "gitsigns_status_dict")
        -- --   if #signs < 1 then
        -- --     return {{''}}
        -- --   end
        -- --   -- local signs = vim.b.gitsigns_status_dict
        -- --   for name, icon in pairs(icons) do
        -- --     if tonumber(signs[name]) and signs[name] > 0 then
        -- --       table.insert(labels, { icon .. " " .. signs[name] .. " ",
        -- --         group = "Diff" .. name
        -- --       })
        -- --     end
        -- --   end
        -- --   if #labels > 0 then
        -- --     table.insert(labels, { '| ' })
        -- --   end
        -- --   return labels
        -- -- end
        --
        -- local colors = require("tokyonight.colors").setup()
        -- require('incline').setup({
        --   -- highlight = {
        --   --   groups = {
        --   --     InclineNormal = { guibg = "#FC56B1", guifg = colors.black },
        --   --     InclineNormalNC = { guifg = "#FC56B1", guibg = colors.black },
        --   --   },
        --   -- },
        --   window = { margin = { vertical = 0, horizontal = 1 } },
        --   render = function(props)
        --     local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':.')
        --     local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
        --     local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold,italic" or "bold"
        --
        --     local buffer = {
        --       { get_diagnostic_label(props) },
        --       -- { get_git_diff(props) },
        --       { ft_icon, guifg = ft_color }, { " " },
        --       { filename, gui = modified },
        --     }
        --     return buffer
        --   end
        -- })
        -- local colors = require("tokyonight.colors").setup()
        -- local colors = require 'material.colors'
        require("incline").setup({
          -- highlight = {
          --   groups = {
          --     -- InclineNormal   = { guibg = "#FC56B1", guifg = colors.main.black },
          --     -- InclineNormal   = { guibg = colors.main.darkpurple, guifg = colors.main.black },
          --     -- InclineNormal   = { guifg = colors.main.darkpurple, guibg = colors.main.black },
          --     InclineNormal   = { guifg = colors.main.darkpurple, guibg = colors.editor.contrast },
          --     InclineNormalNC = { guifg = colors.main.darkpurple, guibg = colors.editor.bg },
          --     -- InclineNormalNC = { guifg = "#FC56B1", guibg = colors.editor.bg },
          --   },
          -- },
          window = { margin = { vertical = 0, horizontal = 1 } },
          render = function(props)
            local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":.")
            local icon, color = require("nvim-web-devicons").get_icon_color(filename)
            return { { icon, guifg = color }, { " " }, { filename } }
          end,
        })
      end,
    }

    ---  LSP Extensions
    ---
    -- , {
    --   'glepnir/lspsaga.nvim'
    --   , config = function()
    --     require 'configs.lsp.saga'
    --   end
    -- }

    -- , {
    --   'folke/trouble.nvim'
    --   , event = 'CursorHold'
    --   , cmd =
    --     { 'Trouble'
    --     , 'TroubleToggle'
    --   }
    --   , config = function()
    --     require 'configs.trouble'
    --   end
    -- }

    , {
      'folke/todo-comments.nvim'
      , event = 'CursorHold'
      , config = function()
        require 'configs.todo.comments'
      end
    }

    , {
      'simrat39/symbols-outline.nvim'
      , event = 'CursorHold'
      , config = function()
        require 'configs.symbols.outline'
      end
    }

    , {
      'simrat39/rust-tools.nvim'
      , ft = 'rs'
    }

    ---  Inlay Hints for rust-analyzer
    ---
    -- , {
    --   'nvim-lua/lsp_extensions.nvim'
    -- }

    ---  Is this now just built in?
    ---
    -- ,   'tjdevries/nlua.nvim'

    ---  Auto Completion
    ---
    , {
      'onsails/lspkind-nvim'
      , config = function()
        require 'configs.lsp.kind'
      end
    }
    , {
      'hrsh7th/nvim-cmp'
      -- , event = 'CursorHold'
      , event = 'InsertEnter'
      , dependencies = {
        'hrsh7th/cmp-nvim-lsp'
        , 'hrsh7th/cmp-buffer'
        , 'hrsh7th/cmp-nvim-lsp-signature-help'
        , 'hrsh7th/cmp-path'
        , 'hrsh7th/cmp-calc'
        , 'uga-rosa/cmp-dictionary'
        , 'quangnguyen30192/cmp-nvim-tags'
        , {
          'petertriho/cmp-git'
          , event = 'InsertEnter'
          , config = function()
            require 'configs.completion.cmp.git'
          end
        }
      }
      , config = function()
        -- vim.schedule(function()
        require 'configs.completion.cmp'
        -- end)
      end
    }
    , {
      'hrsh7th/cmp-nvim-lua'
      -- , ft = 'lua'
      , event = 'InsertEnter'
    }
    , {
      'hrsh7th/cmp-cmdline'
      , event = 'CmdlineEnter'
      , config = function()
        require 'configs.completion.cmp.cmdline'
      end
    }
    -- , {
    --   'David-Kunz/cmp-npm'
    --   , lazy = true
    --   , config = function()
    --     require 'configs.completion.cmp.npm'
    --   end
    -- }
    -- , {
    --   'andersevenrud/compe-tmux'
    --   , branch = 'cmp'
    -- }
    -- , {
    --   'ray-x/cmp-treesitter'
    -- }
    -- , {
    --   'hrsh7th/cmp-look'
    -- }
    -- , {
    --   'hrsh7th/cmp-emoji'
    -- }
    -- , {
    --   'hrsh7th/cmp-vsnip'
    -- }
    -- , {
    --   'petertriho/cmp-git'
    --   , event = 'InsertEnter'
    --   , config = function()
    --     require 'configs.completion.cmp.git'
    --   end
    -- }
    , {
      'Saecki/crates.nvim'
      , event = { 'BufReadPost Cargo.toml' }
      , dependencies = {
        'nvim-lua/plenary.nvim'
      }
      , config = function()
        require 'configs.completion.cmp.crates'
      end
    }
    , {
      'joshzcold/cmp-jenkinsfile'
      , event = { 'BufReadPost Jenkinsfile' }
      , config = function()
        require 'configs.completion.cmp.jenkinsfile'
      end
    }

    ---  diagnostics
    ---
    -- , {
    --   'onsails/diaglist.nvim'
    --   , config = function()
    --     require 'configs.lsp.diaglist'
    --   end
    -- }

    ---  snippets
    ---
    -- , {
    --   'hrsh7th/vim-vsnip'
    --   , event = 'InsertEnter'
    --   , dependencies = {
    --     'hrsh7th/vim-vsnip-integ'
    --   }
    -- }
    -- , {
    --   'hrsh7th/vim-vsnip-integ'
    --   , event = 'InsertEnter'
    -- }
    , {
      'rafamadriz/friendly-snippets'
      -- , dependencies = {
      --   'hrsh7th/vim-vsnip'
      -- }
      -- , event = 'InsertEnter'
    }
    -- , { 'Shougo/neosnippet' }
    -- , { 'Shougo/neosnippet-snippets' }
    -- , { 'honza/vim-snippets' }
    -- , { 'SirVer/ultisnips' }
    -- , { 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }
    , {
      'norcalli/snippets.nvim'
      , event = 'InsertEnter'
      , config = function()
        require 'configs.snippets.snippets-nvim'
      end
    }
    , {
      'L3MON4D3/LuaSnip'
      -- , event = 'InsertEnter'
      -- , config = function()
      --   require 'configs.snippets.luasnip'
      -- end
      , config = function()
        require 'configs.luasnip'
      end
    }
    -- , {
    --   'molleweide/LuaSnip-snippets.nvim'
    --   , event = 'InsertEnter'
    --   , config = function()
    --     require 'configs.luasnip.snippets'
    --   end
    -- }
    , {
      'saadparwaiz1/cmp_luasnip'
    }

    ---  Telescope
    ---
    , {
      'nvim-telescope/telescope.nvim'
      , cmd = 'Telescope'
      , dependencies = {
        'nvim-lua/plenary.nvim'
        , 'lalitmee/browse.nvim'
        , 'nvim-telescope/telescope-file-browser.nvim'
        , 'pwntester/octo.nvim'
        , 'nvim-telescope/telescope-fzy-native.nvim'
        , 'nvim-telescope/telescope-project.nvim'
      }
      , config = function()
        require 'configs.telescope'
      end
    }
    , {
      'lalitmee/browse.nvim'
      , config = function()
        require 'configs.telescope.browse'
      end
    }
    , {
      'nvim-telescope/telescope-file-browser.nvim'
      , config = function()
        require 'configs.telescope.file.browser'
      end
    }
    -- , {
    --   'nvim-telescope/telescope-github.nvim'
    --   , config = function()
    --     require 'configs.telescope.github.gh'
    --   end
    -- }
    , {
      'pwntester/octo.nvim'
      , config = function()
        require 'configs.telescope.github.octo'
      end
    }

    ---  TODO : Add keymapping
    ---
    -- , {
    --   'nvim-telescope/telescope-packer.nvim'
    --   , lazy = true
    --   -- , event = 'CursorHold'
    --   -- , config = function()
    --     -- vim.schedule()
    --     -- require 'configs.telescope.packer'
    --   -- end
    -- }
    -- , {
    --   'nvim-telescope/telescope-packer.nvim'
    --   , config = function()
    --     require 'configs.telescope.packer'
    --   end
    -- }

    , {
      'nvim-telescope/telescope-fzy-native.nvim'
      -- , event = 'CursorHold'
      , config = function()
        require 'configs.telescope.fzy.native'
      end
    }

    , {
      'nvim-telescope/telescope-project.nvim'
      -- , event = 'CursorHold'
      , config = function()
        require 'configs.telescope.project'
      end
    }

    -- , {
    --   'ahmedkhalf/project.nvim'
    --   , config = function()
    --     require 'project_nvim'.setup {}
    --   end
    -- }

    ---  TODO : Add keymapping
    ---
    -- , {
    --   'camgraff/telescope-tmux.nvim'
    --   , cmd = 'Telescope tmux'
    --   , event = 'CursorHold'
    -- }

    ---  TODO : Add keymapping
    ---
    , {
      'nvim-telescope/telescope-symbols.nvim'
      , event = 'CursorHold'
    }

    ---  tree sitter
    ---
    , {
      'nvim-treesitter/nvim-treesitter'
      , build = ':TSUpdate'
      -- , build = function()
      --   require 'nvim-treesitter.install'.update()
      -- end
      , event = 'CursorHold'
      -- , event = 'VeryLazy'
      -- , event = { 'BufReadPost', 'BufNewFile' }
      -- , dependencies = {
      --   -- 'p00f/nvim-ts-rainbow'
      --   -- 'yamatsum/nvim-nonicons'
      --   -- 'sheerun/vim-polyglot'
      --   -- 'nvim-neorg/neorg'
      --   -- 'xbase-lab/xbase'
      -- }
      , dependencies = {
        'nvim-treesitter/nvim-treesitter-refactor'
        , 'nvim-treesitter/nvim-treesitter-textobjects'
      }
      , config = function()
        vim.schedule(function()
          require 'configs.treesitter'
        end)
      end
    }

    , {
      'nvim-treesitter/playground'
      , cmd = { 'TSPlaygroundToggle'
        , 'TSHighlightCapturesUnderCursor'
      }
    }
    -- , { 'nvim-treesitter/completion-treesitter' }
    -- , {
    --   'nvim-treesitter/nvim-treesitter-refactor'
    --   -- , event = 'CursorHold'
    --   -- , dependencies = {
    --   , keys = 'grr'
    --   --   'nvim-treesitter/nvim-treesitter'
    --   -- }
    -- }
    -- , {
    --   'nvim-treesitter/nvim-treesitter-textobjects'
    --   -- , event = 'CursorHold'
    -- }
    -- , {
    --   'theHamsta/nvim-treesitter-pairs'
    --   , event = 'CursorHold'
    -- }
    -- , {
    --   'David-Kunz/treesitter-unit'
    --   -- , event = 'CursorHold'
    -- }
    -- , { 'nvim-treesitter/nvim-treesitter-context' }
    -- , {
    --   'p00f/nvim-ts-rainbow'
    --   , enabled = false
    --   , config = function()
    --     require 'configs.treesitter.rainbow'
    --   end
    -- }

    ---  quick fix
    ---
    , {
      'kevinhwang91/nvim-bqf'
      , ft = 'qf'
      , config = function()
        require 'configs.bqf'
      end
    }

    ---  rest explorations
    ---
    , {
      'rest-nvim/rest.nvim'
      -- , cmd = {
      --   'RestNvim'
      --   , 'RestNvimPreview'
      --   , 'RestNvimLast'
      -- }
      , ft = 'http'
      , config = function()
        require 'configs.rest'
      end
    }

    ---  history
    ---
    -- , { 'mbbill/undotree' }

    , {
      'sindrets/diffview.nvim'
      , cmd = {
        'DiffviewClose',
        'DiffviewFileHistory',
        'DiffviewFocusFiles',
        'DiffviewLog',
        'DiffviewOpen',
        'DiffviewRefresh',
        'DiffviewToggleFiles',
      }
      , keys = {
        { "<leader>gd.", "<cmd>DiffviewOpen<cr>",        desc = "git diff this file"    },
        { "<leader>gdc", "<cmd>DiffviewClose<cr>",       desc = "git diff close"        },
        { "<leader>gdh", "<cmd>DiffviewFileHistory<cr>", desc = "git diff file history" }
      }
      , dependencies = {
        'nvim-lua/plenary.nvim'
      }
      , config = function()
        require 'configs.diffview'
      end
    }

    ---  terminals
    ---
    -- , { 'voldikss/vim-floaterm' }
    -- , { 'norcalli/nvim-terminal.lua' }

    ---  tmux
    ---
    -- , { 'tmux-plugins/vim-tmux' }
    , {
      'aserowy/tmux.nvim'
      , event = 'CursorHold'
      -- , event = 'VeryLazy'
      , config = function()
        require 'configs.tmux'
      end
    }

    ---  debugger
    ---
    -- , { 'puremourning/vimspector' }
    -- , { 'critiqjo/lldb.nvim' }
    , {
      'mfussenegger/nvim-dap'
      , dependencies = {
        'rcarriga/nvim-dap-ui',
        'theHamsta/nvim-dap-virtual-text',
        'nvim-telescope/telescope-dap.nvim',
        'jbyuki/one-small-step-for-vimkind',
      }
      -- , init = function()
      --   require 'utility'.packer_lazy_load 'nvim-dap'
      -- end
      , config = function()
        vim.schedule(function()
          require 'configs.dap'
        end)
      end
    }
    , {
      'rcarriga/nvim-dap-ui'
      , config = function()
        require 'configs.dap.ui'
      end
    }
    , {
      'theHamsta/nvim-dap-virtual-text'
      , config = function()
        require 'configs.dap.virtual'
      end
    }
    , {
      'nvim-telescope/telescope-dap.nvim'
    }
    , {
      'jbyuki/one-small-step-for-vimkind'
    }
    -- , {
    --   'Pocco81/DAPInstall.nvim'
    --   , config = function ()
    --     require 'configs.dap.install'
    --   end
    -- }

    ---  matchup
    ---
    -- , { 'andymass/vim-matchup' }
    -- , { 'jkramer/vim-checkbox' }

    ---  keymap management
    ---
    , {
      'folke/which-key.nvim'
      -- , event = 'CursorHold'
      , event = 'VeryLazy'
      , dependencies = {
        'ntpeters/vim-better-whitespace'
      }
      , config = function()
        vim.schedule(function()
          require 'configs.keys'
        end)
      end
    }

    ---  search
    ---
    -- , { 'rking/ag.vim' }
    -- , {
    --   'junegunn/fzf',
    --   build = 'fzf#install()'
    -- }
    -- , { 'junegunn/fzf.vim' }
    -- , { 'stsewd/fzf-checkout.vim' }
    -- , { 'junegunn/fzf',
    --  \ { 'dir': '~/.fzf', 'do': './install --all' }
    -- , { 'lotabout/skim' } --, { 'dir': '~/.skim', 'do': './install -all' }
    -- , { 'wsdjeg/FlyGrep.vim' }
    -- , {
    --   'vijaymarupudi/nvim-fzf'
    -- , config = function()
    --   local fzf = require('fzf')

    --   coroutine.wrap(function()
    --     local result = fzf.fzf({'choice 1', 'choice 2'})
    --     if result then
    --       print(result[1])
    --     end
    --   end)()
    -- end
    -- }

    ---  themes
    ---
    -- , { 'flazz/vim-colorschemes' }
    -- , { 'morhetz/gruvbox' }
    -- , { 'gruvbox-community/gruvbox' }

    -- , {
    --   'sainnhe/gruvbox-material'
    --   -- , event = 'ColorSchemePre'
    --   , init = function()
    --     local g = vim.g
    --     g.gruvbox_material_better_performance          = 1         -- default: 0 ( off )

    --     g.gruvbox_material_background                  = 'hard'    -- default: 'medium'
    --     -- g.gruvbox_material_transparent_background    = 1           -- default: 0 ( off )
    --     g.gruvbox_material_visual                      = 'reverse' -- default: 'grey background'
    --     g.gruvbox_material_sign_column_background      = 'none'    -- default: 'default'
    --     g.gruvbox_material_diagnostic_line_highlight   = 1         -- default: 0 ( off )
    --     -- g.gruvbox_material_current_word              = 'bold'      -- default: 'grey background'
    --     -- g.gruvbox_material_statusline_style          = 'original'  -- default: 'default'
    --     g.gruvbox_material_lightline_disable_bold      = 1         -- default: 0 ( off )
    --     g.gruvbox_material_enable_italic               = 1         -- default: 1 ( on )
    --   end
    -- }

    -- , {
    --   'RRethy/nvim-base16'
    --   , event = 'ColorSchemePre'
    -- }

    -- , {
    --   'siduck76/nvim-base16.lua'
    --   , config = function()
    --     local base16 = require 'base16'
    --     base16(base16.themes('mountaineer'), true)
    --   end
    -- }

    , {
      'sainnhe/everforest'
      -- , fn = 'require("telescope.builtin").colorscheme'
    }

    -- , {
    --   'eddyekofo94/gruvbox-material.nvim'
    --   -- , config = function ()
    --   --   require 'theme.gruvbox.material'
    --   -- end
    -- }

    -- , {
    --   'eddyekofo94/gruvbox-flat.nvim'
    -- }

    -- , {
    --   'monsonjeremy/onedark.nvim'
    -- }

    -- , {
    --   'ii14/onedark.nvim'
    -- }

    -- , {
    --   'NTBBloodbath/doom-one.nvim'
    --   , config = function()
    --     require 'theme.doom-one'
    --   end
    -- }

    ---
    ---  theme : Lush Colorschemes
    ---
    -- , {
    --   'rktjmp/lush.nvim'
    -- }

    -- , {
    --   'savq/melange'
    -- }

    -- , {
    --   'kunzaatko/nord.nvim'
    --   , init = function()
    --     local g = vim.g
    --     g.italic = 1
    --     g.nord_italic_comments = 1
    --   end
    -- }
    ---
    ---  end section
    ---

    -- , {
    --   'lambdalisue/glyph-palette.vim'
    -- end
    -- }
    -- , {
    --   'vigoux/oak'
    -- }

    -- , {
    --   'Shatur/neovim-ayu'
    --   , config = function()
    --     require 'theme.ayu'
    --   end
    -- }

    -- , {
    --   'Luxed/ayu-vim'
    --   , config = function()
    --     require 'theme.ayu.setup'
    --   end
    -- }

    -- , {
    --   'ayu-theme/ayu-vim'
    --   , init = function()
    --     local g = vim.g
    --     g.ayucolor = 'dark'
    --     -- g.ayucolor = 'mirage'
    --   end
    -- }

    -- , {
    --   'LunarVim/darkplus.nvim'
    -- }

    -- , {
    -- 'marko-cerovac/material.nvim'
    --   , lazy = false
    --   , config = function()
    --     require 'theme.material'
    --   end
    -- }

    ---
    ---  theme : status lines
    ---

    -- , {
    --   'glepnir/galaxyline.nvim'
    --   , branch = 'main'
    --   , config = function()
    --     require 'my_statusline'
    --   end
    -- }

    -- , {
    --   'windwp/windline.nvim'
    -- }

    -- , {
    --   'nvim-lua/lsp-status.nvim'
    -- }

    , {
      'nvim-lualine/lualine.nvim'
      , event = 'BufReadPost'
      -- , event = 'VeryLazy'
      , config = function()
        -- vim.schedule( function()
        require 'configs.lualine'
        -- end)
      end
    }

    -- , {
    --   'famiu/feline.nvim'
    --   , config = function()
    --     require 'feline'.setup()
    --   end
    -- }

    ---
    ---  theme : other
    ---  #ffff00
    , {
      'NvChad/nvim-colorizer.lua'
      , event = 'CursorHold'
      , config = function()
        require 'colorizer'.setup()
      end
    }
    -- , { 'fatih/molokai' }

    --- :h nvim_tree_hightlight
    ---
    , {
      'nvim-tree/nvim-web-devicons'
    }
    -- , {
    --   'lambdalisue/glyph-palette.vim'
    --   , event = 'CursorHold'
    -- }
    -- , {
    --   'yamatsum/nvim-nonicons'
    -- }
    , {
      'nvim-tree/nvim-tree.lua'
      , config = function()
        require 'configs.filetree.nvim-tree'
      end
    }
    , {
      'nvim-neo-tree/neo-tree.nvim'
      , dependencies = {
        'MunifTanjim/nui.nvim'
      }
      , cmd = 'Neotree'
      , config = function()
        require 'configs.filetree.neo-tree'
      end
    }
    , {
      'mrbjarksen/neo-tree-diagnostics.nvim'
    }
    -- , { 'hardcoreplayers/spaceline.vim' }
    -- , { 'glepnir/spaceline.vim' }
    -- , { 'ryanoasis/vim-devicons' }
    -- , { 'ryanoasis/nerd-fonts' }

    ---  language navigation
    ---
    -- , { 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
    -- , { 'liuchengxu/vista.vim', { 'on' : 'Vista!!' }

    ---  editor configs
    ---
    -- , { 'editorconfig/editorconfig-vim' }

    ---  convenience
    ---
    -- , { 'benekastah/neomake' }
    -- , { 'preservim/nerdcommenter' }
    -- , {
    --   'b3nj5m1n/kommentary'
    --   , event = 'CursorHold'
    --   , init = function()
    --     local g = vim.g
    --     -- do not load the default kommentary mappings
    --     g.kommentary_create_default_mappings = false
    --   end
    --   , config = function()
    --     require 'configs.kommentary'
    --   end
    -- }
    , {
      'numToStr/Comment.nvim'
      , event = 'CursorHold'
      , config = function()
        require 'configs.comment'
      end
    }

    ---  file trees
    ---
    -- , { 'justinmk/vim-dirvish' }

    ---  version control systems
    ---
    -- , { 'Xuyuanp/nerdtree-git-plugin' }
    -- , { 'tpope/vim-fugitive' }
    -- , { 'jlfwong/vim-mercenary' }
    -- , {
    --   'ludovicchabant/vim-lawrencium',
    --   cmd = 'Hg'
    -- }
    -- , { 'gregsexton/gitv' }
    -- , { 'airblade/vim-gitgutter' }
    -- , { 'mhinz/vim-signify' }

    , {
      'lewis6991/gitsigns.nvim'
      , event = 'UIEnter'
      , config = function()
        require 'configs.git.signs'
      end
    }

    ---  guides
    ---
    , {
      'lukas-reineke/indent-blankline.nvim'
      , config = function()
        require 'configs.indentation.blankline'
      end
    }

    ---  performance
    ---
    , {
      'tweekmonster/startuptime.vim'
      , cmd = 'StartupTime'
    }
    -- ,   'norcalli/profiler.nvim'

    ---  braces
    ---
    -- , { 'rstacruz/vim-closer' }
    -- , { 'jiangmiao/auto-pairs' }
    , {
      'windwp/nvim-autopairs'
      -- , event = 'CursorHold'
      , event = 'InsertEnter'
      , config = function()
        require 'configs.autopairs'
      end
    }

    ---  language syntax
    ---
, {
      'ckipp01/nvim-jenkinsfile-linter'
      , event = 'BufRead Jenkinsfile'
    }
    , {
      'martinda/Jenkinsfile-vim-syntax'
      , event = 'BufRead Jenkinsfile'
    }
    , {
      'gisphm/vim-gradle'
      , event = 'BufRead *.gradle'
    }
    -- , {
    --   'sheerun/vim-polyglot'
    --   , config = function()
    --     require 'configs.polyglot'
    --   end
    -- }
    -- , {
    --   'pearofducks/ansible-vim'
    --   , init = function()
    --     vim.g.ansible_extra_keywords_highlight = true
    --   end
    -- }
    -- , { 'udalov/kotlin-vim' }
    -- , { 'scrooloose/syntastic' }
    -- , { 'w0rp/ale' }
    -- , { 'prurigro/vim-polyglot-darkcloud' }
    -- , { 'dleonard0/pony-vim-syntax' }
    -- , { 'saltstack/salt-vim' }
    -- , { 'fatih/vim-go' }
    -- , { 'garyburd/go-explorer' }
    -- , { 'glench/vim-jinja2-syntax' }
    -- , { 'PProvost/vim-ps1' }
    -- , { 'lambdatoast/elm.vim' }
    -- , { 'ElmCast/elm-vim' }
    -- , { 'google/vim-jsonnet' }
    -- , { 'zinit-zsh/zinit-vim-syntax' }
    -- , { 'numirias/semshi', {'do': ':UpdateRemoteuseins'}

    ---  annoyances
    ---
    -- , {
    --   'ntpeters/vim-better-whitespace'
    --   , event = 'CursorHold'
    --   , config = function()
    --     require 'configs.whitespace.setup'
    --   end
    -- }

    ---  automation ?
    ---
    -- , { 'tpope/vim-surround' }
    -- , { 'terryma/vim-multiple-cursors' }
    -- , { 'jszakmeister/vim-togglecursor' }
    -- , { 'matze/vim-move' }
    ---  Utility - Alignment
    , {
      'junegunn/vim-easy-align'
      , cmd = 'EasyAlign'
    }
    -- , {
    --   'max397574/better-escape.nvim'
    --   , event = 'InsertEnter'
    --   , config = function()
    --     require 'configs.tweaks.escape'
    --   end
    -- }
    --, { 'godlygeek/tabular' }

    ---  preview panels
    ---
    -- , { 'atweiden/vim-uzbl' }
    -- , { 'xu-cheng/brew.vim' }

    ---  service hooks
    ---
    -- , { 'mrtazz/simplenote.vim' }


    -- , {'lervag/vimtex', opt=true }

    ---  Zettelkasten
    ---
    -- , {
    --   'megalithic/zk.nvim'
    -- }

    ---  Notes & Org Mode
    ---
    -- , {
    --   'nvim-orgmode/orgmode.nvim'
    --   , lazy = true
    --   , ft = 'org'
    --   -- , dependencies = {
    --   --   'milisims/tree-sitter-org'
    --   --   , 'akinsho/org-bullets.nvim'
    --   -- }
    --   , config = function()
    --     require 'configs.orgmode'
    --   end
    -- }
    -- , {
    --   'milisims/tree-sitter-org'
    --   , config = function()
    --     require 'configs.treesitter.parsers.org'
    --   end
    -- }
    -- , {
    --   'akinsho/org-bullets.nvim'
    --   , config = function()
    --     require('org-bullets').setup {
    --       symbols = { '◉', '○', '✸', '✿' }
    --     }
    --   end
    -- }
    , {
      'nvim-neorg/neorg-telescope'
      , lazy = true
    }
    , {
      'nvim-neorg/neorg'
      -- , build = ":Neorg sync-parsers"
      , ft = 'norg'
      , config = function()
        require 'packer'.loader('neorg-telescope')
        require 'configs.neorg'
      end
    }

    --- xcode work-alike
    ---
    , {
      'xbase-lab/xbase'
      , build = 'make install'
      , lazy = 'true'
      , config = function()
        require 'configs.xbase'
      end
    }
  }
}
