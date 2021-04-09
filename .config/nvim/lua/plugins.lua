----------
---
---  Plugins
---
----------

-- local cmd     = vim.cmd
local fn      = vim.fn
-- local input   = fn.input
-- local system  = fn.system
local execute = vim.api.nvim_command

--  bootstrap packer
--
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty( fn.glob( install_path ) ) > 0 then
  execute( '!git clone https://github.com/wbthomason/packer.nvim '..install_path )
end

execute [[packadd packer.nvim]]

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
return require 'packer'.startup(function(use)
  ---  Packer itself
  ---
  use {
    'wbthomason/packer.nvim'
    , opt = true
  }

  ---  Lua Information
  ---
  use   'nanotee/nvim-lua-guide'

  ---  Language Protocol Server - LSP
  ---
  use   'neovim/nvim-lspconfig'
  use   'hrsh7th/nvim-compe'
  use   'glepnir/lspsaga.nvim'
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
    , run = '<cmt>TSUpdate'
  }
  use { 'nvim-treesitter/playground' }
  -- use { 'nvim-treesitter/completion-treesitter' }
  -- use { 'nvim-treesitter/nvim-treesitter-refactor' }
  -- use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  -- use { 'romgrk/nvim-treesitter-context' }

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

  ---  themes
  ---
  -- use { 'flazz/vim-colorschemes' }
  -- use { 'morhetz/gruvbox' }
  -- use { 'gruvbox-community/gruvbox' }
  use { 'rktjmp/lush.nvim' }
  use { 'savq/melange' }
  use { 'metalelf0/jellybeans-nvim' }
  -- use {
  --   'npxbr/gruvbox.nvim'
  --   , requires = {
  --     'rktjmp/lush.nvim'
  --   }
  -- }
  -- use {
  --   'tjdevries/gruvbuddy.nvim',
  --   requires = {
  --     'tjdevries/colorbuddy.vim'
  --   }
  -- }
  -- use { 'sainnhe/gruvbox-material' }
  -- use { 'vim-airline/vim-airline' }
  -- use { 'vim-airline/vim-airline-themes' }
  -- use { 'itchyny/lightline.vim' }
  use { 'norcalli/nvim-colorizer.lua' }
  -- use { 'fatih/molokai' }
  -- use { 'kyazdani42/nvim-tree.lua' }
  -- use { 'hardcoreplayers/spaceline.vim' }
  -- use { 'glepnir/spaceline.vim' }
  -- use { 'kyazdani42/nvim-web-devicons' }
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
    'scrooloose/nerdtree',
    cmd = 'NERDTreeToggle'
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
  use   'tweekmonster/startuptime.vim'
  -- use   'norcalli/profiler.nvim'

  ---  braces
  ---
  -- use { '9mm/vim-closer' }
  -- use { 'jiangmiao/auto-pairs' }

  ---  language syntax
  ---
  -- use { 'scrooloose/syntastic' }
  -- use { 'w0rp/ale' }
  -- use { 'gisphm/vim-gradle' }
  -- use { 'udalov/kotlin-vim' }
  use { 'sheerun/vim-polyglot' }
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
  -- use {
  --   'ntpeters/vim-better-whitespace',
  --   run = function()
  --     vim.g.strip_whitespace_on_save = true
  --     vim.g.strip_whitespace_confirm = false
  --   end
  --   config = 'vim.g.strip_whitespace_on_save = 1'
  -- }

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

end)
