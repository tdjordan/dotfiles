------------------------
------
------  Settings
------
------------------------

---  got the idea of using set from
---    https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
---
local set = vim.opt

-- local o   = vim.o
-- local go  = vim.go
-- local wo  = vim.wo
-- local bo  = vim.bo
-- local g   = vim.g

------  Vim Settings
------
-- Indentation settings for 2 spaces instead of tabs
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
set.smarttab      = true                         -- nvim default : on
set.expandtab     = true                         -- nvim default : off
set.shiftwidth    = 2                            -- nvim default : 8
set.softtabstop   = 2                            -- nvim default : 8
set.tabstop       = 2                            -- nvim default : 8
set.shiftround    = true                         -- nvim default : off

-- When opening a new line and no filetype-specific indenting is enabled,
-- keep the same indent as the line you are currently on.
-- set.autoindent     = true                        -- nvim default : on
set.cindent        = true
-- set.smartindent    = true                        -- nvim default : off

-- Display the cursor position on the last line of the screen
-- or in the status line of a window
set.ruler          = true                        -- nvim default : off

-- Open splits to the right
set.splitright     = true
set.splitkeep      = 'screen'

-- Allow window re-use to switch from an unsaved buffer without saving it first.
-- Allows moltiple file undo history for the same window.
set.hidden         = true

-- Highlight searches
set.hlsearch       = false                       -- nvim default : on

-- Use case insensitive search, except when using capital letters
set.ignorecase     = true                        -- nvim default : off
set.smartcase      = true                        -- nvim default : off
set.showmatch      = true                        -- nvim default : off
-- o.incsearch    = true                           -- nvim default : on

-- Display line numbers in the left gutter
set.number         = true                        -- nvim default : off
set.relativenumber = true                        -- nvim default : off

-- display space above/below left/right of cursor
set.scrolloff      = 1
set.sidescrolloff  = 5

-- When will the last window have a status line?
--   0 : never
--   1 : only if there are at least two windows
--   2 : always
--   3 : global status line instead of one per window
if vim.g.started_by_firenvim then
  set.laststatus     = 0                           -- nvim default : 2
else
  set.laststatus     = 3                           -- nvim default : 2
end

-- turn on winbar support
-- set.winbar = "%{get(b:, 'gitsigns_status', '')}"

-- Highlight the screen line of the cursor with CursorLine
set.cursorline     = true                        -- nvim default : off

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
--      r = for hit-enter & more-prompt prompts
-- set.mouse         = 'a'                          -- nvim defaults : 'a'
set.mouse = 'n'

-- o.guioptions = 'A'

-- Enable 24-bit RGB color in the TUI
--if has ('termguicolors')
set.termguicolors = true
--endif

------  TODO: nvim defaults - not currently used
------
-- o.complete       = true                         -- nvim doesn't include 'i'
-- o.display        = lastline                     -- nvim defaults to 'lastline'
-- o.fileencoding   = 'utf-8'                     -- nvim defaults to ''
set.encoding       = 'utf-8'                     -- nvim defaults to 'utf-8'
set.concealcursor  = 'nc'                        -- n:Normal v:Visual i:Insert c:Command ( Modes )
set.conceallevel   = 2                           -- 'Conceal' hi group / text hidden unless has replacement ch
-- set.conceallevel   = 0                           -- 'Conceal' hi group / text hidden unless has replacement ch
  -- TODO : to allow '' to be visible in markdown files, set conceallevel to 0
--
-- o.langremap      = false                        -- nvim default ( langremap off )
-- o.langnoremap    = true                         -- nvim default ( deprecated alias for nolangremap )
-- o.laststatus     = true                         -- nvim defaults to 2 (statusline is always shown)
-- set.listchars      = 'tab:> ,trail:-,nbsp:+,eol:↴'      -- nvim default
set.listchars =
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
-- o.viminfo        = true                         -- ( deprecated ) nvim includes '!' : nvim alias for shada
------
-- INFO : nvim defaults - not currently used

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
set.backspace = 'indent,eol,start'                -- nvim default : 'ident,eol,start'
set.shell     = '/bin/zsh'                        -- nvim default : $SHELL or sh or cmd.exe

