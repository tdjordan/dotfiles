------------------------
------
------  Settings
------
------------------------

-- local cmd = vim.cmd
local opt = vim.opt
-- local o   = vim.o
-- local go  = vim.go
-- local wo  = vim.wo
-- local bo  = vim.bo
-- local g   = vim.g

------  Vim Settings
------
-- Indention settings for 2 spaces instead of tabs
--  o.smarttab      = true                         -- nvim default : on
--  o.expandtab     = true                         -- nvim default : off
-- bo.expandtab     = o.expandtab                  -- nvim default : off
--  o.shiftwidth    = 2                            -- nvim default : 8
-- bo.shiftwidth    = o.shiftwidth                 -- nvim default : 8
--  o.softtabstop   = 2                            -- nvim default : 8
-- bo.softtabstop   = o.softtabstop                -- nvim default : 8
--  o.tabstop       = 2                            -- nvim default : 8
-- bo.tabstop       = o.tabstop                    -- nvim default : 8
--  o.shiftround    = true                         -- nvim default : off
opt.smarttab      = true                         -- nvim default : on
opt.expandtab     = true                         -- nvim default : off
opt.shiftwidth    = 2                            -- nvim default : 8
opt.softtabstop   = 2                            -- nvim default : 8
opt.tabstop       = 2                            -- nvim default : 8
opt.shiftround    = true                         -- nvim default : off

-- When opening a new line and no filetype-specific indenting is enabled,
-- keep the same indent as the line you are currently on.
-- opt.autoindent     = true                        -- nvim default : on
opt.autoindent     = true                        -- nvim default : on
-- opt.smartindent    = true                        -- nvim default : off
 -- o.smartindent    = true                        -- nvim default : off
-- bo.smartindent    = true                        -- nvim default : off

-- Display the cursor position on the last line of the screen
-- or in the status line of a window
opt.ruler          = true                        -- nvim default : off

-- Open splits to the right
opt.splitright     = true

-- Allow window re-use to switch from an unsaved buffer without saving it first.
-- Allows moltiple file undo history for the same window.
opt.hidden         = true

-- Highlight searches
opt.hlsearch       = false                       -- nvim default : on

-- Use case insensitive search, except when using capital letters
opt.ignorecase     = true                        -- nvim default : off
opt.smartcase      = true                        -- nvim default : off
opt.showmatch      = true                        -- nvim default : off
-- o.incsearch    = true                           -- nvim default : on

-- Display line numbers in the left gutter
opt.number         = true                        -- nvim default : off
opt.relativenumber = true                        -- nvim default : off

-- display space above/below left/right of cursor
opt.scrolloff      = 1
opt.sidescrolloff  = 5

-- When will the last window have a status line?
--   0 : never
--   1 : only if there are at least two windows
--   2 : always
opt.laststatus     = 2                           -- nvim default : 2

-- Hightlight the screen line of the cursor with CursorLine
opt.cursorline     = true                        -- nvim default : off

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
-- opt.mouse         = 'a'                          -- nvim defaults : 'a'
opt.mouse = 'n'

-- o.guioptions = 'A'

-- Enable 24-bit RGB color in the TUI
--if has ('termguicolors')
opt.termguicolors = true
--endif

------  TODO: nvim defaults - not currently used
------
-- o.complete       = true                         -- nvim doesn't include 'i'
-- o.display        = lastline                     -- nvim defaults to 'lastline'
 -- o.fileencoding   = 'utf-8'                     -- nvim defaults to ''
opt.encoding       = 'utf-8'                     -- nvim defaults to 'utf-8'
opt.concealcursor  = 'nc'                        -- n:Normal v:Visual i:Insert c:Command ( Modes )
opt.conceallevel   = 2                           -- 'Conceal' hi group / text hidden unless has replacement ch
-- opt.conceallevel   = 0                           -- 'Conceal' hi group / text hidden unless has replacement ch
  -- TODO : to allow '' to be visible in markdown files, set conceallevel to 0
