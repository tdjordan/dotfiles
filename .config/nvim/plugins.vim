""""""""""
"""
"""  Plugins
"""
""""""""""
"""  Plugins

"""  autoload install
"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dires
    "\ https://raw.githubusercontent.com/junegunn/vim-plug/maaster/plug.vim
"endif
"autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

"call plugpac#begin()
"Pack 'sheerun/vim-polyglot'
"let g:polyglot_is_disabled = []
"call plugpac#end()

"""  vim-plug : config section
call plug#begin(stdpath('data').'/plugged')

"""  Language Protocol Server - LSP               " :h lsp
"""
Plug 'neovim/nvim-lspconfig'
"Plug 'mattn/vim-lsp-settings'                     " :h vim-lsp-settings
Plug 'nvim-lua/completion-nvim'                   " :h completion-nvim
"Plug 'steelsojka/completion-buffers'
"Plug 'nvim-lua/diagnostic-nvim'                   " :h diagnostic-nvim
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'

"Plug 'neoclide/coc.nvim', {'branch': 'release' }
"Plug 'tjdevries/coc-zsh'

"""  Telescope
"""
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

""" tree sitter
"""
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }   " :h nvim-treesitter
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/completion-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-refactor'   " :h nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'romgrk/nvim-treesitter-context'

"""  highlight on yank
"""
if !has('nvim')
  Plug 'machakann/vim-highlightedyank'
  if !exists('##TextYankPost')
    map y <Plug>(highlightedyank)
  endif
  let g:highlightedyank_highlight_duration = 40
endif

"""  history
"""
Plug 'mbbill/undotree'                            " :h undotree

"""  terminals
"""
Plug 'voldikss/vim-floaterm'                      " :h floaterm
"Plug 'norcalli/nvim-terminal.lua'                 " :h terminal.lua

"""  debugger
"""
Plug 'puremourning/vimspector'
"Plug 'critiqjo/lldb.nvim'                         " :h lldb-start

"""  matchup
"""
"Plug 'andymass/vim-matchup'
Plug 'jkramer/vim-checkbox'                       " <leader>tt : insert/toggle checkbox

"""  snippets
"""
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
"Plug 'SirVer/ultisnips'                           " :h ultisnips
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }

"""  search
""
"Plug 'rking/ag.vim'                                 " :h ag
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " :h fzf
Plug 'junegunn/fzf.vim'                             " :h fzf-vim
Plug 'stsewd/fzf-checkout.vim'
"Plug 'junegunn/fzf',
"  \ { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install -all' }
"Plug 'wsdjeg/FlyGrep.vim'

"""  themes
"""
"Plug 'flazz/vim-colorschemes'
"Plug 'morhetz/gruvbox'
"Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
"Plug 'sainnhe/edge'
Plug 'ayu-theme/ayu-vim'
let ayucolor='dark'
"Plug 'vim-airline/vim-airline'                    " :h airline
"Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'norcalli/nvim-colorizer.lua'                " colorize color codes
"Plug 'fatih/molokai'
"Plug 'kyazdani42/nvim-tree.lua'
"Plug 'hardcoreplayers/spaceline.vim'
"Plug 'glepnir/spaceline.vim'
Plug 'kyazdani42/nvim-web-devicons'
"Plug 'ryanoasis/vim-devicons'
"Plug 'ryanoasis/nerd-fonts'

"""  language navigation
"""
"Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
"Plug 'liuchengxu/vista.vim', { 'on' : 'Vista!!' }

"""  editor configs
"""
Plug 'editorconfig/editorconfig-vim'              " :h editorconfig

"""  convience
"""
"Plug 'benekastah/neomake'                         " :h neomake
Plug 'scrooloose/nerdcommenter', { 'on': '<plug>NERDCommenterToggle' } " :h nerdcommenter

"""  file trees
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'justinmk/vim-dirvish'                       " :h dirvish

"""  version control systems
"""
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
"Plug 'tpope/vim-fugitive', { 'on': 'Git' }        " :h fugitive
"Plug 'tpope/vim-fugitive'                         " :h fugitive
Plug 'itchyny/vim-gitbranch'
"Plug 'jlfwong/vim-mercenary'                      " :h mercenary
Plug 'ludovicchabant/vim-lawrencium', { 'on': 'Hg' }
"Plug 'gregsexton/gitv'
"Plug 'airblade/vim-gitgutter'                     " :h gitgutter
Plug 'mhinz/vim-signify'                          " :h signify

"""  guides
"""
Plug 'Yggdroot/indentLine'                        " :h indentLine
"Plug 'nathanaelkane/vim-indent-guides'            " :h indent-guides

"""  performance
"""
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }

"""  braces
"""
"Plug '9mm/vim-closer'                             " :h closer
"Plug 'jiangmiao/auto-pairs'                       " :h autopairs

"""  language syntax
"""
"Plug 'scrooloose/syntastic'                       " :h syntastic
"Plug 'w0rp/ale'                                   " :h ale
Plug 'sheerun/vim-polyglot'
let g:plolyglot_disabled = [
  \   'autoindent'
  \   , 'sensible'
  \   , 'lua'
  \   , 'elm'
  \   , 'gradle'
  \   , 'ansible'
  \ ]
"Plug 'prurigro/vim-polyglot-darkcloud'
Plug 'gisphm/vim-gradle', { 'for': 'gradle' }
"Plug 'hsanson/vim-android'
"Plug 'udalov/kotlin-vim'                          " :h kotlin-vim
"Plug 'dleonard0/pony-vim-syntax'
"Plug 'saltstack/salt-vim'
"Plug 'fatih/vim-go'                               " :h vim-go
"Plug 'garyburd/go-explorer'
Plug 'pearofducks/ansible-vim', { 'for': 'yaml.ansible' }
"Plug 'pearofducks/ansible-vim', { 'for': 'yaml.ansible', 'do': './UltraSnips/generate.sh'  }
"let g:ansible_extra_keywords_highlight = 1
"Plug 'glench/vim-jinja2-syntax'
Plug 'PProvost/vim-ps1'
"Plug 'lambdatoast/elm.vim'                        " :h elm
Plug 'ElmCast/elm-vim', { 'for': 'elm' }          " :h elm-vim
Plug 'tmux-plugins/vim-tmux'                      " :h vim-tmux :h tmux
Plug 'google/vim-jsonnet', { 'for': 'jsonnet' }
"Plug 'zinit-zsh/zinit-vim-syntax'
"Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

"""  annoyances
"""
Plug 'ntpeters/vim-better-whitespace'             " :h better-whitespace
"let g:strip_whitespace_on_save = 1
"let g:strip_whitespace_confirm = 0

"""  automation ?
"""
"Plug 'tpope/vim-surround'                         " :h surround
" [ DEPRECATED ] Plug 'terryma/vim-multiple-cursors'               " :h multiple-cursors
"Plug 'mg979/vim-visual-multi'
"Plug 'jszakmeister/vim-togglecursor'              " : help togglecursor
Plug 'matze/vim-move'                             " :h move.txt
"""  Utility - Alignment
Plug 'junegunn/vim-easy-align'
"Plug 'godlygeek/tabular'                 " this is an expensive plugin

"""  preview panels
"""
"Plug 'atweiden/vim-uzbl'
Plug 'xu-cheng/brew.vim'

"""  service hooks
"""
"Plug 'mrtazz/simplenote.vim'

" vim-plug : add plugins to &runtimepath
call plug#end()


