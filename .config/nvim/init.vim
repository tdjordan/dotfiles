""""""""""
"""
"""  nvim defaults
"""
""""""""""
"""  Reset vim defaults to nvim defaults
"""
if !has('nvim')

  " Set 'nocompatible' to ward off unexpected things that the distro might
  " have made, as well as sanely reset options when re-sourcing .vimrc
  set nocompatible                                  " nvim default

  " Attempt to determine the type of a file based on its name and possibly its contents.
  " Used to allow intelligent auto-indenting for each filetype,
  " and for plugins that are filetype specific
  filetype plugin indent on

  set smarttab                                  """"" nvim default : on

  " When opening a new line and no filetype-specific indenting is enabled,
  " keep the same indent as the line you are currently on.
  set autoindent                                """"" nvim default : on

  set incsearch                                 """"" nvim default : on
  set hlsearch                                  """"" nvim default : on

" - 'autoread' is enabled
" - 'background' defaults to "dark" (unless set automatically by the terminal/UI)
" - 'backspace' defaults to "indent,eol,start"
" - 'backupdir' defaults to .,~/.local/share/nvim/backup (|xdg|)
" - 'belloff' defaults to "all"
" - 'compatible' is always disabled
" - 'complete' excludes "i"
" - 'cscopeverbose' is enabled
" - 'directory' defaults to ~/.local/share/nvim/swap// (|xdg|), auto-created
" - 'display' defaults to "lastline,msgsep"
" - 'encoding' is UTF-8 (cf. 'fileencoding' for file-content encoding)
" - 'fillchars' defaults (in effect) to "vert:│,fold:·"
" - 'formatoptions' defaults to "tcqj"
" - 'fsync' is disabled
" - 'history' defaults to 10000 (the maximum)
" - 'langnoremap' is enabled
" - 'langremap' is disabled
" - 'laststatus' defaults to 2 (statusline is always shown)
" - 'listchars' defaults to "tab:> ,trail:-,nbsp:+"
" - 'nrformats' defaults to "bin,hex"
" - 'ruler' is enabled
" - 'sessionoptions' excludes "options"
" - 'shortmess' includes "F", excludes "S"
" - 'showcmd' is enabled
" - 'sidescroll' defaults to 1
" - 'smarttab' is enabled
" - 'tabpagemax' defaults to 50
" - 'tags' defaults to "./tags;,tags"
" - 'ttimeoutlen' defaults to 50
" - 'ttyfast' is always set
" - 'undodir' defaults to ~/.local/share/nvim/undo (|xdg|), auto-created
" - 'viminfo' includes "!"
" - 'wildmenu' is enabled
" - 'wildoptions' defaults to "pum,tagfile"

end

" New <leaderi> of the band
nnoremap <space> <nop>
vnoremap <space> <nop>
let g:mapleader=' '
"nnoremap <leader>V :tabnew ~/.nvimrc<CR>

" Enable folding
"set foldmethod=marker
"set foldmarker=::\ ,::

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

"""  vim-plug : config section
call plug#begin(stdpath('data').'/plugged')

"""  matchup
"""
"Plug 'andymass/vim-matchup'
Plug 'jkramer/vim-checkbox'                       " <leader>tt : insert/toggle checkbox

"""  snippets
"""
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
"Plug 'SirVer/ultisnips'                           " :help ultisnips
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }

"""  Language Protocol Server - LPS
"""
Plug 'neoclide/coc.nvim', {'branch': 'release' }
"Plug 'tjdevries/coc-zsh'

