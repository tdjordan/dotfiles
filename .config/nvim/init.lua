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
vim.opt.shortmess:append { I = true }

local cmd = vim.cmd
-- cmd [[
--   syntax on
--   filetype on
--   filetype plugin indent on
-- ]]
-- vim.cmd [[
  -- rshada!
-- ]]

---  bypass unused default plugins
---
local g = vim.g
-- vim.opt.shadafile           = 'NONE'
g.loaded_gzip           = false
g.loaded_matchit        = false
g.loaded_matchparen     = false
g.loaded_netrwPlugin    = false
g.loaded_tarPlugin      = false
g.loaded_zipPlugin      = false
-- vim.g.loaded_node_provider  = false
-- vim.g.loaded_perl_provider  = false
-- vim.g.loaded_man            = false
g.loaded_2html_plugin   = false
g.loaded_remote_plugins = false

---  lazy laod config ?
---

-- require 'plugins'
cmd [[ hi String gui=NONE  ]]
