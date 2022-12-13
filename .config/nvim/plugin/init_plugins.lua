local fn  = vim.fn
-- local cmd = vim.cmd

-- local packer_installed, _ = pcall(cmd, [[packadd packer.nvim]])
local packer_install_p    = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
local packer_compiled_fn  = fn.stdpath('config') .. '/plugin/packer_compiled.lua'

local packer_installed    = fn.filereadable(packer_install_p) == 1
local packer_compiled     = fn.filereadable(packer_compiled_fn) == 1

-- local _ = (packer_installed or require 'bootstrap'.bootstrap_packer()) and (fn.filereadable(packer_compiled_fn) == 1 or require 'bootstrap'.compile_packer())

local _ = (packer_compiled or require 'bootstrap'.init())
