" Set 'nocompatible' to ward off unexpected things that the distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
if !has('nvim')
  set nocompatible                                  " nvim default
end

" Attempt to determine the type of a file based on its name and possibly its contents.
" Used to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific
filetype indent plugin on

" New <leaderi> of the band
let g:mapleader=','
"nnoremap <leader>V :tabnew ~/.nvimrc<CR>

""""""""""
"
" Plugins
"
""""""""""

"if empty(glob('~/.vim/autoload/plug.vim'))
  "silent !curl -fLo ~/.vim/autoload/plug.vim --create-dires
    "\ https://raw.githubusercontent.com/junegunn/vim-plug/maaster/plug.vim
  "autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

" vim-plug : config section
if has('win32') || has('win64')
  call plug#begin($VIM.'/vimfiles/plugged')
else
  call plug#begin('~/.local/share/nvim/plugged')
end

""""""""""
" matchup
""""""""""
Plug 'andymass/vim-matchup'
""""""""""

""""""""""
Plug 'jkramer/vim-checkbox'                       " <leader>tt : insert/toggle checkbox
""""""""""

""""""""""
Plug 'rking/ag.vim'                               " :help ag
""""""""""
" Better comand-line completion
set wildmenu                                  """"" nvim default : on
set wildmode=longest:full,full                    " nvim default : full
let g:ag_prg='ag --vimgrep --smart-case'          " plug default : --vimgrep
""""""""""
nnoremap <leader>f :execute 'Ag "' . input('Ag/') . '"'<CR>
""""""""""

""""""""""
" Autocomplete
""""""""""
"if has('python3')
  "Plug 'Shougo/deoplete.nvim'                     " :help deoplete
  """""""""""
  "let g:deoplete#enable_at_startup=1
  """""""""""
"else
  "Plug 'Shougo/neocomplete'
"endif
""""""""""

""""""""""
" Snippets
""""""""""
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
""""""""""
Plug 'honza/vim-snippets'
""""""""""

""""""""""
" Conquer of Completion
""""""""""
" :help coc
Plug 'neoclide/coc.nvim', {'branch': 'release' }
let g:coc_global_extensions=[
  \ 'coc-vimlsp',
  \ 'coc-snippets',
  \ 'coc-java',
  \ 'coc-json',
  \ 'coc-git',
  \ 'coc-diagnostic'
  \ ]
  "\ 'coc-tailwindcss'
imap <C-l> <Plug>(coc-snippets-expand)
""""""""""

""""""""""

""""""""""
"Plug 'SirVer/ultisnips'                           " :help ultisnips
""""""""""
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }
""""""""""

""""""""""
" Fuzzy finder
""""""""""
"" ctrlp
"Plug 'kien/ctrlp.vim'                             " :help ctrlp
Plug 'ctrlpvim/ctrlp.vim'                             " :help ctrlp
""""""""""
" open fuzzy buffer mode
nnoremap <leader>r :CtrlPBuffer<CR>
let g:ctrlp_show_hidden=1                         " plug default : 0 - hide hidden files
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
let g:ctrlp_custom_ignore={
  \ 'dir':  '\v[\/].(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': '',
  \ }
""""""""""
"" ctrlp extensions
""""""""""
Plug 'tacahiroy/ctrlp-funky'                      " :help ctrlp-funky
""""""""""
nnoremap <leader>fu :CtrlPFunky<CR>
nnoremap <leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<CR>
let g:ctrlp_funky_matchtype='path'                " plug default : line
let g:ctrlp_funky_syntax_highlight=1              " plug default : 0
let g:ctrlp_funky_multi_buffers=1                 " plug default : 0
let g:ctrlp_funky_use_cache=1                     " plug default : 0
""""""""""
"" fzf
""""""""""
Plug 'junegunn/fzf',
"  \ { 'dir': '~/.fzf', 'do': './install --all' }
set rtp+=/usr/local/opt/fzf                      " :help fzf
""""""""""

""""""""""
Plug 'vim-airline/vim-airline'                    " :help airline
Plug 'vim-airline/vim-airline-themes'
""""""""""
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=1
"let g:airline#extensions#tabline#enabled=1
""""""""""

""""""""""
" :help tagbar
"Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
" ;help vista
Plug 'liuchengxu/vista.vim', { 'on' : 'Vista!!' }
""""""""""
"nnoremap <silent><F8> :TagbarToggle<CR>
nnoremap <silent><F8> :Vista!!<CR>
""""""""""

""""""""""
Plug 'editorconfig/editorconfig-vim'              " :help editorconfig
""""""""""
"let g:EditorConfig_max_line_indicator='line'
""""""""""

""""""""""
Plug 'lilydjwg/colorizer'                         " colrize color codes
""""""""""

""""""""""
" Themes
""""""""""
Plug 'fatih/molokai'
""""""""""

""""""""""
"Plug 'ryanoasis/vim-devicons'
"Plug 'ryanoasis/nerd-fonts'
""""""""""
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
""""""""""