"""  search
""
Plug 'rking/ag.vim'                                 " :help ag
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " :help fzf
Plug 'junegunn/fzf.vim'                             " :help fzf-vim
Plug 'stsewd/fzf-checkout.vim'
"Plug 'junegunn/fzf',
"  \ { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install -all' }
Plug 'wsdjeg/FlyGrep.vim'

"""  themes
"""
Plug 'flazz/vim-colorschemes'
"Plug 'morhetz/gruvbox'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'                    " :help airline
Plug 'vim-airline/vim-airline-themes'
"Plug 'itchyny/lightline.vim'
Plug 'lilydjwg/colorizer'                         " colrize color codes
Plug 'fatih/molokai'
"Plug 'ryanoasis/vim-devicons'
"Plug 'ryanoasis/nerd-fonts'

"""  language navigation
"""
"Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
"Plug 'liuchengxu/vista.vim', { 'on' : 'Vista!!' }

"""  editor configs
"""
Plug 'editorconfig/editorconfig-vim'              " :help editorconfig

"""  convience
"""
"Plug 'benekastah/neomake'                         " :help neomake
Plug 'scrooloose/nerdcommenter'                   " :help nerdcommenter
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

"""  version control systems
"""
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'                         " :help fugitive
"Plug 'jlfwong/vim-mercenary'                      " :help mercenary
Plug 'ludovicchabant/vim-lawrencium', { 'on': 'Hg' }
"Plug 'gregsexton/gitv'
Plug 'airblade/vim-gitgutter'                     " :help gitgutter
"Plug 'mhinz/vim-signify'

"""  guides
"""
Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'            " :help indent-guides
"Plug 'jiangmiao/auto-pairs'                       " :help autopairs

"""  language syntax
"""
"Plug 'scrooloose/syntastic'                       " :help syntastic
"Plug 'w0rp/ale'                                   " :help ale
Plug 'gisphm/vim-gradle'
"Plug 'udalov/kotlin-vim'                          " :help kotlin-vim
Plug 'sheerun/vim-polyglot'
"Plug 'prurigro/vim-polyglot-darkcloud'
Plug 'dleonard0/pony-vim-syntax'
Plug 'saltstack/salt-vim'
Plug 'fatih/vim-go'                               " :help vim-go
Plug 'garyburd/go-explorer'
Plug 'pearofducks/ansible-vim'
let g:ansible_extra_keywords_highlight = 1
"Plug 'glench/vim-jinja2-syntax'
Plug 'PProvost/vim-ps1'
Plug 'lambdatoast/elm.vim'                        " :help elm
"Plug 'ElmCast/elm-vim'                            " :help elm-vim
Plug 'tmux-plugins/vim-tmux'                      " :help vim-tmux
Plug 'google/vim-jsonnet'
"Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

"""  language debug
"""
"Plug 'critiqjo/lldb.nvim'                         " :help lldb-start

"""  annoyances
"""
Plug 'bronson/vim-trailing-whitespace'            " :help trailing-whitespace

"""  automation ?
"""
Plug 'tpope/vim-surround'                         " :help surround
Plug 'terryma/vim-multiple-cursors'               " :help multiple-cursors
"Plug 'jszakmeister/vim-togglecursor'              " : help togglecursor
Plug 'matze/vim-move'                             " :help move.txt
"""  Utility - Alignment
Plug 'junegunn/vim-easy-align'
Plug 'godlygeek/tabular'

"""  preview panels
"""
"Plug 'atweiden/vim-uzbl'
Plug 'xu-cheng/brew.vim'

"""  service hooks
"""
Plug 'mrtazz/simplenote.vim'

" vim-plug : add plugins to &runtimepath
call plug#end()

""""""""""""
"""
"""  Settings & Keybindings
"""
""""""""""""

"""  Vim Settings
"""
" Indention settings for 2
" spaces instead of tabs
set expandtab                                     " nvim default : off
"set smarttab                                  """"" nvim default : on
set shiftwidth=2                                  " nvim default : 8
set softtabstop=2                                 " nvim default : 8
set tabstop=2                                     " nvim default : 8
set shiftround                                    " nvim default : off

" When opening a new line and no filetype-specific indenting is enabled,
" keep the same indent as the line you are currently on.
"if !has('nvim')
  "set autoindent                                """"" nvim default : on
"end

" Display the cursor position on the last line of the screen
" or in the status line of a window
set ruler                                         " nvim default : off

" Open splits below and to the right
"set splitbelow
set splitright

" Allow window re-use to switch from an unsaved buffer without saving it first.
" Allows multiple file undo history for the same window.
set hidden

" Use case insensitive search, except when using capital letters
set ignorecase                                    " nvim default : off
set smartcase                                     " nvim default : off
set showmatch                                     " nvim default : off
"set incsearch                                 """"" nvim default : on

" Highlight searches
set nohlsearch                                    " nvim default : on

" Display line numbers in the left gutter
set number                                        " nvim default : off
set relativenumber                                " nvim default : off

" display space above/below left/right of cursor
set scrolloff=1
set sidescrolloff=5

