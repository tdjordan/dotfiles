--- gruvbox-material performance
---
-- require 'profiler'

-- vim.g.start_time = vim.fn.reltime()

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

-- vim.cmd [[
--   syntax off
--   filetype off
--   filetype plugin indent off
-- ]]

vim.cmd [[
  rshada!
  syntax on
  filetype on
  filetype plugin indent on
  au BufNewFile,BufRead *.http setf http
]]

---  bypass unused default plugins
---
-- vim.opt.shadafile           = 'NONE'
vim.g.loaded_gzip           = false
vim.g.loaded_matchit        = false
vim.g.loaded_matchparen     = false
vim.g.loaded_netrwPlugin    = false
vim.g.loaded_tarPlugin      = false
vim.g.loaded_zipPlugin      = false
-- vim.g.loaded_node_provider  = false
-- vim.g.loaded_perl_provider  = false
-- vim.g.loaded_man            = false
vim.g.loaded_2html_plugin   = false
vim.g.loaded_remote_plugins = false

---  lazy laod config ?
---

-- vim.defer_fn(function()
  ---  bootstrap plugins
  ---
require 'plugins'
vim.cmd [[ hi String gui=NONE  ]]

  -- vim.opt.shadafile = ""

  -- require 'packer'.loader('which-key')
  -- require 'configs.which-key'
  -- require 'packer'.loader('melange')
  -- vim.g.colors_name = 'melange'

  ---  background the configs
  ---
  -- vim.defer_fn(function()
    ---  base
    ---
    -- require 'settings'

    -- local packer = require 'packer'
    -- packer.loader('nvim-treesitter')
    -- packer.loader('melange')
      -- filetype on
      -- filetype plugin indent on
    -- vim.cmd [[
    --   rshada!
    --   syntax on
    --   filetype off
    --   filetype plugin indent on
    --   au BufNewFile,BufRead *.http setf http
    -- ]]

    ---  local configs
    ---
    -- require 'configs'

    -- vim.cmd [[ silent! bufdo e ]]
    -- vim.cmd [[ colorscheme melange ]]
    -- require 'packer'.loader('gruvbox-material')
    -- vim.cmd [[ colorscheme gruvbox-material ]]
    -- vim.cmd [[ hi String gui=NONE  ]]
    -- vim.cmd [[ colorscheme doom-one ]]
    -- vim.cmd [[ colorscheme ayu ]]
  -- vim.defer_fn(function()
  --   vim.cmd [[ colorscheme gruvbox-material ]]
  --   vim.cmd [[ hi String gui=NONE  ]]
  -- end, 1)

    -- vim.cmd [[
    --   syntax enable
    --   filetype on
    --   filetype plugin indent on
    --   au BufNewFile,BufRead *.http setf http
    -- ]]
  -- vim.cmd [[ source plugin/packer_compiled.lua ]]
-- vim.opt.loadplugins = true
-- vim.cmd [[ luafile plugin/packer_compiled.lua ]]
-- end, 0)
