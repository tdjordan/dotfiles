----------
---
---  Lazy Plugins
---
----------

---  do not display intro message on startup
---
vim.opt.shortmess:append { I = true }

local fn  = vim.fn

local install_path = fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(install_path) then
  vim.notify('Cloning lazy.nvim ....', 'info')
  fn.system {
    'git',
    'clone',
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
    {   import = 'plugins'                    }
    -- , { import = 'plugins.ui'                 }
    -- , { import = 'plugins.ui.lualine'         }
    -- , { import = 'plugins.lsp'                }
    , { import = 'plugins.theme.colorschemes' }
    -- , { import = 'plugins.theme.material'     }
    -- , { import = 'plugins.whitespace'         }
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
        'kanagawa'
        -- 'material'
        -- , 'tokyonight'
        -- , 'habamax'
      }
    },
    -- ui = {
    --   size = {
    --     width  = 0.95,
    --     height = 0.95
    --   }
    -- },
    checker = {
    --   enabled = true,
      notify = false
    },
    -- diff = {
    --   cmd = 'diffview.nvim'
    -- },
    -- diff = {
    --   cmd = 'terminal_git'
    -- },
    performance = {
      rtp = {
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
  }
)
