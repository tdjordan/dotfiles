return {
  ---  keymap management
  ---
  {
    'folke/which-key.nvim'
    , lazy = false
    , dependencies = {
      'echasnovski/mini.icons'
    }
    , keys = {
      {
        '<leader>?', function()
          require 'which-key'.show { global = false }
        end,
        desc = 'buffer keymaps (which-key)'
      },
      -- {
      --   '<c-w><space>', function()
      --     require 'which-key'.show { keys = '<c-w>', loop = true }
      --   end,
      --   desc = 'window hydra mode (which-key)'
      -- }
    }
    , init = function()
      vim.opt.timeout = true
      vim.opt.timeoutlen = 300
    end
    , config = function()
      vim.schedule(function()
        require 'configs.keys'
      end)
    end
  },
  ---  Files
  ---
  {
    'nvim-tree/nvim-tree.lua'
    , keys = {
      {
        '<leader>e', function()
          require 'nvim-tree.api'.tree.toggle()
        end, desc = 'explorer'
      }
    }
    , init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end
    , config = function()
      require 'configs.filetree.nvim-tree'
    end
  },
  {
    'nvim-neo-tree/neo-tree.nvim'
    , dependencies = {
      'MunifTanjim/nui.nvim'
    }
    , cmd = 'Neotree'
    , config = function()
      require 'configs.filetree.neo-tree'
    end
  },
  {
    'mrbjarksen/neo-tree-diagnostics.nvim'
    , enabled = false
    , dependencies = {
      'nvim-neo-tree/neo-tree.nvim'
    }
    -- , cmd = 'Neotree'
  },

  ---  guides
  ---
  {
    'lukas-reineke/indent-blankline.nvim'
    -- , name = 'ibl'
    , main = 'ibl'
    , cmd = {
      'IBLToggle',
      'IBLEnable',
      'IBLEnableScope',
      'IBLToggleScope'
    }
    , opts = {
      enabled = true
      , indent = {
        char = ' '
        , smart_indent_cap = true
        , repeat_linebreak = true
      }
      , scope = {
        enabled = true
        , char = '¦'
        , show_start = true
        , show_end = true
        , show_exact_scope = true
        , injected_languages = true
        , highlight = {
          -- 'IblScope'
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        }
        , priority = 1024
        , include = {
          node_type = {
            lua = {
              'return_statement',
              'table_constructor'
            }
          }
        }
        , exclude = {
          language = {}
          , node_type = {
            ['*'] = {
              'source_file',
              'program'
            },
            lua = {
              'chunk'
            },
            python = {
              'module'
            }
          }
        }
      }
    }
    , config = function(_, _opts)
      local hooks = require 'ibl.hooks'

      hooks.register(
        hooks.type.WHITESPACE,
        hooks.builtin.hide_first_space_indent_level
      )
      hooks.register(
        hooks.type.SCOPE_HIGHLIGHT,
        hooks.builtin.scope_highlight_from_extmark
      )

      require 'ibl'.setup(_opts)
    end
  }
}
