----------
---
---  paqins
---
----------

---  paq-nvim : config section
vim.cmd 'packadd paq-nvim'
local paq = require 'paq-nvim'.paq

---  Language Protocol Server - LSP
---
paq 'neovim/nvim-lspconfig'
paq 'nvim-lua/completion-nvim'
paq 'nvim-lua/lsp_extensions.nvim'

---  tree sitter
---
paq { 'nvim-treesitter/nvim-treesitter', hook=vim.fn['TSUpdate'] }
paq 'nvim-treesitter/playground'
paq 'nvim-treesitter/completion-treesitter'
paq 'nvim-treesitter/nvim-treesitter-refactor'
paq 'nvim-treesitter/nvim-treesitter-textobjects'
paq 'romgrk/nvim-treesitter-context'

---  Telescope
---
paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'
paq 'nvim-telescope/telescope.nvim'

---
paq 'norcalli/nvim-colorizer.lua'
paq 'tweekmonster/startuptime.vim'
paq 'sainnhe/gruvbox-material'

---  history
---
paq 'mbbill/undotree'

---  terminals
---
paq 'voldikss/vim-floaterm'
--paq 'norcalli/nvim-terminal.lua'

---  debugger
---
paq 'puremourning/vimspector'
--paq 'critiqjo/lldb.nvim'

---  matchup
---
--paq 'andymass/vim-matchup'
paq 'jkramer/vim-checkbox'

---  snippets
---
paq 'Shougo/neosnippet'
paq 'Shougo/neosnippet-snippets'
paq 'honza/vim-snippets'
--paq 'SirVer/ultisnips'
--paq 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }

---  search
---
--paq 'rking/ag.vim'
paq { 'junegunn/fzf',  hook=vim.fn['fzf#install()'] }
paq 'junegunn/fzf.vim'
paq 'stsewd/fzf-checkout.vim'
--paq 'junegunn/fzf',
--  \ { 'dir': '~/.fzf', 'do': './install --all' }
paq 'lotabout/skim'--, { 'dir': '~/.skim', 'do': './install -all' }
--paq 'wsdjeg/FlyGrep.vim'

---  themes
---
paq 'flazz/vim-colorschemes'
--paq 'morhetz/gruvbox'
--paq 'gruvbox-community/gruvbox'
paq 'sainnhe/gruvbox-material'
paq 'vim-airline/vim-airline'
--paq 'vim-airline/vim-airline-themes'
--paq 'itchyny/lightline.vim'
paq 'norcalli/nvim-colorizer.lua'
--paq 'fatih/molokai'
--paq 'kyazdani42/nvim-tree.lua'
--paq 'hardcoreplayers/spaceline.vim'
--paq 'glepnir/spaceline.vim'
paq 'kyazdani42/nvim-web-devicons'
--paq 'ryanoasis/vim-devicons'
--paq 'ryanoasis/nerd-fonts'

---  language navigation
---
--paq 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
--paq 'liuchengxu/vista.vim', { 'on' : 'Vista!!' }

---  editor configs
---
paq 'editorconfig/editorconfig-vim'

---  convience
---
--paq 'benekastah/neomake'
paq 'scrooloose/nerdcommenter'

---  file trees
paq { 'scrooloose/nerdtree', opt=true }
--paq 'justinmk/vim-dirvish'

---  version control systems
---
paq 'Xuyuanp/nerdtree-git-plugin'
paq 'tpope/vim-fugitive'
--paq 'jlfwong/vim-mercenary'
paq 'ludovicchabant/vim-lawrencium'--, { 'on': 'Hg' }
--paq 'gregsexton/gitv'
--paq 'airblade/vim-gitgutter'
paq 'mhinz/vim-signify'

---  guides
---
paq 'Yggdroot/indentLine'
paq 'nathanaelkane/vim-indent-guides'

---  performance
---
paq 'tweekmonster/startuptime.vim'

---  braces
---
--paq '9mm/vim-closer'
--paq 'jiangmiao/auto-pairs'

---  language syntax
---
--paq 'scrooloose/syntastic'
--paq 'w0rp/ale'
paq 'gisphm/vim-gradle'
--paq 'udalov/kotlin-vim'
paq 'sheerun/vim-polyglot'
--paq 'prurigro/vim-polyglot-darkcloud'
paq 'dleonard0/pony-vim-syntax'
--paq 'saltstack/salt-vim'
paq 'fatih/vim-go'
paq 'garyburd/go-explorer'
paq 'pearofducks/ansible-vim'
--let g:ansible_extra_keywords_highlight = 1
--paq 'glench/vim-jinja2-syntax'
paq 'PProvost/vim-ps1'
paq 'lambdatoast/elm.vim'
--paq 'ElmCast/elm-vim'
paq 'tmux-plugins/vim-tmux'
paq 'google/vim-jsonnet'
--paq 'zinit-zsh/zinit-vim-syntax'
--paq 'numirias/semshi', {'do': ':UpdateRemotepaqins'}

---  annoyances
---
paq 'ntpeters/vim-better-whitespace'

---  automation ?
---
paq 'tpope/vim-surround'
paq 'terryma/vim-multiple-cursors'
--paq 'jszakmeister/vim-togglecursor'
paq 'matze/vim-move'
---  Utility - Alignment
paq 'junegunn/vim-easy-align'
paq 'godlygeek/tabular'

---  preview panels
---
--paq 'atweiden/vim-uzbl'
paq 'xu-cheng/brew.vim'

---  service hooks
---
--paq 'mrtazz/simplenote.vim'


--paq {'lervag/vimtex', opt=true }


