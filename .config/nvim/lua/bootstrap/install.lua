local fn      = vim.fn
local cmd     = vim.cmd

---  bootstrap packer - install
---
return function()
  local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

  print("Cloning packer ....")
  fn.delete(install_path, 'rf')
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })

  cmd [[ packadd packer.nvim ]]
  require 'plugins'.init_packer()
  require 'packer'.sync()
end
