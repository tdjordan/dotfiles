" Set 'nocompatible' to ward off unexpected things that the distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible                                  " nvim default

" Attempt to determine the type of a file based on its name and possibly its contents.
" Used to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific
filetype indent plugin on

" Enable syntax highlighting
syntax on
colorscheme molokai
"colorscheme dalek

" New <leaderi> of the band
let mapleader=','
"nnoremap <leader>V :tabnew ~/.nvimrc<CR>

""""""""""
"
" Plugins
"
""""""""""

" vim-plug : config section
"if has('win32') || has('win64')
  "call plug#begin($VIM.'/vimfiles/plugged')
"else
call plug#begin('~/.vim/plugged')
"end

""""""""""
Plug 'rking/ag.vim'
""""""""""
Plug 'SirVer/ultisnips'
" :help ultisnips
""""""""""
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }
""""""""""

""""""""""
" Fuzzy finder
""""""""""
Plug 'kien/ctrlp.vim'                             " :help ctrlp
""""""""""
" open fuzzy buffer mode
nmap <Leader>r :CtrlPBuffer<CR>
""""""""""

""""""""""
Plug 'bling/vim-airline'                          " :help airline
""""""""""
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
""""""""""

""""""""""
Plug 'majutsushi/tagbar'                          " :help tagbar
""""""""""
nmap <F8> :TagbarToggle<CR>
""""""""""

""""""""""
Plug 'scrooloose/syntastic'                       " :help syntastic
""""""""""

""""""""""
Plug 'scrooloose/nerdcommenter'                   " :help nerdcommenter
""""""""""
nmap <C-_> <Leader>c<Space>
vmap <C-_> <Leader>c<Space>
""""""""""

""""""""""
Plug 'airblade/vim-gitgutter'                     " :help gitgutter
""""""""""
Plug 'flazz/vim-colorschemes'
""""""""""

""""""""""
Plug 'nathanaelkane/vim-indent-guides'            " :help indent-guides
""""""""""
let g:indent_guides_start_level = 2               " plug default : 1
let g:indent_guides_guide_size  = 1               " plug default : 0
"let g:indent_guides_space_guides= 1               " plug default : 1
"let g:indent_guides_soft_pattern= ' '             " plug default : '\s'
"let g:indent_guides_enable_on_vim_startup= 0      " plug default : 0
"let g:indent_guides_exclude_filetypes=['help','nerdtree']    " plug default : ['help']
"let g:indent_guides_default_mapping = 0           " plug default : 1
""""""""""

""""""""""
Plug 'fatih/vim-go'                               " :help vim-go
""""""""""

""""""""""
Plug 'bronson/vim-trailing-whitespace'            " :help trailing-whitespace
""""""""""
"let g:extra_whitespace_ignored_filetypes=[]   """"" plug default : []
""""""""""

""""""""""
Plug 'tpope/vim-surround'                         " :help surround
""""""""""

""""""""""
Plug 'terryma/vim-multiple-cursors'               " :help multiple-cursors
""""""""""
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'
""""""""""

""""""""""
"
" Settings & Keybindings
"
""""""""""

" Indention settings for 2
" spaces instead of tabs
set expandtab                                     " nvim default : off
set smarttab                                  """"" nvim default : on
set shiftwidth=2                                  " nvim default : 8
set softtabstop=2                                 " nvim default : 8
set tabstop=2

" When opening a new line and no filetype-specific indenting is enabled,
" keep the same indent as the line you are currently on.
set autoindent                                """"" nvim default : on

" Display the cursor position on the last line of the screen
" or in the status line of a window
set ruler                                         " nvim default : off

" Allow window re-use to switch from an unsaved buffer without saving it first.
" Allows multiple file undo history for the same window.
set hidden

" Use case insensitive search, except when using capital letters
set ignorecase                                    " nvim default : off
set smartcase                                     " nvim default : off
set showmatch                                     " nvim default : off
set incsearch                                 """"" nvim default : on

" Highlight searches
set hlsearch                                  """"" nvim default : on

" Display line numbers in the left gutter
set number                                        " nvim default : off
set relativenumber                                " nvim default : off

" When will the last window have a status line?
"   0 : never
"   1 : only if there are at least two windows
"   2 : always
set laststatus=2                              """"" nvim default : 2

" Hightlight the screen line of the cursof with CursorLine
set cursorline                                    " nvim default : off

" When on, lines longer than width of window will wrap
set nowrap                                        " nvim default : on

""""""""""
" TODO: nvim defaults - not currently used
""""""""""
"set complete                         " nvim doesn't include 'i'
"set display=lastline                 " nvim defaults to 'lastline'
"set encoding=utf-8                   " nvim defaults to 'utf-8'
"set langnoremap                      " nvim default
"set laststatus                       " nvim defaults to 2 (statusline is alwasys shown)
"set listchars=tab:> ,trail:-,nbsp:+  " nvim default
"set mouse=a                          " nvim defaults to 'a'
"set nrformats                        " nvim defaults to 'hex'
"set sessionoptions                   " nvim doesn't include 'options'
"set tabpagemax                       " nvim defaults to 50
"set tags                             " nvim defaults to './tags;,tags'
"set viminfo                          " nvim includes '!'
""""""""""
" TODO: nvim defaults - not currently used
""""""""""

""""""""""
" vim settings removed in nvim
""""""""""
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
""""""""""
" vim settings removed in nvim
""""""""""

" Allow backspacing over autoindent, line br
set backspace=indent,eol,start                """"" nvim default : 'ident,eol,start'
set shell=/bin/bash                               " nvim default : $SHELL or sh or cmd.exe

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

