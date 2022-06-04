local fn  = vim.fn
local cmd = vim.cmd

local packer_installed, _ = pcall(cmd, [[packadd packer.nvim]])
-- local packer_compiled_fn  = fn.stdpath('config')..'/lua/packer_compiled.lua'
local packer_compiled_fn  = fn.stdpath('config')..'/plugin/packer_compiled.lua'
local packer_compiled     = fn.filereadable(packer_compiled_fn) == 1

_ = (not packer_installed or not packer_compiled) and require 'bootstrap'