" When will the last window have a status line?
"   0 : never
"   1 : only if there are at least two windows
"   2 : always
set laststatus=2                              """"" nvim default : 2

" Hightlight the screen line of the cursor with CursorLine
set cursorline                                    " nvim default : off

" When on, lines longer than width of window will wrap
"set nowrap                                        " nvim default : on

" Enable use of the mouse
"    options [useful]
"      n = Normal mode
"      v = Visual mode
"      i = Insert mode
"      c = Command-line mode
"      h = all previous modes when editing a help file
"      a = all previous modes
"      r = for hit-enter & more-propmt prompts
"set mouse=a                                       " nvim defaults : 'a'

"set guioptions=A

" Enable 24-bit RGB color in the TUI
set termguicolors

"""  TODO: nvim defaults - not currently used
"""
"set complete                         " nvim doesn't include 'i'
"set display=lastline                 " nvim defaults to 'lastline'
"set encoding=utf-8                   " nvim defaults to 'utf-8'
"set langnoremap                      " nvim default
"set laststatus                       " nvim defaults to 2 (statusline is alwasys shown)
"set listchars=tab:> ,trail:-,nbsp:+  " nvim default
"set nrformats                        " nvim defaults to 'hex'
"set sessionoptions                   " nvim doesn't include 'options'
"set tabpagemax                       " nvim defaults to 50
"set tags                             " nvim defaults to './tags;,tags'
"set viminfo                          " nvim includes '!' : nvim alias for shada
"""
" TODO: nvim defaults - not currently used

"""  vim settings removed in nvim
"""
" compatible      cp
" cryptmethod
" edcompatible    ed
" guipty
" key
" macatsui
" shortname       sn
" termencoding    tenc
" toolbar         tb
" toolbariconsize tbis
" ttybuiltin      tbi
" ttyfast         tf
" ttymouse        ttym
" ttyscroll       tsl
" weirdinvert     wiv
"""
" vim settings removed in nvim

"""  Allow backspacing over autoindent, line br
set backspace=indent,eol,start                """"" nvim default : 'ident,eol,start'
"set shell=/bin/bash                               " nvim default : $SHELL or sh or cmd.exe
set shell=/bin/sh

" Allow for old vim shell muscle memory
"cnoreabbrev sh te

" Insert mode completion options
"   menu
"   : use a popup menu to show the possible completeions
"   : does not show if there is only one match
"   menuone
"   : use a popup menu also when there is only one match
"   longest
"   : only insert the longest common text of the matches
"   preview
"   : show extra information about the currently selected completion
"   : only works with 'menu' or 'menuone'
"   noinsert
"   : do not insert any text for a match until the user selects a match
"   : no effect if 'longest' is present
"   noselect
"   : do not select a match in the menu
"   : force user to slect one from the menu
set completeopt -=preview                         " nvim default : 'menu,preview'

" Maximum width of text that is being inserted.
" A longer line will be broken after white space to get this width.
" Zero disables this feature.
"set textwidth=100                                 " nvim default : 0

"set ttyfast                                   """"" not in nvim - always set
set noshowmode

" If a file changes outside of nvim, automatically read it again.
set autoread                                  """"" nvim default : on

" If file content changes, automatically write it when buffer loses focus.
"set autowrite                                     " nvim default : off
"set autowriteall                                  " nvim default : off

" Set the command window height to 2 lines,
" to avoid many cases of having to "press <Enter> to continue"
set cmdheight=1                               """"" nvim default : 1

" Show partial commands in the last line of the screen
set showcmd                                       " nvim default : (unix) ? off : on

"""
""" noremap bindings
"""

" Reload init.vim from standard config path
" note that the stdpath makes this portable
nnoremap <leader><cr> :so `=stdpath('config').'/init.vim'`<cr>

"""
""" p* mappings
"""
nnoremap <leader>pf :Files<cr>
nnoremap <leader>pl :Lines<cr>
nnoremap <leader>ps :Rg<space>
nnoremap <leader>pw :Rg <c-r>=expand("<cword>")<cr><cr>
nnoremap <leader>pc :Colors<cr>

nnoremap <c-p> :GFiles<cr>

