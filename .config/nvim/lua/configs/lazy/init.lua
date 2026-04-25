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

---@diagnostic disable-next-line: undefined-field
if not vim.uv.fs_stat(install_path) then
  vim.notify('Cloning lazy.nvim ....', vim.log.levels.INFO)
  local out = fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    install_path
  }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", 'ErrorMsg' },
      { out, 'WarningMsg' },
      { "\nPress any key to exit..." }
    }, true, {})
  end
end

-- mapleader is set in init.lua before any requires

vim.opt.rtp:prepend(install_path)

require 'lazy'.setup(
  {
    spec = {
      { import = 'plugins.always',     cond = true },
      { import = 'plugins.not_vscode', cond = function() return not vim.g.vscode end },
      { import = 'plugins.vscode',     cond = function() return     vim.g.vscode end }
    , { import = 'plugins.not_vscode.theme.colorschemes' }
      -- { import = 'plugins' }
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
