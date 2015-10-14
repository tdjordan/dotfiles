"Set 'nocompatible' to ward off unexpected things that the distro might
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

Plug 'rking/ag.vim'
Plug 'SirVer/ultisnips'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'flazz/vim-colorschemes'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'fatih/vim-go'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'

" vim-plug : add plugins to &runtimepath
call plug#end()

""""""""""
"
" Settings & Keybindings
"
""""""""""

" New <leaderi> of the band
let mapleader=','
"nnoremap <leader>V :tabnew ~/.nvimrc<CR>

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
"set relativenumber                                " nvim default : off

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
" terminal commands
""""""""""
tnoremap <leader>e <C-\><C-n>

""""""""""
" backup/persistance settings
""""""""""

""""""""""
" undo
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
" backup
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
" swap
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

""""""""""
"
" vim-airline
"
""""""""""
"if !exists("g:airline_symbols")
"	let g:airline_symbols = {}
"endif
let g:airline_theme="powerlineish"
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme="dark"
"let g:airline_theme="jellybeans"
"let g:airline_theme="raven"
"let g:airline_powerline_fonts = 1

""""""""""
"
" tagbar
"
""""""""""
nmap <F8> :TagbarToggle<CR>

""""""""""
"
" NERDCommenter
"
""""""""""
nmap <C-_> <Leader>c<Space>
vmap <C-_> <Leader>c<Space>

"""""""""
"
" Atom editor work-alike
"
""""""""""
nmap <C-Down> ddjP                                " move line down
nmap <C-Up>   ddkP                                " move line up
"nmap <C-k>    ddkP                                " move line up
"nmap <C-j>    ddjP                                " move line down
"nmap <C-Up>   mz:m-2<cr>`z                        " move line up
"nmap <C-Down> mz:m+<cr>`z                         " move line down
"vmap <C-Up>   :m`<-2<cr>`>my`<mzgv`yo`z           " move line up
"vmap <C-Down> :m`>+<cr>`<my`>mzgv`yo`z            " move line down
"nmap <C-k>    mz:m-2<cr>`z                        " move line up
"nmap <C-j>    mz:m+<cr>`z                         " move line down
"vmap <C-k>    :m`<-2<cr>`>my`<mzgv`yo`z           " move line up
"vmap <C-j>    :m`>+<cr>`<my`>mzgv`yo`z            " move line down

"""""""""
"
" Stubborn old vim habits die hard
"
""""""""""
"cmap sh te

