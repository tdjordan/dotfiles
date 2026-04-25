return {
  -- {
  --   'tdjordan/notifier.nvim'
  --   , lazy = false
  --   , enabled = true
  --   , opts = {
  --     ignore_messages = {
  --       'null_ls'
  --     }
  --     -- components = {
  --     --   'lsp'
  --     -- }
  --     -- component_name_recall = true
  --   },
  -- },
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
  },
  {
    "folke/snacks.nvim"
    , priority = 1000
    , lazy = false
    , keys = {
      ---  Top Pickers
      { '<leader>,' , function() Snacks.picker.buffers()                                      end, desc = 'buffers'                 },
      { '<leader>/' , function() Snacks.picker.grep()                                         end, desc = 'grep'                    },
      { '<leader>:' , function() Snacks.picker.command_history()                              end, desc = 'grep'                    },
      { '<leader>.' , function() Snacks.picker.projects()                                     end, desc = 'projects'                },
      { '<leader>e' , function() Snacks.explorer()                                            end, desc = 'file [e]xplorer'         },
      { '<leader>N' , function() Snacks.picker.notifications()                                end, desc = 'notification history'    },
      ---  Pick
      { '<leader>pa' , function() Snacks.picker.autocmds()                                    end, desc = 'autocmds'                },
      { '<leader>pb' , function() Snacks.picker.buffers()                                     end, desc = 'buffers'                 },
      { '<leader>pf' , function() Snacks.picker.smart()                                       end, desc = 'file - smart find'       },
      { '<leader>pn' , function() Snacks.picker.files({ cwd = vim.fn.stdpath('config') })     end, desc = 'nvim config file'        },
      { '<leader>pg' , function() Snacks.picker.grep()                                        end, desc = 'from live grep'          },
      { '<leader>pu' , function() Snacks.picker.undo()                                        end, desc = 'undo history'            },
      ---  Find
      { '<leader>fb' , function() Snacks.picker.buffers()                                     end, desc = 'in open buffers'         },
      { '<leader>fc' , function() Snacks.picker.files({ cwd = vim.fn.stdpath('config') })     end, desc = 'config files - nvim'     },
      { '<leader>ff' , function() Snacks.picker.files()                                       end, desc = 'by file name'            },
      { '<leader>fg' , function() Snacks.picker.git_files()                                   end, desc = 'git files'               },
      { '<leader>fk' , function() Snacks.picker.keymaps()                                     end, desc = 'keymaps'                 },
      { '<leader>fl' , function() Snacks.picker.lines()                                       end, desc = 'current buffer'          },
      { '<leader>fp' , function() Snacks.picker.projects()                                    end, desc = 'projects'                },
      { '<leader>fs' , function() Snacks.picker.lsp_workspace_symbols()                       end, desc = 'lsp symbols'             },
      ---  Git
      -- { "<leader>gb", function() Snacks.picker.git_branches()                                 end, desc = "git branches"            },
      { "<leader>gl", function() Snacks.picker.git_log()                                      end, desc = "git log"                 },
      { "<leader>gL", function() Snacks.picker.git_log_line()                                 end, desc = "git log line"            },
      -- { "<leader>gs", function() Snacks.picker.git_status()                                   end, desc = "git status"              },
      { "<leader>gS", function() Snacks.picker.git_stash()                                    end, desc = "git stash"               },
      { "<leader>gD", function() Snacks.picker.git_diff()                                     end, desc = "git [D]iff (hunks)"      },
      { "<leader>gf", function() Snacks.picker.git_log_file()                                 end, desc = "git log file"            },
      ---  Grep
      { '<leader>sb' , function() Snacks.picker.lines()                                       end, desc = 'buffer lines'            },
      { '<leader>sB' , function() Snacks.picker.grep_buffers()                                end, desc = 'open buffers'            },
      { '<leader>sg' , function() Snacks.picker.grep()                                        end, desc = 'grep'                    },
      { '<leader>sw' , function() Snacks.picker.grep_word()                                   end, desc = 'word under cursor', mode = { 'n', 'x' } },
      ---  Search
      { '<leader>s"' , function() Snacks.picker.registers()                                   end, desc = 'registers'               },
      { '<leader>s/' , function() Snacks.picker.search_history()                              end, desc = 'search history'          },
      { '<leader>sa' , function() Snacks.picker.autocmds()                                    end, desc = 'autocmds'                },
      { '<leader>sc' , function() Snacks.picker.command_history()                             end, desc = 'command history'         },
      { '<leader>sC' , function() Snacks.picker.commands()                                    end, desc = 'commands'                },
      { '<leader>sd' , function() Snacks.picker.diagnostics()                                 end, desc = 'diagnostics'             },
      { '<leader>sD' , function() Snacks.picker.diagnostics_buffer()                          end, desc = 'buffer [D]iagnostics'    },
      { '<leader>sh' , function() Snacks.picker.help()                                        end, desc = 'help'                    },
      { '<leader>sH' , function() Snacks.picker.highlights()                                  end, desc = '[H]ighlights'            },
      { '<leader>si' , function() Snacks.picker.icons()                                       end, desc = 'icons'                   },
      { '<leader>sj' , function() Snacks.picker.jumps()                                       end, desc = 'jumps'                   },
      { '<leader>sk' , function() Snacks.picker.keymaps()                                     end, desc = 'keymasp'                 },
      { '<leader>sl' , function() Snacks.picker.loclist()                                     end, desc = 'location list'           },
      { '<leader>sm' , function() Snacks.picker.marks()                                       end, desc = 'marks'                   },
      { '<leader>sM' , function() Snacks.picker.man()                                         end, desc = '[M]an pages'             },
      { '<leader>sp' , function() Snacks.picker.lazy()                                        end, desc = 'for plugin spec'         },
      { '<leader>sq' , function() Snacks.picker.qflist()                                      end, desc = 'quickfix list'           },
      { '<leader>sr' , function() Snacks.picker.resume()                                      end, desc = 'resume snack search'     },
      { '<leader>su' , function() Snacks.picker.undo()                                        end, desc = 'undo history'            },
      { '<leader>uC' , function() Snacks.picker.colorschemes()                                end, desc = 'colorschemes'            },
      ---  LSP
      { 'gd'         , function() Snacks.picker.lsp_definitions()                             end, desc = 'goto definitions'        },
      { 'gD'         , function() Snacks.picker.lsp_declarations()                            end, desc = 'goto declarations'       },
      { 'glr'        , function() Snacks.picker.lsp_references()                              end, desc = 'references', nowait = true },
      { 'gI'         , function() Snacks.picker.lsp_implementations()                         end, desc = 'goto Implementation'     },
      { 'gy'         , function() Snacks.picker.lsp_type_definitions()                        end, desc = 'goto T[y]pe Definition'  },
      { 'gai'        , function() Snacks.picker.lsp_incoming_calls()                          end, desc = 'c[a]lls Incoming'        },
      { 'gao'        , function() Snacks.picker.lsp_outgoing_calls()                          end, desc = 'c[a]lls Outgoing'        },
      { '<leader>ss' , function() Snacks.picker.lsp_symbols()                                 end, desc = 'lsp symbols'             },
      { '<leader>sS' , function() Snacks.picker.lsp_workspace_symbols()                       end, desc = 'lsp workspace [S]ymbols' },
    }
    , opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = false },
      dashboard = { enabled = false },
      explorer = { enabled = false },
      image = { enabled = false },
      indent = { enabled = false },
      input = { enabled = false },
      notifier = { enabled = true, top_down = false },
      picker = { enabled = true },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = false },
      styles = {
        notification = {
          -- wo = { wrap = true } -- Wrap notifications
        }
      }
    }
  },
  {
    "hat0uma/csvview.nvim"
    , cmd = { 'CsvViewEnable', 'CsvViewDisable', 'CsvViewToggle' }
    , ft = { 'csv' }
    ---@module "csvview"
    ---@type CsvView.Options
    , opts = {
      parser = { comments = { "#", "//" } },
      view = {
        display_mode = 'border'
      },
      keymaps = {
        -- Text objects for selecting fields
        textobject_field_inner = { "if", mode = { "o", "x" } },
        textobject_field_outer = { "af", mode = { "o", "x" } },
        -- Excel-like navigation:
        -- Use <Tab> and <S-Tab> to move horizontally between fields.
        -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
        -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
        jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
        jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
        jump_next_row = { "<Enter>", mode = { "n", "v" } },
        jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
      }
    }
  },
  {
    'Wansmer/symbol-usage.nvim'
    -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
    , event = 'LspAttach'
    -- , opts = {
    --   virtual_text = {
    --     position = 'eol'
    --   }
    -- }
    -- , config = function()
    --   require('symbol-usage').setup()
    -- end
    , config = true
    -- , config = function()
    --   require('symbol-usage').setup {
    --     text_format = function(symbol)
    --       local fragments = {}
    --       if symbol.references ~= nil then
    --         local usage = symbol.references
    --         local ref_icon = " 🔍 "
    --         if usage > 0 then
    --           table.insert(fragments, usage .. ref_icon)
    --           -- table.insert(fragments, ref_icon .. usage)
    --         end
    --       end
    --       if symbol.definition ~= nil then
    --         table.insert(fragments, " 🐍 ")
    --       end
    --       if symbol.implementation ~= nil then
    --         table.insert(fragments, " 📦 ")
    --       end
    --       return table.concat(fragments, ", ")
    --     end
    --   }
    -- end
  }
}