-- o.langnoremap    = true                         -- nvim default
-- o.laststatus     = true                         -- nvim defaults to 2 (statusline is alwasys shown)
-- opt.listchars      = 'tab:> ,trail:-,nbsp:+,eol:↴'      -- nvim default
opt.listchars =
  { tab   = '> '
  , trail = '-'
  , nbsp  = '+'
  , eol   = "↴"
  -- , space = "."
}
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
opt.backspace = 'indent,eol,start'                -- nvim default : 'ident,eol,start'
opt.shell     = '/bin/zsh'                        -- nvim default : $SHELL or sh or cmd.exe

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
--
--  nvim default : 'menu,preview'
-- opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
opt.completeopt = { 'menuone', 'noselect' }

-- Maximum width of text that is being inserted.
-- A longer line will be broken after white space to get this width.
-- Zero disables this feature.
-- o.textwidth = 100                               -- nvim default : 0

-- o.ttyfast = true                                -- not in nvim - always set
opt.showmode = false

-- If a file changes outside of nvim, automatically read it again.
opt.autoread = true                              -- nvim default : on

-- If file content changes, automatically write it when buffer loses focus.
-- o.autowrite    = true                           -- nvim default : off
-- o.autowriteall = true                           -- nvim default : off

-- Better display for messages
-- Set the command window height to 2 lines,
-- to avoid many cases of having to --press <Enter> to continue--
opt.cmdheight = 1                                -- nvim default : 1

-- Show partial commands in the last line of the screen
opt.showcmd   = true                             -- nvim default : (unix) ? off : on

--------------------
------
------  backup/persistance settings
------
--------------------

------  undo
------
-- List of directory names for undo files
opt.undodir = vim.fn.stdpath('data')..'/tmp/undo/nvim/'   -- nvim default : '.'

--  when writing a buffer to a file, and
--  restore undo history from same file on buffer read
opt.undofile = true                              -- nvim default : off

-- Maximum number of changes that can be undone.
-- o.undolevels = 1000                             -- nvim default : 1000

-- Save whole buffer for undo when reloading it.
-- o.undoreload = 10000                            -- nvim default : 10000

------  backup
------
-- Some LSP servers have issues with backup files, see #649
opt.backup      = false                          -- nvim default : off
opt.writebackup = false                          -- nvim default : (+writebackup) ? on : off

-- Make a backup before overwriting a file.
-- o.backup = true                                 -- nvim default : off

-- Make a backup
-- o.writebackup = true                            -- nvim default : (+writebackup) ? on : off

-- List of directories for backup files
--   nvim default : (unix) ? '.,~/tmp,~/' ; '.,$TEMP,c:\\tmp,c:\\temp'
-- opt.backupdir = '~/.local/share/nvim/tmp/backup/'   -- nvim default : see above
-- opt.backupdir = vim.fn.stdpath('data')..'/tmp/backup/'   -- nvim default : see above

-- List of file patterns to skip creating a backup of
--   nvim default : '/tmp/*,/$TMPDIR/*,$TMP/*,$TEMP/*'
 -- o.backupskip = '/tmp/*,/private/tmp/*'            -- nvim default : see above
-- opt.backupskip = '/tmp/*,/private/tmp/*'            -- nvim default : see above

-- When writing a backup file, how should it be done?
--   yes  : make a copy and overwrite the original
--   no   : rename file and write a new one
--   auto : one of the previous that works best
-- o.backupcopy = 'yes'                            -- nvim default : (unix) ? 'yes' : 'auto'

---  swap
---
-- Use a swapfile for the buffer.
opt.swapfile = false                             -- nvim default : on

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
opt.sessionoptions:append { 'slash', 'unix' }

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

-- You will have bad experience for diagnostic messages when it's default 4000.
opt.updatetime  = 100

-- do not give |ins-completion-menu| messages.
opt.shortmess:append { c = true }

-- time to wait for a mpped sequence ot complete ( in milliseconds )
opt.timeoutlen = 10

-- always show signcolumns
opt.signcolumn = 'yes'
