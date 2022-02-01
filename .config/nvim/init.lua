--- gruvbox-material performance
---
-- require 'profiler'

---  do not display intro message on startup
---
vim.opt.shortmess:append { I = true }

---  bypass unused default plugins
---
local g = vim.g
-- vim.opt.shadafile          = 'NONE'
g.loaded_gzip              = false
g.loaded_matchit           = false
-- g.loaded_matchparen        = false
g.loaded_netrwPlugin       = false
g.loaded_tarPlugin         = false
g.loaded_zipPlugin         = false
-- g.loaded_node_provider     = false
-- g.loaded_perl_provider     = false
-- g.loaded_man               = false
g.loaded_2html_plugin      = false
g.loaded_tutor_mode_plugin = false
g.loaded_remote_plugins    = false
-- g.did_indent_on            = true
-- g.did_load_filetypes       = false
g.do_filetype_lua          = true
-- vim.cmd "syntax off"
-- g.syntax_on                = true
-- g.syntax_cmd               = 'off'