-- Allow for old vim shell muscle memory
--cnoreabbrev sh terminal

-- Insert mode completion options
--   menu
--   : use a popup menu to show the possible completions
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
--   : force user to select one from the menu
--
--  nvim default : 'menu,preview'
-- set.completeopt = { 'menuone', 'noinsert', 'noselect' }
set.completeopt = { 'menuone', 'noselect' }

-- Maximum width of text that is being inserted.
-- A longer line will be broken after white space to get this width.
-- Zero disables this feature.
-- o.textwidth = 100                               -- nvim default : 0

-- o.ttyfast = true                                -- not in nvim - always set
set.showmode = false

-- If a file changes outside of nvim, automatically read it again.
set.autoread = true                              -- nvim default : on

-- If file content changes, automatically write it when buffer loses focus.
-- o.autowrite    = true                           -- nvim default : off
-- o.autowriteall = true                           -- nvim default : off

-- Better display for messages
-- Set the command window height to 2 lines,
-- to avoid many cases of having to --press <Enter> to continue--
set.cmdheight = 1                                -- nvim default : 1

-- Show partial commands in the last line of the screen
set.showcmd   = true                             -- nvim default : (unix) ? off : on

--------------------
------
------  backup/persistence settings
------
--------------------

------  undo
------
-- List of directory names for undo files
set.undodir = vim.fn.stdpath('data')..'/tmp/undo/nvim/'   -- nvim default : '.'

--  when writing a buffer to a file, and
--  restore undo history from same file on buffer read
set.undofile = true                              -- nvim default : off

-- Maximum number of changes that can be undone.
-- o.undolevels = 1000                             -- nvim default : 1000

-- Save whole buffer for undo when reloading it.
-- o.undoreload = 10000                            -- nvim default : 10000

------  backup
------
-- Some LSP servers have issues with backup files, see #649
set.backup      = false                          -- nvim default : off
set.writebackup = false                          -- nvim default : (+writebackup) ? on : off

-- Make a backup before overwriting a file.
-- o.backup = true                                 -- nvim default : off

-- Make a backup
-- o.writebackup = true                            -- nvim default : (+writebackup) ? on : off

-- List of directories for backup files
--   nvim default : (unix) ? '.,~/tmp,~/' ; '.,$TEMP,c:\\tmp,c:\\temp'
-- set.backupdir = '~/.local/share/nvim/tmp/backup/'   -- nvim default : see above
-- set.backupdir = vim.fn.stdpath('data')..'/tmp/backup/'   -- nvim default : see above

-- List of file patterns to skip creating a backup of
--   nvim default : '/tmp/*,/$TMPDIR/*,$TMP/*,$TEMP/*'
-- o.backupskip = '/tmp/*,/private/tmp/*'            -- nvim default : see above
-- set.backupskip = '/tmp/*,/private/tmp/*'            -- nvim default : see above

-- When writing a backup file, how should it be done?
--   yes  : make a copy and overwrite the original
--   no   : rename file and write a new one
--   auto : one of the previous that works best
-- o.backupcopy = 'yes'                            -- nvim default : (unix) ? 'yes' : 'auto'

---  swap
---
-- Use a swapfile for the buffer.
set.swapfile = false                             -- nvim default : on

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
--
-- o.shada = o.shada .. 'f1'                       -- nvim default : !,'100,<50,s10,h

------  sessions
------
-- Allow Windows & Linux to share session files
--   nvim default : blank,buffers, curdir, folds,help,tabpages,winsize
-- set.sessionoptions:append { 'slash', 'unix' }   -- slash & unix are neovim deprecated

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
-- set.spell = true
set.spelllang = { 'en_us' }

-- You will have bad experience for diagnostic messages when it's default 4000.
set.updatetime  = 100

-- do not give |ins-completion-menu| messages.
set.shortmess:append { c = true }

-- time to wait for a mapped sequence to complete ( in milliseconds )
-- set.timeoutlen = 10
set.timeoutlen = 300

-- always show signcolumns
set.signcolumn = 'yes'

vim.g.italic_keywords = 'italic'

---  fix cursorhold performance
-- vim.g.cursorhold_updatetime = 100