" Better comand-line completion
set wildmenu                                  """"" nvim default : on
"set ttyfast                                   """"" not in nvim - always set
set noshowmode

" If a file changes outside of nvim, automatically read it again.
set autoread                                  """"" nvim default : on

" If file content changes, automatically write it when buffer loses focus.
"set autowrite                                     " nvim default : off
"set autowriteall                                  " nvim default : off

" Set the command window height to 2 lines,
" to avoid many cases of having to "press <Enter> to continue"
set cmdheight=1                               """"" nvim default: 1

" Show partial commands in the last line of the screen
set showcmd                                       " nvim default: (unix) ? off : on

" Resize splits when the window is resized
au VimResized * :wincmd =

""""""""""
" window navigation
""""""""""
"" navigate cursor to adjoining window
""""""""""
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
inoremap <C-h> <Esc><C-W>h
inoremap <C-j> <Esc><C-w>j
inoremap <C-k> <Esc><C-w>k
inoremap <C-l> <Esc><C-w>l
""""""""""
"" move window to <position> of other windows
""""""""""
" normal mode
nnoremap <C-S-H> <C-W>H
"nnoremap <C-S-J> <C-W>J
"nnoremap <C-S-K> <C-W>K
"nnoremap <C-S-L> <C-W>L
"nnoremap <C-S-T> <C-W>T

""""""""""
" backup/persistance settings
""""""""""

""""""""""
"" undo
""""""""""
" List of directory names for undo files
set undodir=~/.vim/tmp/undo//                     " nvim default : '.'

" Automatically save undo history to an undo file
"  when writing a buffer to a file, and
"  restore undo history from same file on buffer read
set undofile                                      " nvim default : off

" Maximum number of changes that can be undone.
"set undolevels=1000                           """"" nvim default : 1000

" Save whole buffer for undo when reloading it.
"set undoreload=10000                          """"" nvim default : 10000

""""""""""
"" backup
""""""""""
" Make a backup before overwriting a file.
set backup                                        " nvim default : off

" Make a backup
set writebackup                               """"" nvim default : (+writebackup) ? on : off

" List of directories for backup files
"   nvim default : (unix) ? '.,~/tmp,~/' ; '.,$TEMP,c:\\tmp,c:\\temp'
set backupdir=~/.vim/tmp/backup//                 " nvim default : see above

" List of file patterns to skip creating a backup of
"   nvim default : '/tmp/*,/$TMPDIR/*,$TMP/*,$TEMP/*'
set backupskip=/tmp/*,/private/tmp/*              " nvim default : see above


" When writing a backup file, how should it be done?
"   yes  : make a copy and overwrite the original
"   no   : rename file and write a new one
"   auto : one of the previous that works best
"set backupcopy=yes                            """"" nvim default : (unix) ? 'yes' : 'auto'

""""""""""
"" swap
""""""""""
" Use a swapfile for the buffer.
set noswapfile                                    " nvim default : on

" List of directories for swap files
"   nvim default : (unix) ? '.,~/tmp,/var/tmp,/tmp' : '.,$TEMP,c:\\tmp,c:\\temp'
set directory=~/.vim/tmp/swap//                   " nvim default : see above

" How many to remember?
"   of:
"     ':' commands
"     search patterns
"set history=10000                             """"" nvim default : 10000

" Instead of failing a command because of unsaved changes,
" raise a dialogue asking if you wish to save changed files
"set confirm                                       " nvim default : off

""""""""""
"" save marks
""""""""""
" Use the shada to save marks also
"   TODO: Not working
"set shada+=f1                                     " nvim default : !,'100,<50,s10,h

""""""""""
"" sessions
""""""""""
" Allow Windows & Linux to share session files
"   nvim default : blank,buffers, curdir, folds,help,tabpages,winsize
set sessionoptions+=slash,unix

""""""""""
" List mode
""""""""""
" Show listchars
"set list                                        " nvim default : off

"characters for displaying non-printable characters
"set listchars=tab:> ,trail:-,nbsp:+
"set listchars=eol:$,tab:>-,trail:.,nbsp:_,extends:+,precedes:+
"set listchars=tab:> ,trail:.,nbsp:_,extends:+,precedes:+


" center view on the search result
"noremap n nzz
"noremap N Nzz

"""""""""
"
" Atom editor work-alike
"
""""""""""
Plug 'matze/vim-move'
""""""""""
nmap <C-Up>   <Plug>MoveLineUp
nmap <C-Down> <Plug>MoveLineDown
vmap <C-Up>   <Plug>MoveBlockUp
vmap <C-Down> <Plug>MoveBlockDown
"vmap <C-Up>   :m '<-2<CR>gv=gv
"vmap <C-Down> :m '>+1<CR>gv=gv

""""""""""
" Duplicate ines
""""""""""
nmap <C-S-d> maYp`aj
vmap <C-S-d>   Y`<Pgv

" vim-plug : add plugins to &runtimepath
call plug#end()