""""""""""
"Plug 'scrooloose/syntastic'                       " :help syntastic
"""""""""""
""let g:syntastic_enable_ballons=1                  " plug default : 1
""let g:syntastic_error_symbol = "✗"                " plug default : $>
"let g:syntastic_check_on_open=1                   " plug default : 0
""""""""""

""""""""""
"Plug 'benekastah/neomake'                         " :help neomake
"""""""""""
"au! BufWritePost * Neomake
"au! BufWinEnter * Neomake
""let g:neomake_open_list=2
""let g:neomake_open_list=1
"let g:neomake_open_list=0
""let g:neomake_airline=1
"""""""""""

""""""""""
Plug 'w0rp/ale'                                   " :help ale
""""""""""
"let g:ale_sign_column_always = 1
""""""""""

""""""""""
" TODO: see http://vimawesome.com/plugin/vim-thematic
""""""""""

""""""""""
Plug 'scrooloose/nerdcommenter'                   " :help nerdcommenter
""""""""""
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle
""""""""""

""""""""""
" :help NERDtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"autocmd! User NERD_tree.vim echom 'NERDTree is now loaded!'
""""""""""
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
""""""""""

""""""""""
Plug 'Xuyuanp/nerdtree-git-plugin'
""""""""""

""""""""""
" Version Control
""""""""""
" vim-fugitive
""""""""""
" git
Plug 'tpope/vim-fugitive'                         " :help fugitive
""""""""""
" hg
""Plug 'jlfwong/vim-mercenary'                      " :help mercenary
" :help lawrencium
Plug 'ludovicchabant/vim-lawrencium', { 'on': 'Hg' }
""""""""""

""""""""""
" gitv
""""""""""
"Plug 'gregsexton/gitv'
""""""""""

""""""""""
Plug 'airblade/vim-gitgutter'                     " :help gitgutter
""""""""""
Plug 'flazz/vim-colorschemes'
""""""""""

""""""""""
Plug 'Yggdroot/indentLine'
"let g:indentLine_char = '|'
let g:indentLine_char = '┆'
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
" auto-pairs
""""""""""
"Plug 'jiangmiao/auto-pairs'
""""""""""
"let g:AutoPairsShortcutToggle = '<C-s>'
"let g:AutoPairsShortcutFastWrap = '<C-s>'
""""""""""

""""""""""
" vim-gradle
""""""""""
Plug 'gisphm/vim-gradle'
""""""""""

""""""""""
" kotlin-vim
""""""""""
"Plug 'udalov/kotlin-vim'                          " :help kotlin-vim
""""""""""

""""""""""
" vim-polygot
""""""""""
Plug 'sheerun/vim-polyglot'
""""""""""
""""""""""

""""""""""
" pony-vim-syntax
""""""""""
Plug 'dleonard0/pony-vim-syntax'
""""""""""

""""""""""
" salt-vim
""""""""""
Plug 'saltstack/salt-vim'
""""""""""

""""""""""

""""""""""
" vim-go
""""""""""
Plug 'fatih/vim-go'                               " :help vim-go
""""""""""
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
""""""""""
au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>dt <Plug>(go-def-tab)
""""""""""
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-dock-vertical)
au FileType go nmap <leader>gb <Plug>(go-dock-browser)
""""""""""
au FileType go nmap <leader>s <Plug>(go-implements)
au FileType go nmap <leader>s <Plug>(go-info)
au FileType go nmap <leader>e <Plug>(go-rename)
""""""""""
" enable syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
""""""""""
let g:go_fmt_command = "goimports"            """"" use goimports instead of gofmt
"let g:go_fmt_autosave = 0
"let g:go_fmt_fail_silently = 0                """"" plug default : show fmt errors
""""""""""
" neovim support
au Filetype go nmap <leader>rt <Plug>(go-run-tab)
au Filetype go nmap <leader>rs <Plug>(go-run-split)
au Filetype go nmap <leader>rv <Plug>(go-run-vertical)
"let g:go_term_mode = "vsplit"                 """"" plug default : vertical split
" make testing commands run in a new terminal
let g:go_term_enabled = 1
""""""""""
" syntastic vim-go settings
" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] )
" let g:go_list_type = "quickfix"
""""""""""

""""""""""
" go-explorer
""""""""""
Plug 'garyburd/go-explorer'
""""""""""

""""""""""
" ansible-vim
""""""""""
Plug 'pearofducks/ansible-vim'
""""""""""
"let g:ansible_extra_syntaxes = "sh.vim ruby.vim"
let g:ansible_attribute_highlight = "ab"
let g:ansible_name_highlight = 'b'
let g:ansible_extra_keywords_highlight = 1
"""""""""""

