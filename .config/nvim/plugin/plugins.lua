local fn      = vim.fn
local execute = vim.api.nvim_command

---  bootstrap packer
---
local bootstrap_packer = function()
  local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
  local packer_installed = fn.isdirectory(install_path) == 1

  vim.cmd [[autocmd BufWritePost plugins.lua  PackerCompile profile=true]]

  if not packer_installed then
    execute( '!git clone https://github.com/wbthomason/packer.nvim '..install_path )
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    execute [[ packadd packer.nvim ]]
    local compiled_file = fn.stdpath('config')..'/plugin/packer_compiled.lua'
    local packer_compiled = fn.filereadable(compiled_file) == 1
    if not packer_compiled then
      require 'plugins'.init_packer()
    end
    vim.defer_fn(vim.schedule_wrap(function()
      require 'packer'.sync()
      -- require 'bootstrap'
    end), 0)
    -- vim.cmd( "autocmd User PackerComplete ++once lua require 'bootstrap'" )
  else
    execute [[ packadd packer.nvim ]]
    -- init_packer()
    -- require 'bootstrap'
    local compiled_file = fn.stdpath('config')..'/plugin/packer_compiled.lua'
    local packer_compiled = fn.filereadable(compiled_file) == 1
    if not packer_compiled then
      require 'plugins'.init_packer()
      -- require 'packer'.compile()
      vim.defer_fn(vim.schedule_wrap(function()
        require 'packer'.compile()
      end), 0)
    end
  end
end

bootstrap_packer()
