----------
---
---  Plugins
---
----------

-- local g       = vim.g
-- local cmd     = vim.cmd
-- local fn      = vim.fn
-- local input   = fn.input
-- local system  = fn.system
-- local execute = vim.api.nvim_command

local M = {}

---  Install all the plugins
---
M.init_packer = function ()
  local packer = require 'packer'

  packer.startup({
    function(use)
      ---  Packer itself
      ---
      use {
        'wbthomason/packer.nvim'
        , opt = true
        -- , event = 'VimEnter'
        -- , module_pattern = 'packer.*'
        -- , setup = function()
        --   vim.cmd [[ packeradd packer.nvim ]]
        -- end
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
        , after = 'nvim-treesitter'
        , config = function()
          require 'lsp'
        end
      }

      ---  LSP Extenstions
      ---
      -- use {
      --   'glepnir/lspsaga.nvim'
      --   , after = 'nvim-lspconfig'
      --   , config = function()
      --     require 'configs.lspsaga'
      --   end
      -- }

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
        'hrsh7th/nvim-compe'
        , event = 'InsertEnter'
        -- , after = {
        --   'LuaSnip'
        --   , 'snippets.nvim'
        -- }
        , module_pattern = 'compe.*'
        , config = function()
          require 'configs.compe'
        end
      }

      ---  snippets
      ---
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
      -- use {
      --   'L3MON4D3/LuaSnip'
      --   , event = 'CursorHold'
      --   -- , config = function()
      --   --   require 'configs.snippets.luasnip'
      --   -- end
      --   -- , config = function()
      --   --   require 'configs.luasnip'
      --   -- end
      -- }
      -- use {
      --   'rafamadriz/friendly-snippets'
      --   , event = 'CursorHold'
      -- }

      ---  Telescope
      ---
      use {
        'nvim-lua/plenary.nvim'
        , opt = true
        , module_pattern = 'plenary.*'
      }
      use {
        'nvim-lua/popup.nvim'
        , module_pattern = 'popup.*'
      }
      use {
        'nvim-telescope/telescope.nvim'
        , cmd = 'Telescope'
        , module_pattern = 'telescope.*'
        , after = 'popup.nvim'
        , config = function()
          require 'configs.telescope'
        end
      }

      ---  TODO : Add keymapping
      use {
        'nvim-telescope/telescope-packer.nvim'
        , after = 'telescope.nvim'
      }

      use {
        'nvim-telescope/telescope-fzy-native.nvim'
        , after = 'telescope.nvim'
        , config = function()
          require 'telescope'.load_extension('fzy_native')
        end
      }

      use {
        'nvim-telescope/telescope-project.nvim'
        , after = 'telescope.nvim'
        , config = function()
          require 'configs.telescope.project'
        end
      }

      ---  TODO : Add keymapping
      use {
        'camgraff/telescope-tmux.nvim'
        , cmd = 'Telescope tmux'
        , after = 'telescope.nvim'
      }

      ---  TODO : Add keymapping
      use {
        'nvim-telescope/telescope-symbols.nvim'
        , after = 'telescope.nvim'
      }

      ---  tree sitter
      ---
      use {
        'nvim-treesitter/nvim-treesitter'
        , run = ':TSUpdate'
        , event = 'CursorHold'
        , cmd =
          { 'TSBufEnable'
          , 'TSBufDisable'
          , 'TSBufToggle'
          , 'TSEnableAll'
          , 'TSDisableAll'
          , 'TSToggleAll'
          , 'TSEditQuery'
          , 'TSEditQueryAfter'
          , 'TSModuleInfo'
          , 'TSInstallInfo'
          , 'TSInstall'
          , 'TSInstallSync'
          , 'TSUpdate'
          , 'TSUpdateSync'
          , 'TSUninstall'
        }
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
        , after = 'nvim-treesitter'
      }
      use {
        'nvim-treesitter/nvim-treesitter-textobjects'
        , after = 'nvim-treesitter'
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
      -- TODO
      use {
        'kevinhwang91/nvim-bqf'
        , event = 'InsertEnter'
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
      --     -- g.gruvbox_material_transparent_background    = 1           -- defualt: 0 ( off )
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

      use {
        'eddyekofo94/gruvbox-flat.nvim'
        , event = 'CursorMoved'
      }

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
        , event = 'CursorMoved'
        , setup = function()
          local g = vim.g
          -- g.doom_one_enable_treesitter      = true -- default: true
          g.doom_one_terminal_colors        = true -- default: false
          g.doom_one_italic_comments        = true -- default: false
          -- g.doom_one_transparent_background = true -- default: false
          g.doom_one_cursor_coloring        = true -- default: false
          g.doom_one_telescope_highlights   = true -- default: false
        end
      }

      use {
        'folke/tokyonight.nvim'
        , event = 'CursorMoved'
        , setup = function()
          local g = vim.g
          g.tokyonight_style = "night"
          g.tokyonight_terminal_colors = true
          g.tokyonight_dark_sidebar = false
          g.tokyonight_italic_comments = true
          g.tokyonight_italic_keywords = true
          -- g.tokyonight_italic_functions = true
          -- g.tokyonight_italic_variables = true
          -- g.tokyonight_sidebars = { 'terminal' }
          -- g.tokyongiht_dark_float = true
        end
      }

      ---
      ---  theme : Lush Colorschemes
      ---
      use {
        'rktjmp/lush.nvim'
        , module_pattern = 'lush.*'
      }

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

      use {
        'kunzaatko/nord.nvim'
        , event = 'CursorMoved'
        , setup = function()
          local g = vim.g
          g.italic = 1
          g.nord_italic_comments = 1
        end
      }

      use {
        'EdenEast/nightfox.nvim'
        , event = 'CursorMoved'
        , module_pattern = 'nightfox'
        , setup = function()
          local g = vim.g
          g.nightfox_style = 'nordfox'
          -- g.nightfox_transparent = false
          -- g.nightfox_terminal_colors = true
          g.nightfox_italic_comments = true
          g.nightfox_italic_functions = true
          g.nightfox_italic_keywords = true
          -- g.nightfox_italic_strings = false
          -- g.nightfox_italic_variables = false
          -- g.nightfox_color_delimiter = ''
          -- g.nightfox_colors = {}
        end
        , config = function()
          require 'nightfox'.set()
        end
      }
      use {
        'ful1e5/onedark.nvim'
        , event = 'CursorMoved'
        -- , config = function()
        --   require 'theme.onedark'
        -- end
      }

      -- use {
      --   'vigoux/oak'
      --   , event = 'CursorMoved'
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

      -- use {
      --   'yong1le/darkplus.nvim'
      --   , event = 'CursorMoved'
      -- }

      -- TODO
      use {
        'marko-cerovac/material.nvim'
        , event = 'CursorMoved'
        , module = 'material'
        , setup = function()
          local g = vim.g
          -- g.material_style = 'deep ocean'
          g.material_style = 'darker'
          g.material_italic_comments = true
          g.material_italic_keywords = true
          -- g.material_italic_functions = true
          -- g.material_italic_variables = true
          -- g.material_borders = true
          g.material_contrast = true
          -- g.material_disable_background = true
        end
        -- , config = function()
        --   require 'material'.set()
        -- end
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
        'hoob3rt/lualine.nvim'
        , event = 'BufReadPost'
        , module = 'lualine'
        , config = "require 'configs.lualine'"
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
        , cmd =
          { 'NvimTreeClipboard'
          , 'NvimTreeClose'
          , 'NvimTreeFindFile'
          , 'NvimTreeOpen'
          , 'NvimTreeRefresh'
          , 'NvimTreeToggle'
        }
        , setup = function()
          require 'configs.filetree.nvim-tree.setup'
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

      ---  convience
      ---
      -- use { 'benekastah/neomake' }
      -- use { 'preservim/nerdcommenter' }
      use {
        'b3nj5m1n/kommentary'
        , event = 'CursorHold'
        , setup = function()
          local g = vim.g
          -- do not load the default komentary mappings
          g.kommentary_create_default_mappings = false
        end
        , config = function()
          require 'configs.kommentary'
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
          require 'gitsigns'.setup()
        end
      }

      ---  guides
      ---
      use {
        'lukas-reineke/indent-blankline.nvim'
        , cmd = 'IndentBlanklineToggle'
        , setup = function()
          require 'configs.indention.blankline.setup'
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
        , event = 'InsertEnter'
        , config = function()
          require 'configs.autopairs'
        end
      }

      ---  language syntax
      ---
      use {
        'martinda/Jenkinsfile-vim-syntax'
        -- , event = 'CursorHold'
        , ft = {
          'Jenkinsfile'
          , 'groovy'
        }
      }
      use {
        'gisphm/vim-gradle'
        , ft = {
          'gradle'
          , 'groovy'
        }
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
        'vhyrro/neorg'
        , ft = 'norg'
        , config = function()
          require 'configs.neorg'
        end
      }
    end
    , config = {
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
