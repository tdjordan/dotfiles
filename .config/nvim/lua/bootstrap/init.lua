local fn  = vim.fn
local cmd = vim.cmd

---  bootstrap packer
---
local bootstrap_packer = function()
  local install_path        = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
  local packer_installed, _ = pcall(vim.cmd, [[packadd packer.nvim]])
  local packer_compiled_fn  = fn.stdpath('config')..'/lua/packer_compiled.lua'
  local packer_compiled     = fn.filereadable(packer_compiled_fn) == 1

  if packer_installed and packer_compiled then return end

  if not packer_installed then
    print("Cloning packer ....")
    fn.delete(install_path, 'rf')
    fn.system {
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
    }

    cmd [[ packadd packer.nvim ]]
    require 'plugins'.init_packer()
    require 'packer'.sync()
  else
    if not packer_compiled then
      cmd [[ packadd packer.nvim ]]
      require 'plugins'.init_packer()
      require 'packer'.compile()
    end
  end
  -- cmd [[autocmd BufWritePost plugins.lua PackerCompile profile=true]]
end

bootstrap_packer()
