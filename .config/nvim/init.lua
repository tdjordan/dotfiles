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
-- g.loaded_shada_plugin      = 1
g.loaded_gzip              = 1
g.loaded_matchit           = 1
-- g.loaded_matchparen        = 1
g.loaded_netrwPlugin       = 1
g.loaded_tarPlugin         = 1
g.loaded_zipPlugin         = 1
-- g.loaded_node_provider     = false
-- g.loaded_perl_provider     = false
-- g.loaded_man               = 1
g.loaded_2html_plugin      = 1
g.loaded_tutor_mode_plugin = 1
g.loaded_remote_plugins    = 1
-- g.did_indent_on            = true
g.do_filetype_lua          = 1
g.did_load_filetypes       = 0
-- vim.cmd "syntax off"
-- g.syntax_on                = true
-- g.syntax_cmd               = 'off'

-- vim.cmd [[inoremap jk <esc>]]

-- pcall( require, 'impatient' )
-- local ok, impatient = pcall( require, 'impatient' )
-- if ok then
--   impatient.enable_profile()
-- end
-- require 'impatient'.enable_profile()
-- require 'autocmd'
-- require 'init_plugins'
