---  theme
---
-- require 'theme'

-- local fn      = vim.fn
local cmd     = vim.cmd

---  bootstrap packer
---
cmd [[ packadd packer.nvim ]]
require 'plugins'.init_packer()
require 'packer'.compile()
