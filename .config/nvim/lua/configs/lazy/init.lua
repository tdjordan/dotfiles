----------
---
---  Lazy Plugins
---
----------

---  do not display intro message on startup
---
vim.opt.shortmess:append { I = true }

vim.pack.add { 'https://github.com/folke/lazy.nvim.git' }

require 'lazy'.setup(
  {
    spec = {
      { import = 'plugins' },
      -- { import = 'plugins',            cond = true },
      -- { import = 'plugins.not_vscode', cond = function() return not vim.g.vscode end },
      -- { import = 'plugins.vscode',     cond = function() return     vim.g.vscode end }
      { import = 'plugins.theme.colorschemes' }
    },
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
      enabled = false,
      notify = false
    },
    change_detection = {
      enabled = false,
      notify = false
    },
    -- diff = {
    --   cmd = 'diffview.nvim'
    --   cmd = 'terminal_git'
    -- },
    performance = {
      cache = {
        enabled = true,
      },
      reset_packpath = true,
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
      loader = true,
      -- Track each new require in the Lazy profiling tab
      require = true,
    }
  }
)
