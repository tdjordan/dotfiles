local cmd = vim.cmd
local o   = vim.o
local wo  = vim.wo
--local bo  = vim.bo

------------------------
------
------  Settings & Keybindings
------
------------------------

------  Vim Settings
------
-- Indention settings for 2
-- spaces instead of tabs
o.expandtab = true                              -- nvim default : off
o.smarttab  = true                          ---------- nvim default : on
o.shiftwidth = 2                                -- nvim default : 8
o.softtabstop = 2                               -- nvim default : 8
o.tabstop = 2                                   -- nvim default : 8
o.shiftround = true                             -- nvim default : off

-- When opening a new line and no filetype-specific indenting is enabled,
-- keep the same indent as the line you are currently on.
--if !has('nvim')
  --set autoindent                                ---------- nvim default : on
--end

-- Display the cursor position on the last line of the screen
-- or in the status line of a window
o.ruler = true                                  -- nvim default : off

-- Open splits below and to the right
--set splitbelow
o.splitright = true

-- Allow window re-use to switch from an unsaved buffer without saving it first.
-- Allows multiple file undo history for the same window.
o.hidden = true

-- Use case insensitive search, except when using capital letters
o.ignorecase = true                             -- nvim default : off
o.smartcase  = true                             -- nvim default : off
o.showmatch  = true                             -- nvim default : off
--set incsearch                                 ---------- nvim default : on

-- Highlight searches
o.hlsearch = false                              -- nvim default : on

-- Display line numbers in the left gutter
o.number         = true                         -- nvim default : off
o.relativenumber = true                         -- nvim default : off

-- display space above/below left/right of cursor
o.scrolloff     = 1
o.sidescrolloff = 5

-- When will the last window have a status line?
--   0 : never
--   1 : only if there are at least two windows
--   2 : always
o.laststatus = 2                            ---------- nvim default : 2

-- Hightlight the screen line of the cursor with CursorLine
o.cursorline = true                             -- nvim default : off

-- When on, lines longer than width of window will wrap
--set nowrap                                        -- nvim default : on

-- Enable use of the mouse
--    options [useful]
--      n = Normal mode
--      v = Visual mode
--      i = Insert mode
--      c = Command-line mode
--      h = all previous modes when editing a help file
--      a = all previous modes
--      r = for hit-enter & more-propmt prompts
--set mouse=a                                       -- nvim defaults : 'a'

--set guioptions=A

-- Enable 24-bit RGB color in the TUI
--if has ('termguicolors')
  o.termguicolors = true
--endif

------  TODO: nvim defaults - not currently used
------
--set complete                          -- nvim doesn't include 'i'
--set display=lastline                  -- nvim defaults to 'lastline'
o.encoding = 'utf-8'                  -- nvim defaults to 'utf-8'
o.concealcursor='nc'                  -- n:Normal v:Visual i:Insert c:Command ( Modes )
o.conceallevel = 2                  -- 'Conceal' hi group / text hidden unless has replacement ch
--set langnoremap                       -- nvim default
--set laststatus                        -- nvim defaults to 2 (statusline is alwasys shown)
--set listchars=tab:> ,trail:-,nbsp:+   -- nvim default
--set nrformats                         -- nvim defaults to 'hex'
--set sessionoptions                    -- nvim doesn't include 'options'
--set tabpagemax                        -- nvim defaults to 50
--set tags                              -- nvim defaults to './tags;,tags'
--set viminfo                           -- nvim includes '!' : nvim alias for shada
------
-- TODO: nvim defaults - not currently used

------  vim settings removed in nvim
------
-- compatible      cp
-- cryptmethod
-- edcompatible    ed
-- guipty
-- key
-- macatsui
-- shortname       sn
-- termencoding    tenc
-- toolbar         tb
-- toolbariconsize tbis
-- ttybuiltin      tbi
-- ttyfast         tf
-- ttymouse        ttym
-- ttyscroll       tsl
-- weirdinvert     wiv
------
-- vim settings removed in nvim

------  Allow backspacing over autoindent, line br
o.backspace = 'indent,eol,start'            ---------- nvim default : 'ident,eol,start'
--set shell=/bin/bash                               -- nvim default : $SHELL or sh or cmd.exe
--set shell=/bin/sh
o.shell = '/bin/zsh'

-- Allow for old vim shell muscle memory
--cnoreabbrev sh te

-- Insert mode completion options
--   menu
--   : use a popup menu to show the possible completeions
--   : does not show if there is only one match
--   menuone
--   : use a popup menu also when there is only one match
--   longest
--   : only insert the longest common text of the matches
--   preview
--   : show extra information about the currently selected completion
--   : only works with 'menu' or 'menuone'
--   noinsert
--   : do not insert any text for a match until the user selects a match
--   : no effect if 'longest' is present
--   noselect
--   : do not select a match in the menu
--   : force user to slect one from the menu
--set completeopt -=preview                         -- nvim default : 'menu,preview'
o.completeopt = 'menuone,noinsert,noselect'