"""
""" g* mappings
"""

" Resize splits when the window is resized
augroup resize_splits_when_window_resizes
  au!
  au VimResized * :wincmd =
augroup END

" When opening a file, return to last edit postion
augroup return_to_last_edit_position
  au!
  au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   execute 'normal! g`"' |
    \ endif
augroup END

"""  Plug 'rking/ag.vim'                               " :help ag
"""
" Better comand-line completion
set wildmenu                                  """"" nvim default : on
set wildmode=longest:full,full                    " nvim default : full
let g:ag_prg='ag --vimgrep --smart-case'          " plug default : --vimgrep
"""
nnoremap <leader>f :execute 'Ag "' . input('Ag/') . '"'<CR>

imap jj <esc>

"""  Conquer of Completion
"""
" :help coc
let g:coc_global_extensions=[
  \   'coc-json'
  \ , 'coc-vimlsp'
  \ , 'coc-git'
  \ , 'coc-lists'
  \ , 'coc-diagnostic'
  \ , 'coc-cmake'
  \ ]
  "\ , 'coc-snippets'
  "\ , 'coc-java'
  "\ , 'coc-json'
  "\ , 'coc-marketplace'
  "\ , 'coc-tailwindcss'
imap <C-l> <Plug>(coc-snippets-expand)
"inoremap <silent><expr> <c-space> coc#refresh()
let g:markdown_fenced_languages = [
  \ 'vim'
  \]

"""  Fuzzy finders
"""
" set up patterns to ignore
set wildignore+=.hg,.git,.svn                     " version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg    " images - binary
set wildignore+=*.o,*.obj,*.manifest              " compiled object files
set wildignore+=*.exe,*.so,*dll                   " exe/lib binaries
set wildignore+=*.DS_Store                        " OSX custom folder attributes
set wildignore+=*.luac                            " byte code - lua
set wildignore+=*.pyc                             " byte code - python
set wildignore+=*.sw?                             " nvim swap files
set wildignore+=Session.vim                       " nvim mksession - default

"""  fzf
"""
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_checkout_track_key = 'ctrl-t'

"""  sk
"""
" Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install -all' }
"""
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

"""  Plug 'vim-airline/vim-airline'                    " :help airline
" Plug 'vim-airline/vim-airline-themes'
"""
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1
let g:airline#extensions#coc#enabled = 1
"let g:airline_extensions = []
"let g:airline#extensions#tabline#enabled=1

"""  Tagbars
" :help tagbar
" Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
" ;help vista
" Plug 'liuchengxu/vista.vim', { 'on' : 'Vista!!' }
"""
"nnoremap <silent><F8> :TagbarToggle<CR>
nnoremap <silent><F8> :Vista!!<CR>

"""  Themes
"""
" Plug 'fatih/molokai'
" Plug 'ryanoasis/vim-devicons'
" Plug 'ryanoasis/nerd-fonts'
"""
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11

"""  Plug 'scrooloose/syntastic'                       " :help syntastic
"""
""let g:syntastic_enable_ballons=1                  " plug default : 1
""let g:syntastic_error_symbol = "✗"                " plug default : $>
"let g:syntastic_check_on_open=1                   " plug default : 0

"""  Plug 'benekastah/neomake'                         " :help neomake
"au! BufWritePost * Neomake
"au! BufWinEnter * Neomake
""let g:neomake_open_list=2
""let g:neomake_open_list=1
"let g:neomake_open_list=0
""let g:neomake_airline=1

"""  Plug 'w0rp/ale'                                   " :help ale
"let g:ale_sign_column_always = 1

"""  TODO: see http://vimawesome.com/plugin/vim-thematic

"""  Comment Handling
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle

"""  File Browser
"autocmd! User NERD_tree.vim echom 'NERDTree is now loaded!'
"""
nnoremap <leader>k :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1                         " plug default : 0
"let NERDTreeMinimalUI=1                           " plug default : 0
"let NERDTreeShowBookmarks=1                       " plug default : 0
" exit nvim when nerdtree is the only buffer open
au bufenter *
  \ if
  \   (winnr("$") == 1
  \   && exists("b:NERDTreeType")
  \   && b:NERDTreeType
  \   == "primary")
  \     | q |
  \ endif
" open nerdtree when nvim starts up
"au VimEnter * NERDTree
" open nerdtee when no files wer specified on startup
au StdinReadPre * let s:std_in=1
"au VimEnter *
  "\ if
  "\   argc() == 0
  "\   && !exists("s:std_in")
  "\     | NERDTree |
  "\ endif

"""  Indention
"let g:indentLine_char = '|'
let g:indentLine_char = '┆'
let g:indent_guides_start_level = 2               " plug default : 1
let g:indent_guides_guide_size  = 1               " plug default : 0
"let g:indent_guides_space_guides= 1               " plug default : 1
"let g:indent_guides_soft_pattern= ' '             " plug default : '\s'
"let g:indent_guides_enable_on_vim_startup= 0      " plug default : 0
"let g:indent_guides_exclude_filetypes=['help','nerdtree']    " plug default : ['help']
"let g:indent_guides_default_mapping = 0           " plug default : 1

