local fn  = vim.fn
local cmd = vim.cmd

local packer_installed, _ = pcall(cmd, [[packadd packer.nvim]])
local packer_compiled_fn  = fn.stdpath('config')..'/lua/packer_compiled.lua'
local packer_compiled     = fn.filereadable(packer_compiled_fn) == 1

if not packer_installed or not packer_compiled then require 'bootstrap' end

cmd [[ silent! command PackerSync    lua require('plugins').init_packer() require('packer').sync()           ]]
cmd [[ silent! command PackerCompile lua require('plugins').init_packer() require('packer').compile()        ]]
-- cmd [[ silent! command PackerUpdate  lua require('plugins').init_packer() require('packer').update()         ]]
-- cmd [[ silent! command PackerInstall lua require('plugins').init_packer() require('packer').install()        ]]
cmd [[ silent! command PackerClean   lua require('plugins').init_packer() require('packer').clean()          ]]
cmd [[ silent! command PackerProfile lua require('plugins').init_packer() require('packer').profile_output() ]]
cmd [[ silent! command PackerStatus  lua require('plugins').init_packer() require('packer').status()         ]]

-- require 'impatient'
local packer_compiled_post_boot = fn.filereadable(packer_compiled_fn) == 1
if packer_installed and packer_compiled_post_boot then require 'packer_compiled' end
