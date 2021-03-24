------------------------
------
------  Settings
------
------------------------

local cmd = vim.cmd
local o   = vim.o
local wo  = vim.wo
local bo  = vim.bo
local g   = vim.g

------  Vim Settings
------
-- Indention settings for 2 spaces instead of tabs
bo.expandtab     = true                         -- nvim default : off
 o.smarttab      = true                         -- nvim default : on
bo.shiftwidth    = 2                            -- nvim default : 8
bo.softtabstop   = 2                            -- nvim default : 8
bo.tabstop       = 2                            -- nvim default : 8
 o.shiftround    = true                         -- nvim default : off

-- When opening a new line and no filetype-specific indenting is enabled,
-- keep the same indent as the line you are currently on.
 o.autoindent     = true                         -- nvim default : on

-- Display the cursor position on the last line of the screen
-- or in the status line of a window
 o.ruler          = true                        -- nvim default : off

-- Open splits to the right
 o.splitright     = true

-- Allow window re-use to switch from an unsaved buffer without saving it first.
-- Allows multiple file undo history for the same window.
 o.hidden         = true

-- Use case insensitive search, except when using capital letters
 o.ignorecase     = true                        -- nvim default : off
 o.smartcase      = true                        -- nvim default : off
 o.showmatch      = true                        -- nvim default : off
-- o.incsearch    = true                           -- nvim default : on

-- Highlight searches
 o.hlsearch       = false                       -- nvim default : on

-- Display line numbers in the left gutter
 o.number         = true                        -- nvim default : off
 o.relativenumber = true                        -- nvim default : off

-- display space above/below left/right of cursor
 o.scrolloff      = 1
 o.sidescrolloff  = 5

-- When will the last window have a status line?
--   0 : never
--   1 : only if there are at least two windows
--   2 : always
 o.laststatus     = 2                           -- nvim default : 2

-- Hightlight the screen line of the cursor with CursorLine
 o.cursorline     = true                        -- nvim default : off

-- When on, lines longer than width of window will wrap
-- o.wrap           = false                        -- nvim default : on

-- Enable use of the mouse
--    options [useful]
--      n = Normal mode
--      v = Visual mode
--      i = Insert mode
--      c = Command-line mode
--      h = all previous modes when editing a help file
--      a = all previous modes
--      r = for hit-enter & more-propmt prompts
-- o.mouse = 'a'                                   -- nvim defaults : 'a'

-- o.guioptions = 'A'

-- Enable 24-bit RGB color in the TUI
--if has ('termguicolors')
  o.termguicolors = true
--endif

------  TODO: nvim defaults - not currently used
------
-- o.complete       = true                         -- nvim doesn't include 'i'
-- o.display        = lastline                     -- nvim defaults to 'lastline'
 o.encoding       = 'utf-8'                     -- nvim defaults to 'utf-8'
 o.concealcursor  = 'nc'                        -- n:Normal v:Visual i:Insert c:Command ( Modes )
 o.conceallevel   = 2                           -- 'Conceal' hi group / text hidden unless has replacement ch
-- o.langnoremap    = true                         -- nvim default
-- o.laststatus     = true                         -- nvim defaults to 2 (statusline is alwasys shown)
-- o.listchars      = 'tab:> ,trail:-,nbsp:+'      -- nvim default
-- o.nrformats      = true                         -- nvim defaults to 'hex'
-- o.sessionoptions = true                         -- nvim doesn't include 'options'
-- o.tabpagemax     = true                         -- nvim defaults to 50
-- o.tags           = true                         -- nvim defaults to './tags;,tags'
-- o.viminfo        = true                         -- nvim includes '!' : nvim alias for shada
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
 o.backspace = 'indent,eol,start'                -- nvim default : 'ident,eol,start'
 o.shell     = '/bin/zsh'                        -- nvim default : $SHELL or sh or cmd.exe

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
--set completeopt -=preview                        -- nvim default : 'menu,preview'
 o.completeopt = 'menuone,noinsert,noselect'

-- Maximum width of text that is being inserted.
-- A longer line will be broken after white space to get this width.
-- Zero disables this feature.
-- o.textwidth = 100                               -- nvim default : 0