"""  auto-pairs
"""
"let g:AutoPairsShortcutToggle = '<C-s>'
"let g:AutoPairsShortcutFastWrap = '<C-s>'

"""  vim-go
"""
" Plug 'fatih/vim-go'                               " :help vim-go
"""
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
"""
au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>dt <Plug>(go-def-tab)
"""
"au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-dock-vertical)
au FileType go nmap <leader>gb <Plug>(go-dock-browser)
"""
au FileType go nmap <leader>s <Plug>(go-implements)
au FileType go nmap <leader>s <Plug>(go-info)
au FileType go nmap <leader>e <Plug>(go-rename)
"""
" enable syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"""
let g:go_fmt_command = 'goimports'            """"" use goimports instead of gofmt
"let g:go_fmt_autosave = 0
"let g:go_fmt_fail_silently = 0                """"" plug default : show fmt errors
"""
" neovim support
au Filetype go nmap <leader>rt <Plug>(go-run-tab)
au Filetype go nmap <leader>rs <Plug>(go-run-split)
au Filetype go nmap <leader>rv <Plug>(go-run-vertical)
"let g:go_term_mode = "vsplit"                 """"" plug default : vertical split
" make testing commands run in a new terminal
let g:go_term_enabled = 1
"""
" syntastic vim-go settings
" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] )
" let g:go_list_type = "quickfix"
"""

"""  Cursor Configuration
"""  Multiple Cursors
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'
"if has('nvim')
  "" https://github.com/neovim/neovim/wiki/Following-HEAD#20170402
  ""  :set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
  "set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
"endif

"""  Auto Toggle
"""
"let g:togglecursor_insert='line'
"let g:togglecursor_disable_neovim=1

"""  Window Navigation
"""
"" navigate cursor to adjoining window
"""
" terminal mode
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  au BufWinEnter,WinEnter term://* startinsert
  au BufLeave term://* stopinsert
endif
" normal mode
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" insert mode
"inoremap <C-h> <Esc><C-W>h
"inoremap <C-j> <Esc><C-w>j
"inoremap <C-k> <Esc><C-w>k
"inoremap <C-l> <Esc><C-w>l
"""
"" move window to <position> of other windows
"""
" normal mode
"nnoremap <C-S-H> <C-W>H
"nnoremap <C-S-J> <C-W>J
"nnoremap <C-S-K> <C-W>K
"nnoremap <C-S-L> <C-W>L
"nnoremap <C-S-T> <C-W>T

"""  Tab Minipulation
"""
"nnoremap <leader>te :tabedit <C-R>=expand("%:p:h")<CR>/

""""""""""
"""
"""  backup/persistance settings
"""
""""""""""

"""  undo
"""
" List of directory names for undo files
set undodir=~/.local/share/nvim/tmp/undo/                     " nvim default : '.'

"  when writing a buffer to a file, and
"  restore undo history from same file on buffer read
set undofile                                      " nvim default : off

" Maximum number of changes that can be undone.
"set undolevels=1000                           """"" nvim default : 1000

" Save whole buffer for undo when reloading it.
"set undoreload=10000                          """"" nvim default : 10000

"""  backup
"""
" Make a backup before overwriting a file.
"set backup                                        " nvim default : off

" Make a backup
"set writebackup                               """"" nvim default : (+writebackup) ? on : off

" List of directories for backup files
"   nvim default : (unix) ? '.,~/tmp,~/' ; '.,$TEMP,c:\\tmp,c:\\temp'
set backupdir=~/.local/share/nvim/tmp/backup/                 " nvim default : see above

" List of file patterns to skip creating a backup of
"   nvim default : '/tmp/*,/$TMPDIR/*,$TMP/*,$TEMP/*'
set backupskip=/tmp/*,/private/tmp/*              " nvim default : see above

" When writing a backup file, how should it be done?
"   yes  : make a copy and overwrite the original
"   no   : rename file and write a new one
"   auto : one of the previous that works best
"set backupcopy=yes                            """"" nvim default : (unix) ? 'yes' : 'auto'

"""  swap
"""
" Use a swapfile for the buffer.
set noswapfile                                    " nvim default : on

" List of directories for swap files
"   nvim default : (unix) ? '.,~/tmp,/var/tmp,/tmp' : '.,$TEMP,c:\\tmp,c:\\temp'
set directory=~/.local/share/nvim/tmp/swap/                   " nvim default : see above

