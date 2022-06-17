---  compile packer
---
vim.cmd [[ packadd packer.nvim ]]
require 'plugins'.init_packer()
require 'packer'.compile()
