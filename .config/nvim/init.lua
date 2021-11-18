--- gruvbox-material performance
---
-- require 'profiler'

---  reduce flicker at startup
---
-- vim.opt.statusline     = '%1*'
-- vim.opt.number         = true
-- vim.opt.relativenumber = true
-- vim.opt.signcolumn     = 'yes'
-- vim.cmd [[
--   highlight SignColumn guibg=black ctermbg=black
--   highlight LineNr guifg=black ctermfg=black
--   highlight Normal guifg=black ctermfg=black
-- ]]

-- vim.opt.loadplugins = false

---  do not display intro message on startup
---
-- require 'impatient'
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
g.did_load_filetypes       = true
-- cmd "syntax off"
-- g.xyntax_on                = true
-- g.syntax_cmd               = 'off'

-- cmd [[ hi String gui=NONE  ]]

g.italic_keywords = 'italic'

-- g.colors_name = 'onedark'

-- g.cfg = {
--   theme = {
--     doomone = {
--       active = true
--     }
--   }
-- }