" How many to remember?
"   of:
"     ':' commands
"     search patterns
"set history=10000                             """"" nvim default : 10000

" Instead of failing a command because of unsaved changes,
" raise a dialogue asking if you wish to save changed files
"set confirm                                       " nvim default : off

"""  save marks
"""
" Use the shada to save marks also
"   TODO: Not working
"set shada+=f1                                     " nvim default : !,'100,<50,s10,h

"""  sessions
"""
" Allow Windows & Linux to share session files
"   nvim default : blank,buffers, curdir, folds,help,tabpages,winsize
set sessionoptions+=slash,unix

"""  List mode
"""
" Show listchars
"set list                                        " nvim default : off

"characters for displaying non-printable characters
"set listchars=tab:> ,trail:-,nbsp:+
"set listchars=eol:$,tab:>-,trail:.,nbsp:_,extends:+,precedes:+
"set listchars=tab:> ,trail:.,nbsp:_,extends:+,precedes:+

" center view on the search result
"noremap n nzz
"noremap N Nzz

"""  Spell
"set spell
"set spelllang=us_en

"""  Atom editor work-alike
"""
" Plug 'matze/vim-move'
"""
"nmap <C-Up>   <plug>MoveLineUp
"nmap <C-Down> <plug>MoveLineDown
"vmap <C-Up>   <plug>MoveBlockUp
"vmap <C-Down> <plug>MoveBlockDown
let g:move_mapkeys = 0
"nmap <A-j>   <plug>MoveLineUp
"nmap <A-Down> <plug>MoveLineDown
"vmap <A-Up>   <plug>MoveBlockUp
"vmap <A-Down> <plug>MoveBlockDown
"""

"""
" Duplicate ines
"""
nnoremap <C-S-d> maYp`aj
vnoremap <C-S-d>   Y`<Pgv

"""
" Reselect visual selection when indenting
"""
vnoremap < <gv
vnoremap > >gv

"""  Languages
"""
"""  Language - ansible
"""
"let g:ansible_extra_syntaxes = "sh.vim ruby.vim"
let g:ansible_attribute_highlight = 'ab'
let g:ansible_name_highlight = 'b'
let g:ansible_extra_keywords_highlight = 1

"""  Language - cpp
"""
" Plug 'critiqjo/lldb.nvim'                         " :help lldb-start
"""
nmap      <M-b> <Plug>LLBreadSwitch
vmap       <F2> <Plug>LLStdInSelected
nnoremap   <F4> :LLstdin<CR>
nnoremap <S-F4> :LLstdin --raw<CR>
nnoremap   <F5> :LLmode debug<CR>
nnoremap <S-F5> :LLmode code<CR>
"nnoremap   <F8> :LL continue<CR>
nnoremap <S-F8> :LL process interrupt<CR>
nnoremap   <F9> :LL print <C-R>=expand('<cword>')<CR>
vnoremap   <F9> :<C-U>LL print <C-R>=lldb#util#get_selection()<CR>

"""

"""  Utliities
"""

"""  Utility - EditorConfig
"""
"    :help editorconfig
"""
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
"""

"""  Utility - Alignment
" Plug 'junegunn/vim-easy-align'
"""
" (vipga) start interactive EasyAlign in visual mode
"xmap ga <Plug>(EasyAlign)
" (gaip ) start interactive EasyAlign for motion/text object
"nmap ga <Plug>(EasyAlign)
"if exists(":Tabularize")
  "nmap <Leader>a= :Tabularize /=<CR>
  "vmap <Leader>a= :Tabularize /=<CR>
  "nmap <Leader>a: :Tabularize /:\zs<CR>
  "vmap <Leader>a: :Tabularize /:\zs<CR>
"endif

"""  Utility - FlyGrep
noremap <Space>s/ :FlyGrep<cr>

"""

""""""""""
"""
"""  Syntax Coloring
"""
""""""""""
"
" Enable syntax highlighting
syntax on

" default colorscheme
colorscheme gruvbox
"colorscheme molokai
"colorscheme github
"colorscheme neon
"colorscheme dalek
"
" Better readability diff colorscheme
if &diff
  colorscheme github
endif
if has('nvim-0.3.2') || has("patch-8.1.0360")
    set diffopt=filler,internal,algorithm:histogram,indent-heuristic
endif

" Transparent background
hi! Normal ctermbg=none guibg=none
hi! NonText ctermbg=none guibg=none guifg=none ctermfg=none

"""  initial coc.vim configurations follow

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
"set cmdheight=1
"set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
"set updatetime=100

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
 inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  "autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
"command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