-- Maximum width of text that is being inserted.
-- A longer line will be broken after white space to get this width.
-- Zero disables this feature.
--set textwidth=100                                 -- nvim default : 0

--set ttyfast                                   ---------- not in nvim - always set
o.showmode = false

-- If a file changes outside of nvim, automatically read it again.
o.autoread = true                           ---------- nvim default : on

-- If file content changes, automatically write it when buffer loses focus.
--set autowrite                                     -- nvim default : off
--set autowriteall                                  -- nvim default : off

-- Set the command window height to 2 lines,
-- to avoid many cases of having to --press <Enter> to continue--
o.cmdheight = 1                             ---------- nvim default : 1

-- Show partial commands in the last line of the screen
o.showcmd = true                                -- nvim default : (unix) ? off : on

--------------------
------
------  backup/persistance settings
------
--------------------

------  undo
------
-- List of directory names for undo files
o.undodir = '~/.local/share/nvim/tmp/undo/nvim/'              -- nvim default : '.'

--  when writing a buffer to a file, and
--  restore undo history from same file on buffer read
o.undofile = true                               -- nvim default : off

-- Maximum number of changes that can be undone.
--set undolevels=1000                           ---------- nvim default : 1000

-- Save whole buffer for undo when reloading it.
--set undoreload=10000                          ---------- nvim default : 10000

------  backup
------
-- Make a backup before overwriting a file.
--set backup                                        -- nvim default : off

-- Make a backup
--set writebackup                               ---------- nvim default : (+writebackup) ? on : off

-- List of directories for backup files
--   nvim default : (unix) ? '.,~/tmp,~/' ; '.,$TEMP,c:\\tmp,c:\\temp'
o.backupdir = '~/.local/share/nvim/tmp/backup/'         -- nvim default : see above

-- List of file patterns to skip creating a backup of
--   nvim default : '/tmp/*,/$TMPDIR/*,$TMP/*,$TEMP/*'
o.backupskip = '/tmp/*,/private/tmp/*'              -- nvim default : see above

-- When writing a backup file, how should it be done?
--   yes  : make a copy and overwrite the original
--   no   : rename file and write a new one
--   auto : one of the previous that works best
--set backupcopy=yes                            ---------- nvim default : (unix) ? 'yes' : 'auto'

------  swap
------
-- Use a swapfile for the buffer.
o.swapfile = false                               -- nvim default : on

-- List of directories for swap files
--   nvim default : (unix) ? '.,~/tmp,/var/tmp,/tmp' : '.,$TEMP,c:\\tmp,c:\\temp'
o.directory = '~/.local/share/nvim/tmp/swap/'            -- nvim default : see above

-- How many to remember?
--   of:
--     ':' commands
--     search patterns
--set history=10000                             ---------- nvim default : 10000

-- Instead of failing a command because of unsaved changes,
-- raise a dialogue asking if you wish to save changed files
--set confirm                                       -- nvim default : off

------  save marks
------
-- Use the shada to save marks also
--   TODO: Not working
--set shada+=f1                                     -- nvim default : !,'100,<50,s10,h

------  sessions
------
-- Allow Windows & Linux to share session files
--   nvim default : blank,buffers, curdir, folds,help,tabpages,winsize
cmd [[ set sessionoptions+=slash,unix ]]
--o.sessionoptions = o.sessionoptions .. [[ slash,unix ]]

------  List mode
------
-- Show listchars
--set list                                        -- nvim default : off

--characters for displaying non-printable characters
--set listchars=tab:> ,trail:-,nbsp:+
--set listchars=eol:$,tab:>-,trail:.,nbsp:_,extends:+,precedes:+
--set listchars=tab:> ,trail:.,nbsp:_,extends:+,precedes:+

-- center view on the search result
--noremap n nzz
--noremap N Nzz

------  Spell
--set spell
--set spelllang=us_en

-- Some servers have issues with backup files, see #649
o.backup      = false
o.writebackup = false

-- Better display for messages
--set cmdheight=1
--set cmdheight=2
--set cmdheight=5

-- You will have bad experience for diagnostic messages when it's default 4000.
o.updatetime = 100

-- do not give |ins-completion-menu| messages.
o.shortmess = o.shortmess .. 'c'

-- do not display intro message on startup
o.shortmess = o.shortmess .. 'I'

-- always show signcolumns
wo.signcolumn = 'yes'

