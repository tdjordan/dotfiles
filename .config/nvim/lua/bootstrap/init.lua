local fn  = vim.fn
local cmd = vim.cmd

---  bootstrap packer
---
local bootstrap_packer = function()
  local install_path        = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
  local packer_installed, _ = pcall(vim.cmd, [[packadd packer.nvim]])
  local compiled_file       = fn.stdpath('config')..'/plugin/packer_compiled.lua'
  local packer_compiled     = fn.filereadable(compiled_file) == 1

  if packer_installed and packer_compiled then return end

  if not packer_installed then
    -- local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

    print("Cloning packer ....")
    fn.delete(install_path, 'rf')
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })

    cmd [[ packadd packer.nvim ]]
    require 'plugins'.init_packer()
    require 'packer'.sync()
  else
    if not packer_compiled then
      cmd [[ packadd packer.nvim ]]
      require 'plugins'.init_packer()
      -- local _, packer = pcall(require, 'packer')
      require 'packer'.compile()
    end
  end
  -- cmd [[autocmd BufWritePost plugins.lua PackerCompile profile=true]]
end

bootstrap_packer()
