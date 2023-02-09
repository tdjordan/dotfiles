----------
---
---  Lazy Plugins
---
----------

local fn  = vim.fn

local install_path = fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(install_path) then
  vim.notify('Cloning lazy.nvim ....', 'info')
  fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    install_path
  }
end

vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '

vim.opt.rtp:prepend(install_path)

require 'lazy'.setup(
  {
    { import = 'plugins' }
    , { import = 'plugins.ui' }
  },
  {
    -- spec = {
    --   { import = 'plugins' }
    -- },
    defaults = {
      lazy = true,
    },
    -- concurrency = 70,
    install = {
      colorscheme = {
        'material'
        , 'tokyonight'
        , 'habamax'
      }
    },
    checker = {
      enabled = true
    },
    -- diff = {
    --   cmd = 'diffview.nvim'
    -- },
    performance = {
      disabled_plugins = {
        'gzip',
        'matchit',
        -- 'matchparen',
        'netrwPlugin',
        'rplugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      }
    }
  }
)
