----------
---
---  Plugins
---
----------

-- local g       = vim.g
-- local cmd     = vim.cmd
local fn      = vim.fn
-- local input   = fn.input
-- local system  = fn.system
local execute = vim.api.nvim_command

--  Compile packer when this file is saved
--
-- execute [[
--  "augroup auto_compile_packer_plugins
--    autocmd!
--    autocmd BufWritePost plugins.lua PackerCompile
--  "augroup END
-- ]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

---  Install all the plugins
---
local init_packer = function ()
  local packer = require 'packer'

  packer.startup(function(use)
    ---  Packer itself
    ---
    use {
      'wbthomason/packer.nvim'
      , opt = true
      -- , cmd = 'PackerSync'
    }

    ---  Lua Information
    ---
    use   'nanotee/nvim-lua-guide'

    ---  Language Protocol Server - LSP
    ---
    use   'neovim/nvim-lspconfig'
    use {
      'hrsh7th/nvim-compe'
     -- , after = 'nvim-lspconfig'
    }
    -- use {
    --   'glepnir/lspsaga.nvim'
    --   , config = function()
    --     local ku = require 'keymap.utility'
    --     ku.nnoremap( '<leader>gh', '<cmd>Lspsaga lsp_finder<cr>' )
    --     ku.nnoremap( '<leader>ca', '<cmd>Lspsaga code_action<cr>' )

    --     require 'lspsaga'.init_lsp_saga {
    --         error_sign              = '❌'
    --       , warn_sign               = '⚠️'
    --       , hint_sign               = '💡'
    --       , infor_sign              = 'ℹ️'
    --       , dianostic_header_icon   = ' 🚒 '
    --       , definition_preview_icon = '📖 '
    --       , code_action_icon        = '💡'
    --       , finder_definition_icon  = '📖 '
    --       , finder_reference_icon   = '🔖 '
    --       , finder_action_keys = {
    --           open        = '<cr>'
    --         , split       = 's'
    --         , vsplit      = 'v'
    --         , quit        = '<esc>'
    --         , scroll_down = '<c-f>'
    --         , scroll_up   = '<c-b>'
    --       }
    --       , code_action_keys = {
    --           quit = '<esc>'
    --         , exec = '<cr>'
    --       }
    --     }
    --   end
    -- }
    -- use { 'nvim-lua/completion-nvim' }
    use   'nvim-lua/lsp_extensions.nvim'
    use   'tjdevries/nlua.nvim'

    ---  Telescope
    ---
    use {
      'nvim-telescope/telescope.nvim'
      , requires = {
        'nvim-lua/popup.nvim'
        , 'nvim-lua/plenary.nvim'
      }
    }

    ---  tree sitter
    ---
    use {
      'nvim-treesitter/nvim-treesitter'
      , run = ':TSUpdate'
    }
    use { 'nvim-treesitter/playground' }
    -- use { 'nvim-treesitter/completion-treesitter' }
    use { 'nvim-treesitter/nvim-treesitter-refactor' }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    -- use { 'romgrk/nvim-treesitter-context' }
    -- use { 'p00f/nvim-ts-rainbow' }

    ---  quick fix
    ---
    use {
      "kevinhwang91/nvim-bqf"
    }

    ---  history
    ---
    -- use { 'mbbill/undotree' }

    ---  terminals
    ---
    -- use { 'voldikss/vim-floaterm' }
    -- use { 'norcalli/nvim-terminal.lua' }

    ---  debugger
    ---
    -- use { 'puremourning/vimspector' }
    -- use { 'critiqjo/lldb.nvim' }

    ---  matchup
    ---
    -- use { 'andymass/vim-matchup' }
    -- use { 'jkramer/vim-checkbox' }

    ---  snippets
    ---
    -- use { 'Shougo/neosnippet' }
    -- use { 'Shougo/neosnippet-snippets' }
    -- use { 'honza/vim-snippets' }
    -- use { 'SirVer/ultisnips' }
    -- use { 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }
    use { 'folke/which-key.nvim' }


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
    use {
      'vijaymarupudi/nvim-fzf'
      -- , config = function()
      --   local fzf = require("fzf")

      --   coroutine.wrap(function()
      --     local result = fzf.fzf({"choice 1", "choice 2"})
      --     if result then
      --       print(result[1])
      --     end
      --   end)()


      -- end
    }

    ---  themes
    ---
    -- use { 'flazz/vim-colorschemes' }
    -- use { 'morhetz/gruvbox' }
    -- use { 'gruvbox-community/gruvbox' }
    use { 'eddyekofo94/gruvbox-flat.nvim' }
    use { 'sainnhe/gruvbox-material' }
    use { 'sainnhe/everforest' }
    use { 'RRethy/nvim-base16' }
    use {
      'folke/tokyonight.nvim'
      -- , opt = true
      -- , event = 'ColorScheme'
    }
    ---
    ---  theme : Lush Colorschemes
    ---
    use { 'rktjmp/lush.nvim' }
    use { 'savq/melange' }
    use { 'metalelf0/jellybeans-nvim' }
    -- use {
    --   'npxbr/gruvbox.nvim'
    -- --   , requires = {
    -- --     'rktjmp/lush.nvim'
    -- --   }
    -- }
    -- use {
    --   'olimorris/onedark.nvim'
    --   , config = function()
    --     vim.g.onedark_settings = {
    --       bold = false
    --       , italic = true
    --       , underline = false
    --     }
    --   end
    -- }
    use { 'kunzaatko/nord.nvim' }
    use { 'ful1e5/onedark.nvim' }
    -- use { 'vigoux/oak' }
    use {
      'marko-cerovac/material.nvim'
      -- , config = function()
      --   vim.g.material_italic_comments = true
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
    use { 'hoob3rt/lualine.nvim' }
    -- use {
    --   'famiu/feline.nvim'
    --   , config = function()
    --     require 'feline'.setup()
    --   end
    -- }
    ---
    --- theme : other
    ---
    use { 'norcalli/nvim-colorizer.lua' }
    -- use { 'fatih/molokai' }
    use {
      'kyazdani42/nvim-tree.lua'
      , config = function()
    --     vim.g.nvim_tree_hide_dotfiles = false
    --     vim.g.nvim_tree_indent_markers = true
    --     -- vim.g.nvim_tree_auto_close = true
    --     vim.g.nvim_tree_follow = true
        vim.g.nvim_tree_icons = {
    --       default = '',
    --       symlink = '',
          -- git = {
            -- unstaged = "",
    --         staged = "✓",
    --         unmerged = "",
    --         renamed = "➜",
    --         untracked = ""
          -- },
          folder = {
            default = "",
            -- open = "",
    --         empty = "",
    --         empty_open = "",
    --         symlink = ""
          }
        }
      end
    }
    -- use { 'hardcoreplayers/spaceline.vim' }
    -- use { 'glepnir/spaceline.vim' }
    use { 'kyazdani42/nvim-web-devicons' }
    -- use { 'ryanoasis/vim-devicons' }
    -- use { 'ryanoasis/nerd-fonts' }

    ---  language navigation
    ---
    -- use { 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
    -- use { 'liuchengxu/vista.vim', { 'on' : 'Vista!!' }

    ---  editor configs
    ---
    use { 'editorconfig/editorconfig-vim' }

    ---  convience
    ---
    -- use { 'benekastah/neomake' }
    -- use { 'preservim/nerdcommenter' }
    use { 'b3nj5m1n/kommentary' }

    ---  file trees
    use {
      'scrooloose/nerdtree'
      , cmd = 'NERDTreeToggle'
    }
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
      , config = function()
        require 'gitsigns'.setup()
      end
    }

    ---  guides
    ---
    -- use { 'Yggdroot/indentLine' }
    -- use { 'nathanaelkane/vim-indent-guides' }
    use {
      'lukas-reineke/indent-blankline.nvim'
      , branch = 'lua'
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
      -- , event = 'ColorScheme'
    }

    ---  language syntax
    ---
    -- use { 'scrooloose/syntastic' }
    -- use { 'w0rp/ale' }
    -- use { 'gisphm/vim-gradle' }
    -- use { 'udalov/kotlin-vim' }
    -- use { 'sheerun/vim-polyglot' }
    -- use { 'prurigro/vim-polyglot-darkcloud' }
    -- use { 'dleonard0/pony-vim-syntax' }
    -- use { 'saltstack/salt-vim' }
    -- use { 'fatih/vim-go' }
    -- use { 'garyburd/go-explorer' }
    -- use { 'pearofducks/ansible-vim' }
    -- let g:ansible_extra_keywords_highlight = 1
    -- use { 'glench/vim-jinja2-syntax' }
    -- use { 'PProvost/vim-ps1' }
    -- use { 'lambdatoast/elm.vim' }
    -- use { 'ElmCast/elm-vim' }
    -- use { 'tmux-plugins/vim-tmux' }
    -- use { 'google/vim-jsonnet' }
    -- use { 'zinit-zsh/zinit-vim-syntax' }
    -- use { 'numirias/semshi', {'do': ':UpdateRemoteuseins'}

    ---  annoyances
    ---
    use {
      'ntpeters/vim-better-whitespace'
      , config = function()
        vim.g.strip_whitespace_on_save      = true
        vim.g.strip_whitespace_confirm      = false
        vim.g.strip_whitelines_at_eof       = true
        vim.g.show_spaces_that_precede_tabs = true
        vim.g.better_whitespace_filetypes_blacklist = {
          'diff'
          , 'gitcommit'
          , 'unite'
          , 'qf'
          , 'help'
          , 'packer'
          , 'man'
        }
        -- table.insert(vim.g.better_whitespace_filetypes_blacklist, 'packer')
        -- table.insert(vim.g.better_whitespace_filetypes_blacklist, 'man')
        -- vim.g.better_whitespace_filetypes_blacklist['packer'] = true
        -- vim.g.better_whitespace_filetypes_blacklist['man'] = true
        -- for k, _ in {'packer','man'} do
        --   print(k)
        --   -- table.insert(vim.g.better_whitespace_filetypes_blacklist, k)
        --   vim.g.better_whitespace_filetypes_blacklist[k] = true
        -- end
      end
    }

    ---  automation ?
    ---
    -- use { 'tpope/vim-surround' }
    -- use { 'terryma/vim-multiple-cursors' }
    -- use { 'jszakmeister/vim-togglecursor' }
    -- use { 'matze/vim-move' }
    ---  Utility - Alignment
    use { 'junegunn/vim-easy-align' }
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
    use {
      'megalithic/zk.nvim'
    }

  end)
end

---  bootstrap packer
---
local bootstrap_packer = function()
  local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
  local packer_installed = fn.isdirectory(install_path) == 1

  if not packer_installed then
    execute( '!git clone https://github.com/wbthomason/packer.nvim '..install_path )
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    execute [[ packadd packer.nvim ]]
    init_packer()
    local packer = require 'packer'
    packer.sync()
    vim.cmd( "autocmd User PackerComplete ++once lua require 'bootstrap'" )
  else
    execute [[ packadd packer.nvim ]]
    init_packer()
    require 'bootstrap'
  end
end

bootstrap_packer()