-- o.ttyfast = true                                -- not in nvim - always set
 o.showmode = false

-- If a file changes outside of nvim, automatically read it again.
 o.autoread = true                              -- nvim default : on

-- If file content changes, automatically write it when buffer loses focus.
-- o.autowrite    = true                           -- nvim default : off
-- o.autowriteall = true                           -- nvim default : off

-- Set the command window height to 2 lines,
-- to avoid many cases of having to --press <Enter> to continue--
 o.cmdheight = 1                                -- nvim default : 1

-- Show partial commands in the last line of the screen
 o.showcmd   = true                             -- nvim default : (unix) ? off : on

--------------------
------
------  backup/persistance settings
------
--------------------

------  undo
------
-- List of directory names for undo files
 o.undodir = '~/.local/share/nvim/tmp/undo/nvim/'   -- nvim default : '.'

--  when writing a buffer to a file, and
--  restore undo history from same file on buffer read
 o.undofile = true                              -- nvim default : off

-- Maximum number of changes that can be undone.
-- o.undolevels = 1000                             -- nvim default : 1000

-- Save whole buffer for undo when reloading it.
-- o.undoreload = 10000                            -- nvim default : 10000

------  backup
------
-- Some LSP servers have issues with backup files, see #649
 o.backup      = false                          -- nvim default : off
 o.writebackup = false                          -- nvim default : (+writebackup) ? on : off

-- Make a backup before overwriting a file.
-- o.backup = true                                 -- nvim default : off

-- Make a backup
-- o.writebackup = true                            -- nvim default : (+writebackup) ? on : off

-- List of directories for backup files
--   nvim default : (unix) ? '.,~/tmp,~/' ; '.,$TEMP,c:\\tmp,c:\\temp'
 -- o.backupdir = '~/.local/share/nvim/tmp/backup/'   -- nvim default : see above

-- List of file patterns to skip creating a backup of
--   nvim default : '/tmp/*,/$TMPDIR/*,$TMP/*,$TEMP/*'
 -- o.backupskip = '/tmp/*,/private/tmp/*'            -- nvim default : see above

-- When writing a backup file, how should it be done?
--   yes  : make a copy and overwrite the original
--   no   : rename file and write a new one
--   auto : one of the previous that works best
-- o.backupcopy = 'yes'                            -- nvim default : (unix) ? 'yes' : 'auto'

---  swap
---
-- Use a swapfile for the buffer.
 o.swapfile = false                             -- nvim default : on

-- List of directories for swap files
--   nvim default : (unix) ? '.,~/tmp,/var/tmp,/tmp' : '.,$TEMP,c:\\tmp,c:\\temp'
 -- o.directory = '~/.local/share/nvim/tmp/swap/'  -- nvim default : see above

-- How many to remember?
--   of:
--     ':' commands
--     search patterns
-- o.history = 10000                               -- nvim default : 10000

-- Instead of failing a command because of unsaved changes,
-- raise a dialogue asking if you wish to save changed files
-- o.confirm = true                                -- nvim default : off

------  save marks
------
-- Use the shada to save marks also
--   TODO: Not working
-- o.shada = o.shada .. 'f1'                       -- nvim default : !,'100,<50,s10,h

------  sessions
------
-- Allow Windows & Linux to share session files
--   nvim default : blank,buffers, curdir, folds,help,tabpages,winsize
cmd [[ set sessionoptions+=slash,unix ]]
--o.sessionoptions = o.sessionoptions .. [[ slash,unix ]]

------  List mode
------
-- Show listchars
-- o.list = true                                   -- nvim default : off

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

-- Better display for messages
--set cmdheight=1
--set cmdheight=2
--set cmdheight=5

-- You will have bad experience for diagnostic messages when it's default 4000.
 o.updatetime  = 100

-- do not give |ins-completion-menu| messages.
 o.shortmess   = o.shortmess .. 'c'

-- do not display intro message on startup
 o.shortmess   = o.shortmess .. 'I'

-- always show signcolumns
wo.signcolumn = 'yes'

-- do not load the default komentary mappings
g.kommentary_create_default_mappings = true
