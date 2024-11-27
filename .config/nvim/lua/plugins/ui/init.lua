return {
  {
    'vigoux/notifier.nvim'
    , lazy = false
    , enabled = true
    , opts = {
      ignore_messages = {
        'null_ls'
      }
      -- components = {
      --   'lsp'
      -- }
      -- component_name_recall = true
    },
  },
  {
    'j-hui/fidget.nvim'
    , lazy = false
    , enabled = false
    , opts = {
      -- Options related to LSP progress subsystem
      progress = {
        poll_rate = 0,                -- How and when to poll for progress messages
        suppress_on_insert = false,   -- Suppress new messages while in insert mode
        ignore_done_already = false,  -- Ignore new tasks that are already complete
        ignore_empty_message = false, -- Ignore new tasks that don't contain a message
        clear_on_detach =             -- Clear notification group when LSP server detaches
          function(client_id)
            local client = vim.lsp.get_client_by_id(client_id)
            return client and client.name or nil
          end,
        notification_group =          -- How to get a progress message's notification group key
          function(msg) return msg.lsp_client.name end,
        ignore = {},                  -- List of LSP servers to ignore

        -- Options related to how LSP progress messages are displayed as notifications
        display = {
          render_limit = 16,          -- How many LSP messages to show at once
          done_ttl = 5,--3,               -- How long a message should persist after completion
          done_icon = "✔",            -- Icon shown when all LSP progress tasks are complete
          done_style = "Constant",    -- Highlight group for completed LSP tasks
          progress_ttl = math.huge,   -- How long a message should persist when in progress
          progress_icon =             -- Icon shown when LSP progress tasks are in progress
            { pattern = "dots", period = 1 },
          progress_style =            -- Highlight group for in-progress LSP tasks
            "WarningMsg",
          group_style = "Title",      -- Highlight group for group name (LSP server name)
          icon_style = "Question",    -- Highlight group for group icons
          priority = 30,              -- Ordering priority for LSP notification group
          skip_history = true,        -- Whether progress notifications should be omitted from history
          -- format_message =            -- How to format a progress message
          --   require("fidget.progress.display").default_format_message,
          format_annote =             -- How to format a progress annotation
            function(msg) return msg.title end,
          format_group_name =         -- How to format a progress notification group's name
            function(group) return tostring(group) end,
          overrides = {               -- Override options from the default notification config
            rust_analyzer = { name = "rust-analyzer" },
          },
        },

        -- Options related to Neovim's built-in LSP client
        lsp = {
          progress_ringbuf_size = 0,  -- Configure the nvim's LSP progress ring buffer size
        },
      },

      -- Options related to notification subsystem
      notification = {
        poll_rate = 10,               -- How frequently to update and render notifications
        filter = vim.log.levels.INFO, -- Minimum notifications level
        history_size = 128,           -- Number of removed messages to retain in history
        override_vim_notify = false,  -- Automatically override vim.notify() with Fidget
        -- configs =                     -- How to configure notification groups when instantiated
        --   { default = require("fidget.notification").default_config },

        -- Options related to how notifications are rendered as text
        view = {
          stack_upwards = true,       -- Display notification items from bottom to top
          icon_separator = " ",       -- Separator between group name and icon
          group_separator = "---",    -- Separator between notification groups
          group_separator_hl =        -- Highlight group used for group separator
            "Comment",
        },

        -- Options related to the notification window and buffer
        window = {
          normal_hl = "Comment",      -- Base highlight group in the notification window
          winblend = 100,             -- Background color opacity in the notification window
          border = "none",            -- Border around the notification window
          zindex = 45,                -- Stacking priority of the notification window
          max_width = 0,              -- Maximum width of the notification window
          max_height = 0,             -- Maximum height of the notification window
          x_padding = 1,              -- Padding from right edge of window boundary
          y_padding = 0,              -- Padding from bottom edge of window boundary
          align = "bottom",           -- How to align the notification window
          relative = "editor",        -- What the notification window position is relative to
        },
      },

      -- Options related to integrating with other plugins
      integration = {
        ["nvim-tree"] = {
          enable = true,              -- Integrate with nvim-tree/nvim-tree.lua (if installed)
        },
      },

      -- Options related to logging
      logger = {
        level = vim.log.levels.WARN,  -- Minimum logging level
        float_precision = 0.01,       -- Limit the number of decimals displayed for floats
        path =                        -- Where Fidget writes its logs to
          string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
      }
    }
  },
  {
    'ntpeters/vim-better-whitespace'
    -- , enabled = false
    , event = 'CursorHold'
    -- , event = 'BufReadPost'
    , config = function()
      local g = vim.g
      g.strip_whitespace_on_save              = true
      g.strip_whitespace_confirm              = false
      g.strip_whitelines_at_eof               = true
      -- g.strip_only_modified_lines             = false
      g.show_spaces_that_precede_tabs         = true
      -- g.strip_max_file_size                   = 1000
      -- g.better_whitespace_skip_empty_lines    = false
      -- g.better_whitespace_verbosity           = false
      g.better_whitespace_operator            = ''
      g.better_whitespace_filetypes_blacklist =
        { 'diff'
        , 'gitcommit'
        , 'unite'
        , 'qf'
        , 'help'
        , 'packer'
        , 'man'
      }
    end
  },
  {
    'SmiteshP/nvim-navic'
    , lazy = false
    , priority = 1000000
    , opts = {
      highlight = true
    }
  },
  {
    'nvim-lualine/lualine.nvim'
    , lazy = false
    , event = 'BufEnter'
    , opts = function()
      local local_colors = {
        bg         = '#202328',
        fg         = '#bbc2cf',
        yellow     = '#ecbe7b',
        cyan       = '#008080',
        darkblue   = '#081633',
        green      = '#98be65',
        orange     = '#FF8800',
        violet     = '#a9a1e1',
        magenta    = '#c678dd',
        purple     = '#c678dd',
        blue       = '#51afef',
        red        = '#ec5f67',
        statusline = '#202328',
        scrollbar  = '#008080',
        material = {
          main = {
            darkpurple = '#b480d6',
          },
          editor = {
            contrast     = '#1a1a1a',
            line_numbers = '#424242'
          }
        },
        kanagawa = {
          oniViolet = '#957fb8'
        }
      }

      -- require 'material'
      -- local colors = require 'material.colors'

      local list_registered_providers_names = function( filetype )
        local s = require 'null-ls.sources'
        local available_sources = s.get_available( filetype )
        local registered = {}
        for _, source in ipairs( available_sources ) do
          for method in pairs( source.methods ) do
            registered[method] = registered[method] or {}
            table.insert( registered[method], source.name )
          end
        end
        return registered
      end

      local list_registered_formatters = function( filetype )
        local nls = require 'null-ls'
        local method = nls.methods.FORMATTING
        return list_registered_providers_names( filetype )[method] or {}
      end

      local list_buffer_conform_formatters = function()
        return require 'conform'.list_formatters_for_buffer(0)
      end

      local list_registered_linters = function( filetype )
        local nls = require 'null-ls'
        local method = nls.methods.DIAGNOSTICS
        return list_registered_providers_names( filetype )[method] or {}
      end

      local hidden_providers =
      { 'codespell'
        , 'trail-space'
        , 'editorconfig_checker'
      }

      local unique_list = function( t )
        -- make unique keys
        local hash = {}
        for _, v in ipairs( t ) do
          hash[v] = true
        end

        -- hide assumed providers
        for _, p in ipairs( hidden_providers ) do
          hash[p] = nil
        end

        -- transform keys back into values
        local res = {}
        for k,_ in pairs( hash ) do
          res[#res+1] = k
        end

        -- print("res  : " .. vim.inspect(res))

        return res
      end

      local winbar_filename = function()
        local bo = vim.bo
        if bo.modified then
          return '● '
            .. vim.fn.expand('%:p:.')
        end
        if vim.fn.expand('%:t') == '' then
          return ''
        end
        return vim.fn.expand('%:p:.')
      end

      ---  Build StatusLine Components
      ---
      local components = {
        branch = {
          "b:gitsigns_head"
        },
        encoding = {
          "o:encoding"
        },
        get_schema = {
          function()
            local schema = require 'yaml-companion'.get_buf_schema(0)
            -- local schema = require 'schema-companion.context'.get_buffer_schema(0)
            if schema.result[1].name == 'none' then
              return ''
            end
            return ("%s").format(schema.result[1].name)
            -- return ("%s"):format(require 'yaml-companion'.get_buf_schema(0).result[1].name)
            -- vim.print( schema )
            -- return schema.name
          end,
          -- cond = function()
          --   return package.loaded["yaml-companion"]
          -- end,
          -- cond = function()
          --   return vim.bo.filetype == 'yaml'
          -- end,
          cond = function()
            return
              vim.bo.filetype == 'yaml'
              or vim.bo.filetype == 'json'
              or vim.bo.filetype == 'helm'
          end
        },
        lsp = {
          function(msg)
            msg = msg or ''
            local buf_clients = vim.lsp.get_clients({ buffer = 0 })
            if next(buf_clients) == nil then
              if type(msg) == "boolean" or #msg == 0 then
                return ''
              end
              return msg
            end
            local buf_ft = vim.bo.filetype
            local buf_client_names = {}

            -- add client
            for _, client in pairs(buf_clients) do
              if client.name ~= 'null-ls' then
                table.insert(buf_client_names, client.name)
              end
            end

            -- add formatter
            local supported_formatters = list_registered_formatters( buf_ft )
            vim.list_extend( supported_formatters, list_buffer_conform_formatters() )

            -- add linter
            local supported_linters = list_registered_linters( buf_ft )
            vim.list_extend(supported_linters, supported_formatters)

            local res = unique_list( supported_linters )
            vim.list_extend( buf_client_names, res )
            return table.concat(buf_client_names, ", ")
          end,
          cond = function() return vim.fn.winwidth(0) > 80 end
        },
        mixedindent = {
          function()
            local space_indent = vim.fn.search([[\v^ +]], 'nw') > 0
            local tab_indent = vim.fn.search([[\v^\t+]], 'nw') > 0
            local mixed = (space_indent and tab_indent) or vim.fn.search([[\v^(\t+ | +\t)]], 'nw') > 0
            return mixed and 'Mixed Indent' or ''
          end
          , color = {
            fg = local_colors.red,
            bg = local_colors.bg,
          }
        },
        mode = {
          function()
            return ' '
          end
          , padding = { left = 0, right = 0 }
          , cond = nil
        },
        navic = {
          function()
            -- return require 'nvim-navic'.get_location( { highlight = true } )
            return require 'nvim-navic'.get_location()
          end
        },
        scrollbar = {
          function()
            local current_line = vim.fn.line "."
            local total_lines = vim.fn.line "$"
            local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
            local line_ratio = current_line / total_lines
            local index = math.ceil(line_ratio * #chars)
            return chars[index]
          end
          , padding = { left = 0, right = 0 }
          , cond = nil
        },
        treesitter = {
          function()
            local b = vim.api.nvim_get_current_buf()
            if next(vim.treesitter.highlighter.active[b]) then
              return ''
            end
            return ''
          end
          , color = { fg = local_colors.green }
        },
        winbar_filename = {
          function()
            return winbar_filename()
          end
          , color = { fg = local_colors.material.main.darkpurple, bg = local_colors.material.editor.contrast }
        },
        winbar_filename_inactive = {
          function()
            return winbar_filename()
          end
          , color = { fg = local_colors.material.editor.line_numbers, bg = local_colors.material.editor.contrast }
        }
      }

      -- require 'kanagawa'
      -- require 'nordic'
      -- vim.cmd.colorscheme 'nordic'
      -- vim.pretty_print(vim.g.colors_name)
      return {
        options = {
          -- theme = 'material-stealth'
          -- theme = 'kanagawa'
          -- theme = 'thom-stealth'
          -- theme = 'nordic'
          theme = 'thom-dynamic'
          -- theme = vim.g.colors_name
          , component_separators = { left = '', right = '' }
          , section_separators = { left = '', right = '' }
          , disabled_filetypes = {            -- filetypes disabled      for lualine
            statusline = {                    -- filetypes disabled only for statusline
              'NvimTree'
              , 'neo-tree'
              , 'dashboard'
              , 'Outline'
            }
            , winbar = {                      -- filetypes disabled only for winbar
              'NvimTree'
              , 'neo-tree'
              , 'dashboard'
              , 'Outline'
            }
          }
          -- , always_divide_middle = true       -- when true { left sections constrained if right sections exist }
          , globalstatus = true               -- when true { global statusline ( 0.7+ ) }
          , refresh = {
            statusline = 1000
            , tabline = 1000
            , winbar = 1000
          }
          , extensions = {
            'nvim-tree'
          }
        }
        , sections = {
          lualine_a = {
            components.mixedindent,
            components.mode
          },
          -- lualine_b = {},
          -- lualine_c = {
          --   components.navic
          -- },
          lualine_c = {
            { 'navic', color_correction = 'dynamic' }
          },
          lualine_x = {
           components.lsp,
            components.treesitter,
            components.get_schema,
            'filetype',
          },
          lualine_y = {
          },
          lualine_z = {
            components.mode
          }
        }
        -- , inactive_sections = {
        -- --   lualine_c = {
        -- --     -- { 'diagnostics', source={'nvim_lsp'}},
        -- --     'filename'
        -- --   },
        -- --   lualine_x = {
        -- --     -- components.lsp,
        -- --     -- components.treesitter,
        -- --     { 'diagnostics', source={'nvim_lsp'}},
        -- --     'filetype',
        -- --   },
        --   lualine_x = {
        --   },
        --   lualine_y = {
        --   },
        --   lualine_z = {
        --     -- components.scrollbar,
        --     -- components.mode
        --   }
        -- }
        -- , tabline = {}
        , winbar = {
          lualine_z = {
            components.winbar_filename
          }
        }
        , inactive_winbar = {
          lualine_z = {
            components.winbar_filename_inactive
          }
        }
      }
    end
  },
  {
    'folke/twilight.nvim'
    , cmd = {
      'Twilight',
      'TwilightEnable'
    }
    , keys = {
      {
        '<leader>tl', function()
          require 'twilight.view'.toggle()
        end, desc = 'toggle twilight'
      },
    }
    , opts = {}
  },
  {
    'linguini1/pulse.nvim'
    , version = '*'
    , cmd = {
      'PulseEnable',
      'PulseList'
    }
    , config = true
  }
}
