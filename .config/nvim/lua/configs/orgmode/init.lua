local orgmode = require 'orgmode'

-- load custom treesitter grammar for org filetype
orgmode.setup_ts_grammar()

orgmode.setup {
  org_agenda_files = '~/.notes/org/*'
  , org_default_notes_file = '~/.notes/org/refile.org'
}
