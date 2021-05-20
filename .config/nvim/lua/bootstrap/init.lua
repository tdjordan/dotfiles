-- local cmd     = vim.cmd
local fn      = vim.fn
-- local input   = fn.input
-- local system  = fn.system
local execute = vim.api.nvim_command

--  bootstrap packer
--
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty( fn.glob( install_path ) ) > 0 then
  execute( '!git clone https://github.com/wbthomason/packer.nvim '..install_path )
--  execute( '!nvim -u '..fn.stdpath("config")..'/init.lua +PackerInstall' )
end
-- execute [[ packadd packer.nvim ]]
vim.cmd [[ packadd packer.nvim ]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
