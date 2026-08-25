return {
  ---  keymap management
  ---
  {
    'folke/which-key.nvim'
    , lazy = false
    , dependencies = {
      -- 'nvim-tree/nvim-web-devicons',
      'nvim-mini/mini.icons'
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
    "mikavilpas/yazi.nvim"
    , dependencies = {
      "nvim-lua/plenary.nvim"
    }
    , keys = {
      {
        '<leader>i', function()
          vim.cmd( 'Yazi' )
        end, desc = 'open yazi at current file'
      }
    }
    , init = function()
      vim.g.loaded_netrwPlugin = 1
    end
    , opts = {
      open_for_directories = false
      , keymaps = {
        show_help = '<f1>'
      }
    }
  },
  {
    'nvim-tree/nvim-tree.lua'
    , keys = {
      {
        '<leader>E', function()
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
      'MunifTanjim/nui.nvim',
      'mrbjarksen/neo-tree-diagnostics.nvim'
    }
    , cmd = 'Neotree'
    , keys = {
      {
        '<leader>n', function()
          vim.cmd('Neotree toggle')
        end, desc = 'neotree'
      },
      {
        '\\e', function()
          vim.cmd('Neotree toggle')
        end, desc = 'neotree'
      }
    }
    , opts = {
      sources = {
        'filesystem'
        , 'buffers'
        , 'git_status'
        , 'diagnostics'
      }
      , close_if_last_window = true
      , popup_border_style = ""
      , filesystem = {
        follow_current_file = { enabled = true }
        , group_empty_dirs = true
        , filtered_items = {
          always_show = {
            '.gitignore',
            '.editorconfig'
          },
          always_show_by_pattern = {
            '.env*'
          }
        }
      }
      -- default diagnostics definition
      -- , diagnostics = {
      --   renderers = {
      --     file = {
      --       { "indent" },
      --       { "icon" },
      --       { "grouped_path" },
      --       { "name" },
      --       { "diagnostic_count", show_when_none = true },
      --       { "split_diagnostic_counts", left_padding = 1 },
      --       { "clipboard" },
      --     },
      --     diagnostic = {
      --       { "indent" },
      --       { "icon" },
      --       { "name" },
      --       { "source" },
      --       { "code" },
      --       { "position" },
      --     },
      --   }
      -- }
      -- , diagnostics = {
      --   components = {
      --     linenr = function(config, node)
      --       local lnum = tostring(node.extra.diag_struct.lnum + 1)
      --       local pad = string.rep(" ", 4 - #lnum)
      --       return {
      --         {
      --           text = pad .. lnum,
      --           highlight = "LineNr",
      --         },
      --         {
      --           text = "▕ ",
      --           highlight = "NeoTreeDimText",
      --         }
      --       }
      --     end
      --   },
      --   renderers = {
      --     file = {
      --       { "indent" },
      --       { "icon" },
      --       { "grouped_path" },
      --       { "name", highlight = "NeoTreeFileNameOpened" },
      --       { "diagnostic_count", highlight = "NeoTreeDimText", severity = "Error", right_padding = 0 },
      --       { "diagnostic_count", highlight = "NeoTreeDimText", severity = "Warn", right_padding = 0 },
      --       { "diagnostic_count", highlight = "NeoTreeDimText", severity = "Info", right_padding = 0 },
      --       { "diagnostic_count", highlight = "NeoTreeDimText", severity = "Hint", right_padding = 0 },
      --       { "clipboard" },
      --     },
      --     diagnostic = {
      --       { "indent" },
      --       { "icon" },
      --       { "linenr" },
      --       { "name" },
      --     },
      --   },
      -- },
    }
    -- , config = function()
    --   require 'configs.filetree.neo-tree'
    -- end
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
    },
    config = true
  },
  {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    opts = {
      filter_rules = {
        include_current_win = false,
        autoselect_one = true,
        -- filter using buffer options
        bo = {
          -- if the file type is one of following, the window will be ignored
          filetype = { "neo-tree", "neo-tree-popup", "notify" },
          -- if the buffer type is one of following, the window will be ignored
          buftype = { "terminal", "quickfix" },
        },
      },
    }
  },
  -- {
  --   'mrbjarksen/neo-tree-diagnostics.nvim'
  --   , enabled = false
  --   , dependencies = {
  --     'nvim-neo-tree/neo-tree.nvim'
  --   }
  --   -- , cmd = 'Neotree'
  -- },

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
