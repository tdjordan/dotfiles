local fn  = vim.fn
local cmd = vim.cmd

local packer_compiled_fn = fn.stdpath('config') .. '/plugin/packer_compiled.lua'

---  compile packer
---
local compile_packer = function()
  cmd [[ packadd packer.nvim ]]
  require 'plugins'.init_packer()
  require 'packer'.compile()
end

---  bootstrap packer
---
local bootstrap_packer = function()
  local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

  vim.notify('Cloning packer ....', 'info')
  fn.delete(install_path, 'rf')
  fn.delete(packer_compiled_fn, 'rf')
  fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  }

  vim.cmd [[packadd packer.nvim]]
  require 'plugins'.init_packer()
  require 'packer'.sync()
end

-- cmd [[autocmd BufWritePost plugins.lua PackerCompile profile=true]]

return {
  bootstrap_packer = bootstrap_packer
  , compile_packer = compile_packer
}
