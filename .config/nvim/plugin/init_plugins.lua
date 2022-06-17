local fn  = vim.fn
local cmd = vim.cmd

local packer_installed, _ = pcall(cmd, [[packadd packer.nvim]])
local packer_compiled_fn  = fn.stdpath('config') .. '/plugin/packer_compiled.lua'

local _ = (packer_installed or require 'bootstrap'.bootstrap_packer()) and (fn.filereadable(packer_compiled_fn) == 1 or require 'bootstrap'.compile_packer())
