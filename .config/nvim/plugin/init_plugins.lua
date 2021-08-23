local fn      = vim.fn
local cmd     = vim.cmd
-- local execute = vim.api.nvim_command

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
local packer_installed = fn.isdirectory(install_path)
-- local packer_installed, _ = pcall(vim.cmd, [[packadd packer.nvim]])
-- local _, packer = pcall(require, 'packer')
local compiled_file = fn.stdpath('config')..'/plugin/packer_compiled.lua'
local packer_compiled = fn.filereadable(compiled_file) == 1

cmd [[ silent! command PackerSync    lua require('plugins').init_packer() require('packer').sync()           ]]
cmd [[ silent! command PackerCompile lua require('plugins').init_packer() require('packer').compile()        ]]
-- cmd [[ silent! command PackerUpdate  lua require('plugins').init_packer() require('packer').update()         ]]
-- cmd [[ silent! command PackerInstall lua require('plugins').init_packer() require('packer').install()        ]]
cmd [[ silent! command PackerClean   lua require('plugins').init_packer() require('packer').clean()          ]]
cmd [[ silent! command PackerProfile lua require('plugins').init_packer() require('packer').profile_output() ]]
cmd [[ silent! command PackerStatus  lua require('plugins').init_packer() require('packer').status()         ]]

if packer_installed and packer_compiled then return end

-- if not packer_installed then
--   require 'bootstrap.install'()
-- end
-- if not packer_compiled  then require 'bootstrap.compile' end
if not packer_installed or not packer_compiled then require 'bootstrap' end
