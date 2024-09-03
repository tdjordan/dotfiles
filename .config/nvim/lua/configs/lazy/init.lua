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
    ui = {
    --   size = {
    --     width  = 0.95,
    --     height = 0.95
    --   }
      pills = false,
    --   custom_keys = {
    --     -- You can define custom key maps here. If present, the description will
    --     -- be shown in the help menu.
    --     -- To disable one of the defaults, set it to false.
    --
    --     ["<localleader>l"] = {
    --       function(plugin)
    --         require("lazy.util").float_term({ "lazygit", "log" }, {
    --           cwd = plugin.dir,
    --         })
    --       end,
    --       desc = "Open lazygit log",
    --     },
    --
    --     ["<localleader>t"] = {
    --       function(plugin)
    --         require("lazy.util").float_term(nil, {
    --           cwd = plugin.dir,
    --         })
    --       end,
    --       desc = "Open terminal in plugin dir",
    --     },
    --   },
    },
    checker = {
    --   enabled = true,
      notify = false
    },
    -- diff = {
    --   cmd = 'diffview.nvim'
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
    },
    -- Enable profiling of lazy.nvim. This will add some overhead,
    -- so only enable this when you are debugging lazy.nvim
    profiling = {
      -- Enables extra stats on the debug tab related to the loader cache.
      -- Additionally gathers stats about all package.loaders
      loader = false,
      -- Track each new require in the Lazy profiling tab
      require = false,
    }
  }
)
