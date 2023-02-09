local fn  = vim.fn
local loop = vim.loop

vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '

local lazy_install_p    = fn.stdpath('data') .. '/lazy/lazy.nvim'

local lazy_installed    = loop.fs_stat(lazy_install_p)

local _ = (lazy_installed or require 'bootstrap'.init())

vim.opt.rtp:prepend(lazy_install_p)

require 'configs.lazy'