""""""""""
" vim-jinga2-syntax
""""""""""
"Plug 'glench/vim-jinja2-syntax'
""""""""""

""""""""""
" vim-ps1
""""""""""
Plug 'PProvost/vim-ps1'
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
"Plug 'jszakmeister/vim-togglecursor'              " : help togglecursor
"""""""""""
"let g:togglecursor_insert='line'
"let g:togglecursor_disable_neovim=1
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
set tabstop=2                                     " nvim default : 8
set shiftround                                    " nvim default : off

" When opening a new line and no filetype-specific indenting is enabled,
" keep the same indent as the line you are currently on.
set autoindent                                """"" nvim default : on

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
set incsearch                                 """"" nvim default : on

" Highlight searches
"set hlsearch                                  """"" nvim default : on
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
"set viminfo                          " nvim includes '!' : nvim alias for shada
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
set cmdheight=1                               """"" nvim default: 1

" Show partial commands in the last line of the screen
set showcmd                                       " nvim default: (unix) ? off : on

" Resize splits when the window is resized
au VimResized * :wincmd =

" When opening a file, return to last edit postion
augroup return_to_last_edit_position
  au!
  au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   execute 'normal! g`"' |
    \ endif
augroup END

""""""""""
" uindow navigation
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
"inoremap <C-h> <Esc><C-W>h
"inoremap <C-j> <Esc><C-w>j
"inoremap <C-k> <Esc><C-w>k
"inoremap <C-l> <Esc><C-w>l
""""""""""
"" move window to <position> of other windows
""""""""""
" normal mode
"nnoremap <C-S-H> <C-W>H
"nnoremap <C-S-J> <C-W>J
"nnoremap <C-S-K> <C-W>K
"nnoremap <C-S-L> <C-W>L
"nnoremap <C-S-T> <C-W>T

""""""""""
" tab manipulations
""""""""""
"nnoremap <leader>te :tabedit <C-R>=expand("%:p:h")<CR>/
""""""""""

""""""""""
" backup/persistance settings
""""""""""

""""""""""
"" undo
""""""""""
" List of directory names for undo files
set undodir=~/.local/share/nvim/tmp/undo/                     " nvim default : '.'

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
set backupdir=~/.local/share/nvim/tmp/backup/                 " nvim default : see above

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
set directory=~/.local/share/nvim/tmp/swap/                   " nvim default : see above

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
nmap <C-Up>   <plug>MoveLineUp
nmap <C-Down> <plug>MoveLineDown
vmap <C-Up>   <plug>MoveBlockUp
vmap <C-Down> <plug>MoveBlockDown
""""""""""

""""""""""
" Duplicate ines
""""""""""
nnoremap <C-S-d> maYp`aj
vnoremap <C-S-d>   Y`<Pgv

""""""""""
" Reselect visual selection when indenting
""""""""""
vnoremap < <gv
vnoremap > >gv

"""""""""
"
" Language - cpp
"
""""""""""
"Plug 'critiqjo/lldb.nvim'                         " :help lldb-start
""""""""""
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
""""""""""

"""""""""
"
" Language - elm
"
""""""""""
Plug 'lambdatoast/elm.vim'                        " :help elm
"Plug 'ElmCast/elm-vim'                            " :help elm-vim
""""""""""

"""""""""
"
" Language - .tmux.conf
"
""""""""""
Plug 'tmux-plugins/vim-tmux'                      " :help vim-tmux
""""""""""

"""""""""
"
" Language - uzbl config
"
""""""""""
"Plug 'atweiden/vim-uzbl'
""""""""""

"""""""""
"
" Language - brew formulae
"
""""""""""
Plug 'xu-cheng/brew.vim'
""""""""""

"""""""""
"
" Utility - simplenote
"
""""""""""
Plug 'mrtazz/simplenote.vim'
""""""""""

"""""""""
"
" Utility - EditorConfig
"
""""""""""
Plug 'editorconfig/editorconfig-vim'              " :help editorconfig
""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
""""""""""

"""""""""
"
" Utility - vim-easy-align
"
""""""""""
Plug 'junegunn/vim-easy-align'
""""""""""
" (vipga) start interactive EasyAlign in visual mode
xmap ga <Plug>(EasyAlign)
" (gaip ) start interactive EasyAlign for motion/text object
nmap ga <Plug>(EasyAlign)
""""""""""


"""""""""
"
" Utility - FlyGrep
"
""""""""""
Plug 'wsdjeg/FlyGrep.vim'
""""""""""
noremap <Space>s/ :FlyGrep<cr>
""""""""""

"""""""""
"
" Syntax - vim-jsonnet
"
""""""""""
Plug 'google/vim-jsonnet'
""""""""""

""""""""""
" vim-plug : add plugins to &runtimepath
call plug#end()

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1

""""""""""
"
" Syntax Coloring
"
""""""""""
" Enable syntax highlighting
syntax on

" default colorscheme
colorscheme molokai
"colorscheme github
"colorscheme neon
"colorscheme dalek
"
" Better readability diff colorscheme
if &diff
  colorscheme github
endif

