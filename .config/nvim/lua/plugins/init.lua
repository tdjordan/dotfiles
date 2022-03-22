----------
---
---  Plugins
---
----------

local M = {}

-- local packer_lazy_load = function(plugin, timer)
--   if plugin then
--     timer = timer or 0
--     vim.defer_fn(function()
--       require 'packer'.loader(plugin)
--     end, timer)
--   end
-- end

---  Install all the plugins
---
M.init_packer = function ()
  local packer = require 'packer'

  packer.startup({
    function(use)
      ---  Filetype Identification Replacement
      ---
      -- use {
      --   'nathom/filetype.nvim'
      --   , config = function()
      --     require 'configs.filetype'
      --   end
      -- }

      ---  lua performance
      ---
      use {
        'lewis6991/impatient.nvim'
        -- , config = function()
        --   require 'impatient'.enable_profile()
        -- end
      }

      ---  Packer itself
      ---
      use {
        'wbthomason/packer.nvim'
        , opt = true
      }

      ---  Browser Integration
      ---
      -- use {
      --   'glacambre/firenvim'
      --   , run = function()
      --     vim.fn['firenvim#install'](0)
      --   end
      --   , config = function()
      --     require 'configs.firenvim'
      --   end
      -- }

      ---  Notifications
      ---
      use {
        'rcarriga/nvim-notify'
        -- , event = 'BufReadPost'
        , config = function()
          require 'configs.notify'
        end
      }

      ---  Lua Information
      ---
      use {
        'nanotee/nvim-lua-guide'
        , opt = true
      }

      ---  Language Protocol Server - LSP
      ---
      use {
        'neovim/nvim-lspconfig'
        , event = 'CursorHold'
        , config = function()
          require 'lsp'
        end
      }
      use {
        'b0o/schemastore.nvim'
      }
      use {
        'jose-elias-alvarez/null-ls.nvim'
        , after = 'nvim-lspconfig'
        , module_pattern = 'null-ls.*'
        , config = function()
          require 'configs.lsp.null'
        end
      }
      use {
        'williamboman/nvim-lsp-installer'
        , after = 'nvim-lspconfig'
        , config = function()
          require 'configs.lsp.installer'
        end
      }

      ---  LSP Extensions
      ---
      -- use {
      --   'glepnir/lspsaga.nvim'
      --   , after = 'nvim-lspconfig'
      --   , config = function()
      --     require 'configs.lsp.saga'
      --   end
      -- }

      -- use {
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

      use {
        'folke/todo-comments.nvim'
        -- , requires = 'nvim-lua/plenary.nvim'
        , event = 'CursorHold'
        , module_pattern = 'todo-comments.*'
        , config = function()
          require 'configs.todo.comments'
        end
      }

      use {
        'simrat39/symbols-outline.nvim'
        , event = 'CursorHold'
        , config = function()
          require 'configs.symbols.outline'
        end
      }

      use {
        'simrat39/rust-tools.nvim'
        , after = 'nvim-lspconfig'
      }

      ---  Inlay Hints for rust-analyzer
      ---
      -- use {
      --   'nvim-lua/lsp_extensions.nvim'
      --   , after = 'nvim-lspconfig'
      -- }

      ---  Is this now just built in?
      ---
      -- use   'tjdevries/nlua.nvim'

      ---  Auto Completion
      ---
      use {
        'onsails/lspkind-nvim'
        , module_pattern = 'lspkind.*'
        , config = function()
          require 'configs.lsp.kind'
        end
      }
      use {
        'hrsh7th/nvim-cmp'
        , after = 'LuaSnip'
        , module_pattern = 'cmp.*'
        , config = function()
          require 'configs.completion.cmp'
        end
      }
      use {
        'hrsh7th/cmp-buffer'
        , after = 'nvim-cmp'
        , wants = 'nvim-cmp'
        , module_pattern = 'cmp.*'
      }
      use {
        'hrsh7th/cmp-nvim-lua'
        , ft = 'lua'
        , wants = 'nvim-cmp'
        , module_pattern = 'cmp.*'
      }
      use {
        'hrsh7th/cmp-nvim-lsp'
        -- , event = 'InsertEnter'
        , after = 'nvim-cmp'
        , wants = 'nvim-cmp'
        , module_pattern = 'cmp.*'
        , config = function()
          require 'cmp_nvim_lsp'._on_insert_enter()
        end
      }
      use {
        'hrsh7th/cmp-path'
        , after = 'nvim-cmp'
        , wants = 'nvim-cmp'
        , module_pattern = 'cmp.*'
      }
      use {
        'hrsh7th/cmp-cmdline'
        , after = 'nvim-cmp'
        , config = function()
          require 'configs.completion.cmp.cmdline'
        end
      }
      use {
        'hrsh7th/cmp-calc'
        , after = 'nvim-cmp'
        -- , wants = 'nvim-cmp'
        -- , module_pattern = 'cmp.*'
      }
      -- use {
      --   'David-Kunz/cmp-npm'
      --   , opt = true
      --   , after = 'nvim-cmp'
      --   , config = function()
      --     require 'configs.completion.cmp.npm'
      --   end
      -- }
      -- use {
      --   'andersevenrud/compe-tmux'
      --   , branch = 'cmp'
      --   , after = 'nvim-cmp'
      -- }
      -- use {
      --   'ray-x/cmp-treesitter'
      --   , after = 'nvim-cmp'
      --   , wants = 'nvim-cmp'
      --   , module_pattern = 'cmp.*'
      -- }
      use {
        'quangnguyen30192/cmp-nvim-tags'
        , after = 'nvim-cmp'
        -- , wants = 'nvim-cmp'
        -- , module_pattern = 'cmp.*'
      }
      -- use {
      --   'hrsh7th/cmp-look'
      -- }
      -- use {
      --   'hrsh7th/cmp-emoji'
      -- }
      -- use {
      --   'hrsh7th/cmp-vsnip'
      --   , after = 'nvim-cmp'
      -- }
      use {
        'petertriho/cmp-git'
        , after = 'nvim-cmp'
        -- , module_pattern = 'cmp_git.*'
        , config = function()
          require 'configs.completion.cmp.git'
        end
      }
      use {
        'Saecki/crates.nvim'
        , event = 'BufRead Cargo.toml'
        , wants = 'nvim-cmp'
        , config = function()
          require 'configs.completion.cmp.crates'
        end
      }
      use {
        'joshzcold/cmp-jenkinsfile'
        , after = 'nvim-cmp'
        , config = function()
          require 'configs.completion.cmp.jenkinsfile'
        end
      }

      ---  diagnostics
      ---
      -- use {
      --   'onsails/diaglist.nvim'
      --   , config = function()
      --     require 'configs.lsp.diaglist'
      --   end
      -- }

      ---  snippets
      ---
      -- use {
      --   'hrsh7th/vim-vsnip'
      --   , event = 'InsertEnter'
      --   , after = 'friendly-snippets'
      -- }
      -- use {
      --   'hrsh7th/vim-vsnip-integ'
      --   , event = 'InsertEnter'
      --   , after = 'vim-vsnip'
      -- }
      use {
        'rafamadriz/friendly-snippets'
        -- , event = 'InsertEnter'
      }
      -- use { 'Shougo/neosnippet' }
      -- use { 'Shougo/neosnippet-snippets' }
      -- use { 'honza/vim-snippets' }
      -- use { 'SirVer/ultisnips' }
      -- use { 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }
      use {
        'norcalli/snippets.nvim'
        , event = 'InsertEnter'
        , config = function()
          require 'configs.snippets.snippets-nvim'
        end
      }
      use {
        'L3MON4D3/LuaSnip'
        , event = 'InsertEnter'
        , module_pattern = 'luasnip.*'
        -- , config = function()
        --   require 'configs.snippets.luasnip'
        -- end
        , config = function()
          require 'configs.luasnip'
        end
      }
      use {
        'saadparwaiz1/cmp_luasnip'
        , after = 'nvim-cmp'
      }

      ---  Telescope
      ---
      use {
        'nvim-lua/plenary.nvim'
        , opt = true
        , module_pattern = 'plenary.*'
      }
      use {
        'nvim-telescope/telescope.nvim'
        , cmd = 'Telescope'
        , module_pattern = 'telescope.*'
        , config = function()
          require 'configs.telescope'
        end
      }

      ---  TODO : Add keymapping
      -- use {
      --   'nvim-telescope/telescope-packer.nvim'
      --   , opt = true
      --   -- , event = 'CursorHold'
      --   -- , after = 'telescope.nvim'
      --   -- , module_pattern = 'telescope.*'
      --   -- , config = function()
      --     -- vim.schedule()
      --     -- require 'configs.telescope.packer'
      --   -- end
      -- }

      use {
        'nvim-telescope/telescope-fzy-native.nvim'
        -- , event = 'CursorHold'
        , after = 'telescope.nvim'
        , config = function()
          require 'telescope'.load_extension('fzy_native')
        end
      }

      use {
        'nvim-telescope/telescope-project.nvim'
        -- , event = 'CursorHold'
        , after = 'telescope.nvim'
        , config = function()
          require 'configs.telescope.project'
        end
      }

      -- use {
      --   'ahmedkhalf/project.nvim'
      --   , config = function()
      --     require 'project_nvim'.setup {}
      --   end
      -- }

      ---  TODO : Add keymapping
      use {
        'camgraff/telescope-tmux.nvim'
        , cmd = 'Telescope tmux'
        , event = 'CursorHold'
      }

      ---  TODO : Add keymapping
      use {
        'nvim-telescope/telescope-symbols.nvim'
        , event = 'CursorHold'
      }

      ---  tree sitter
      ---
      use {
        'nvim-treesitter/nvim-treesitter'
        , run = ':TSUpdate'
        -- , event = 'BufReadPost'
        -- , event = 'UIEnter'
        -- , event = 'CursorHold'
        -- , module_pattern = 'treesitter.*'
        , config = function()
          require 'configs.treesitter'
        end
      }

      use {
        'nvim-treesitter/playground'
        , cmd =
          { "TSPlaygroundToggle"
          , "TSHighlightCapturesUnderCursor"
        }
      }
      -- use { 'nvim-treesitter/completion-treesitter' }
      use {
        'nvim-treesitter/nvim-treesitter-refactor'
        , event = 'CursorHold'
      }
      use {
        'nvim-treesitter/nvim-treesitter-textobjects'
        , event = 'CursorHold'
      }
      use {
        'David-Kunz/treesitter-unit'
        , event = 'CursorHold'
      }
      -- use { 'romgrk/nvim-treesitter-context' }
      -- use {
      --   'p00f/nvim-ts-rainbow'
      --   , disable = true
      --   , after = 'nvim-treesitter'
      --   , config = function()
      --     require 'configs.treesitter.rainbow'
      --   end
      -- }

      ---  quick fix
      ---
      use {
        'kevinhwang91/nvim-bqf'
        , ft = 'qf'
        , config = function()
          require 'configs.bqf'
        end
      }

      ---  rest explorations
      ---
      use {
        'NTBBloodbath/rest.nvim'
        -- , cmd = {
        --   'RestNvim'
        --   , 'RestNvimPreview'
        --   , 'RestNvimLast'
        -- }
        , ft = 'http'
        , module_pattern = 'rest-nvim.*'
        , config = function()
          require 'configs.rest'
        end
      }

      ---  history
      ---
      -- use { 'mbbill/undotree' }

      ---  terminals
      ---
      -- use { 'voldikss/vim-floaterm' }
      -- use { 'norcalli/nvim-terminal.lua' }

      ---  tmux
      ---
      -- use { 'tmux-plugins/vim-tmux' }
      use {
        'aserowy/tmux.nvim'
        , event = 'CursorHold'
        , config = function()
          require 'configs.tmux'
        end
      }

      ---  debugger
      ---
      -- use { 'puremourning/vimspector' }
      -- use { 'critiqjo/lldb.nvim' }
      use {
        'mfussenegger/nvim-dap'
        , module_pattern = 'dap.*'
        -- , setup = function()
        --   require 'utility'.packer_lazy_load 'nvim-dap'
        -- end
        , config = function()
          require 'configs.dap'
        end
      }
      use {
        'nvim-telescope/telescope-dap.nvim'
        , after =
          { 'telescope.nvim'
          , 'nvim-dap'
        }
      }
      use {
        'jbyuki/one-small-step-for-vimkind'
        , after = 'nvim-dap'
      }
      use {
        'Pocco81/DAPInstall.nvim'
        , after = 'nvim-dap'
        , config = function ()
          require 'configs.dap.install'
        end
      }

      ---  matchup
      ---
      -- use { 'andymass/vim-matchup' }
      -- use { 'jkramer/vim-checkbox' }

      ---  keymap management
      ---
      use {
        'folke/which-key.nvim'
        , event = 'CursorHold'
        , config = function()
            require 'configs.keys'
        end
      }

      ---  search
      ---
      -- use { 'rking/ag.vim' }
      -- use {
      --   'junegunn/fzf',
      --   run = 'fzf#install()'
      -- }
      -- use { 'junegunn/fzf.vim' }
      -- use { 'stsewd/fzf-checkout.vim' }
      -- use { 'junegunn/fzf',
      --  \ { 'dir': '~/.fzf', 'do': './install --all' }
      -- use { 'lotabout/skim' } --, { 'dir': '~/.skim', 'do': './install -all' }
      -- use { 'wsdjeg/FlyGrep.vim' }
      -- use {
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
      -- use { 'flazz/vim-colorschemes' }
      -- use { 'morhetz/gruvbox' }
      -- use { 'gruvbox-community/gruvbox' }

      -- TODO

      -- use {
      --   'sainnhe/gruvbox-material'
      --   -- , event = 'ColorSchemePre'
      --   , setup = function()
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

      -- use {
      --   'RRethy/nvim-base16'
      --   , event = 'ColorSchemePre'
      -- }

      -- use {
      --   'siduck76/nvim-base16.lua'
      --   , config = function()
      --     local base16 = require 'base16'
      --     base16(base16.themes('mountaineer'), true)
      --   end
      -- }

      use {
        'sainnhe/everforest'
        , event = 'CursorMoved'
      }

      use {
        'eddyekofo94/gruvbox-material.nvim'
        , event = 'CursorMoved'
        -- , config = function ()
        --   require "theme.gruvbox.material"
        -- end
      }

      -- use {
      --   'eddyekofo94/gruvbox-flat.nvim'
      --   , event = 'CursorMoved'
      -- }

      -- use {
      --   'monsonjeremy/onedark.nvim'
      --   , event = 'CursorMoved'
      -- }

      -- use {
      --   'ii14/onedark.nvim'
      --   , event = 'CursorMoved'
      -- }

      use {
        'NTBBloodbath/doom-one.nvim'
        -- , event = 'CursorMoved'
        , keys = "<leader>pc"
        , config = function()
          require 'theme.doom-one'
        end
        -- , disable = not vim.g.cfg.theme.doomone.active
      }

      use {
        'folke/tokyonight.nvim'
        -- , event = 'CursorMoved'
        , module_pattern = 'telescope.builtin.*'
        , setup = function()
          local g = vim.g
          g.tokyonight_style = 'storm'
          g.tokyonight_terminal_colors = true
          g.tokyonight_italic_comments = true
          g.tokyonight_italic_keywords = true
          g.tokyonight_italic_functions = true
        end
      }

      ---
      ---  theme : Lush Colorschemes
      ---
      -- use {
      --   'rktjmp/lush.nvim'
      --   , module_pattern = 'lush.*'
      -- }

      -- use {
      --   'savq/melange'
      --   -- , event = {
      --   --   'ColorschemePre'
      --   --   , 'BufReadPost'
      --   -- }
      --   , event = 'CursorMoved'
      -- }

      -- TODO
      -- use {
      --   'metalelf0/jellybeans-nvim'
      --   , event = 'CursorMoved'
      --   , requires = { 'rktjmp/lush.nvim' }
      -- }

      -- use {
      --   'nanotech/jellybeans.vim'
      --   , event = 'CursorMoved'
      --   , setup = function()
      --     vim.g.jellybeans_use_term_italics = 1
      --   end
      -- }

      -- use {
      --   'kunzaatko/nord.nvim'
      --   , event = 'CursorMoved'
      --   , setup = function()
      --     local g = vim.g
      --     g.italic = 1
      --     g.nord_italic_comments = 1
      --   end
      -- }



      -- use {
      --   'lambdalisue/glyph-palette.vim'
        -- end
      -- }
      use {
        'EdenEast/nightfox.nvim'
        , event = 'CursorHold'
        -- , event = 'CursorMoved'
        , module_pattern = 'nightfox.*'
        , config = function()
          require 'theme.nightfox'
        end
      }

      -- use {
      --   'vigoux/oak'
      --   , event = 'CursorMoved'
      -- }

      -- use {
      --   'Shatur/neovim-ayu'
      --   , config = function()
      --     require 'theme.ayu'
      --   end
      -- }
      -- use {
      --   'Luxed/ayu-vim'
      --   , event = 'CursorMoved'
      --   , config = function()
      --     require 'theme.ayu.setup'
      --   end
      -- }
      use {
        'ayu-theme/ayu-vim'
        , event = 'CursorMoved'
        , setup = function()
          local g = vim.g
          g.ayucolor = 'dark'
          -- g.ayucolor = 'mirage'
        end
      }

      use {
        'LunarVim/onedarker.nvim'
        -- , event = 'UIEnter'
        , event = 'CursorMoved'
        -- , config = function()
        --   require 'theme.onedarker'
        -- end
      }

      use {
        'LunarVim/darkplus.nvim'
        , event = 'CursorMoved'
      }

      -- TODO
      use {
        'marko-cerovac/material.nvim'
        -- , event = 'CursorMoved'
        -- , module = 'material'
        , config = function()
          require 'theme.material'
        end
      }

      -- use {
      --   'maaslalani/nordbuddy',
      --   requires = {
      --     'tjdevries/colorbuddy.vim'
      --   }
      -- }
      -- use {
      --   'tjdevries/gruvbuddy.nvim',
      --   requires = {
      --     'tjdevries/colorbuddy.vim'
      --   }
      -- }
      -- use { 'vim-airline/vim-airline' }
      -- use { 'vim-airline/vim-airline-themes' }
      -- use { 'itchyny/lightline.vim' }
      ---
      --- theme : status lines
      ---
      -- use {
      --   'glepnir/galaxyline.nvim'
      --   , branch = 'main'
      --   , config = function()
      --     require 'my_statusline'
      --   end
      -- }
      -- use {
      --   'windwp/windline.nvim'
      -- }

      -- use {
      --   'nvim-lua/lsp-status.nvim'
      --   , after = 'nvim-lspconfig'
      -- }

      use {
        'nvim-lualine/lualine.nvim'
        , event = 'BufReadPost'
        -- , event = 'CursorHold'
        -- , event = 'CursorMoved'
        , module = 'lualine'
        , config = function()
          require 'configs.lualine'
        end
      }

      -- use {
      --   'famiu/feline.nvim'
      --   , config = function()
      --     require 'feline'.setup()
      --   end
      -- }
      ---
      --- theme : other
      --- #ffff00
      use {
        'norcalli/nvim-colorizer.lua'
        , event = 'CursorHold'
        , setup = function()
        end
        , config = function()
          require 'colorizer'.setup()
        end
      }
      -- use { 'fatih/molokai' }

      --- :h nvim_tree_hightlight
      ---
      use {
        'kyazdani42/nvim-web-devicons'
        , event = 'CursorHold'
      }
      -- use {
      --   'lambdalisue/glyph-palette.vim'
      --   , event = 'CursorHold'
      -- }
      -- use {
      --   'yamatsum/nvim-nonicons'
      --   , after = 'nvim-web-devicons'
      -- }
      use {
        'kyazdani42/nvim-tree.lua'
        -- , cmd =
        --   { 'NvimTreeClipboard'
        --   , 'NvimTreeClose'
        --   , 'NvimTreeFindFile'
        --   , 'NvimTreeOpen'
        --   , 'NvimTreeRefresh'
        --   , 'NvimTreeToggle'
        -- }
        -- , module_pattern = 'nvim-tree.*'
        , setup = function()
          require 'configs.filetree.nvim-tree.setup'
        end
        , config = function()
          require 'configs.filetree.nvim-tree'
        end
      }
      -- use { 'hardcoreplayers/spaceline.vim' }
      -- use { 'glepnir/spaceline.vim' }
      -- use { 'ryanoasis/vim-devicons' }
      -- use { 'ryanoasis/nerd-fonts' }

      ---  language navigation
      ---
      -- use { 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
      -- use { 'liuchengxu/vista.vim', { 'on' : 'Vista!!' }

      ---  editor configs
      ---
      -- use { 'editorconfig/editorconfig-vim' }

      ---  convenience
      ---
      -- use { 'benekastah/neomake' }
      -- use { 'preservim/nerdcommenter' }
      -- use {
      --   'b3nj5m1n/kommentary'
      --   , event = 'CursorHold'
      --   , setup = function()
      --     local g = vim.g
      --     -- do not load the default komentary mappings
      --     g.kommentary_create_default_mappings = false
      --   end
      --   , config = function()
      --     require 'configs.kommentary'
      --   end
      -- }
      use {
        'numToStr/Comment.nvim'
        , event = 'CursorHold'
        , config = function()
          require 'configs.comment'
        end
      }

      ---  file trees
      -- use { 'justinmk/vim-dirvish' }

      ---  version control systems
      ---
      -- use { 'Xuyuanp/nerdtree-git-plugin' }
      -- use { 'tpope/vim-fugitive' }
      -- use { 'jlfwong/vim-mercenary' }
      -- use {
      --   'ludovicchabant/vim-lawrencium',
      --   cmd = 'Hg'
      -- }
      -- use { 'gregsexton/gitv' }
      -- use { 'airblade/vim-gitgutter' }
      -- use { 'mhinz/vim-signify' }

      use {
        'lewis6991/gitsigns.nvim'
        , event = 'CursorHold'
        , config = function()
          require 'configs.git.signs'
        end
      }

      ---  guides
      ---
      use {
        'lukas-reineke/indent-blankline.nvim'
        , cmd = 'IndentBlanklineToggle'
        , module_pattern = 'indent_blankline.*'
        , config = function()
          require 'configs.indentation.blankline'
        end
      }

      ---  performance
      ---
      use {
        'tweekmonster/startuptime.vim'
        , cmd = 'StartupTime'
      }
      -- use   'norcalli/profiler.nvim'

      ---  braces
      ---
      -- use { '9mm/vim-closer' }
      -- use { 'jiangmiao/auto-pairs' }
      use {
        'windwp/nvim-autopairs'
        , event = 'CursorHold'
        , config = function()
          require 'configs.autopairs'
        end
      }

      ---  language syntax
      ---
      use {
        'ckipp01/nvim-jenkinsfile-linter'
        , event = 'BufRead Jenkinsfile'
      }
      use {
        'martinda/Jenkinsfile-vim-syntax'
        , event = 'BufRead Jenkinsfile'
      }
      use {
        'gisphm/vim-gradle'
        , event = 'BufRead *.gradle'
      }
      -- use {
      --   'sheerun/vim-polyglot'
      --   , after = 'nvim-treesitter'
      --   , config = function()
      --     require 'configs.polyglot'
      --   end
      -- }
      -- use {
      --   'pearofducks/ansible-vim'
      --   , setup = function()
      --     vim.g.ansible_extra_keywords_highlight = true
      --   end
      -- }
      -- use { 'udalov/kotlin-vim' }
      -- use { 'scrooloose/syntastic' }
      -- use { 'w0rp/ale' }
      -- use { 'prurigro/vim-polyglot-darkcloud' }
      -- use { 'dleonard0/pony-vim-syntax' }
      -- use { 'saltstack/salt-vim' }
      -- use { 'fatih/vim-go' }
      -- use { 'garyburd/go-explorer' }
      -- use { 'glench/vim-jinja2-syntax' }
      -- use { 'PProvost/vim-ps1' }
      -- use { 'lambdatoast/elm.vim' }
      -- use { 'ElmCast/elm-vim' }
      -- use { 'google/vim-jsonnet' }
      -- use { 'zinit-zsh/zinit-vim-syntax' }
      -- use { 'numirias/semshi', {'do': ':UpdateRemoteuseins'}

      ---  annoyances
      ---
      use {
        'ntpeters/vim-better-whitespace'
        , event = 'CursorHold'
        , after = 'which-key.nvim'
        , setup = function()
          require 'configs.whitespace.setup'
        end
      }

      ---  automation ?
      ---
      -- use { 'tpope/vim-surround' }
      -- use { 'terryma/vim-multiple-cursors' }
      -- use { 'jszakmeister/vim-togglecursor' }
      -- use { 'matze/vim-move' }
      ---  Utility - Alignment
      use {
        'junegunn/vim-easy-align'
        , cmd = 'EasyAlign'
      }
      -- use {
      --   'max397574/better-escape.nvim'
      --   , event = 'InsertEnter'
      --   , config = function()
      --     require 'configs.tweaks.escape'
      --   end
      -- }
      --use { 'godlygeek/tabular' }

      ---  preview panels
      ---
      -- use { 'atweiden/vim-uzbl' }
      -- use { 'xu-cheng/brew.vim' }

      ---  service hooks
      ---
      -- use { 'mrtazz/simplenote.vim' }


      -- use {'lervag/vimtex', opt=true }

      ---  Zettelkasten
      ---
      -- use {
      --   'megalithic/zk.nvim'
      --   , after = 'nvim-telescope'
      -- }

      ---  Notes & Org Mode
      ---
      use {
        'kristijanhusak/orgmode.nvim'
        , opt = true
        , ft = 'org'
        , config = function()
          require 'configs.orgmode'
        end
      }
      -- use {
      --   'milisims/tree-sitter-org'
      --   , after = 'orgmode.nvim'
      --   , config = function()
      --     require 'configs.treesitter.parsers.org'
      --   end
      -- }
      use {
        'akinsho/org-bullets.nvim'
        , after = 'orgmode.nvim'
        , config = function()
          require("org-bullets").setup {
            symbols = { "◉", "○", "✸", "✿" }
          }
        end
      }
      use {
        'nvim-neorg/neorg'
        , ft = 'norg'
        , after = 'nvim-treesitter'
        , config = function()
          require 'configs.neorg'
        end
      }
    end
    , config = {
      compile_path = vim.fn.stdpath('config') .. '/lua/packer_compiled.lua',
      max_jobs = 70,
      profile = {
        enable = true
      }
      -- , display = {
      --   open_fn = function()
      --     return require 'packer.util'.float { border = 'single' }
      --   end
      -- }
    }
  })
end

return M
