-- stylua: ignore start
-- LuaFormatter off

vim.g.mapleader = ' '

local wk = require 'which-key'

wk.setup {
  -- ---@type false | "classic" | "modern" | "helix"
  -- preset = "classic",
  -- -- Delay before showing the popup. Can be a number or a function that returns a number.
  -- ---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
  -- delay = function(ctx)
  --   return ctx.plugin and 0 or 200
  -- end,
  -- ---@param mapping wk.Mapping
  -- filter = function(mapping)
  --   -- example to exclude mappings without a description
  --   -- return mapping.desc and mapping.desc ~= ""
  --   return true
  -- end,
  -- --- You can add any mappings here, or use `require('which-key').add()` later
  -- ---@type wk.Spec
  -- spec = {},
  -- -- show a warning when issues were detected with your mappings
  -- notify = true,
  -- -- Which-key automatically sets up triggers for your mappings.
  -- -- But you can disable this and setup the triggers manually.
  -- -- Check the docs for more info.
  -- ---@type wk.Spec
  -- triggers = {
  --   { "<auto>", mode = "nxso" },
  -- },
  -- -- Start hidden and wait for a key to be pressed before showing the popup
  -- -- Only used by enabled xo mapping modes.
  -- ---@param ctx { mode: string, operator: string }
  -- defer = function(ctx)
  --   return ctx.mode == "V" or ctx.mode == "<C-V>"
  -- end,
  -- plugins = {
  --   marks = true,          -- shows a list of your marks on ' and `
  --   registers = true,      -- shows your registers on " in NORMAL or <C-r> in INSERT mode
  --   spelling = {
  --     enabled = true,      -- enabling this will show WhichKey when pressing z= to select spelling suggestions
  --     suggestions = 20,    -- how many suggestions should be shown in the list?
  --   },
  --
  --   -- the presets plugin, adds help for a bunch of default keybindings in Neovim
  --   -- No actual key bindings are created
  --   presets = {
  --     operators = true,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
  --     motions = true,      -- adds help for motions
  --     text_objects = true, -- help for text objects triggered after entering an operator
  --     windows = true,      -- default bindings on <c-w>
  --     nav = true,          -- misc bindings to work with windows
  --     z = true,            -- bindings for folds, spelling and others prefixed with z
  --     g = true,            -- bindings for prefixed with g
  --   },
  -- },

  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = 'Comments' },
  -- key_labels = {
  --   -- override the label used to display some keys. It doesn't effect WK in any other way.
  --   --   For example:
  --   ['<space>'] = 'SPC',
  --   ['<CR>']    = 'RET',
  --   ['<Tab>']   = 'TAB',
  -- },
  -- ---@type wk.Win.opts
  -- win = {
  --   -- don't allow the popup to overlap with the cursor
  --   no_overlap = true,
  --   -- width = 1,
  --   -- height = { min = 4, max = 25 },
  --   -- col = 0,
  --   -- row = math.huge,
  --   -- border = "none",
  --   padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
  --   title = true,
  --   title_pos = "center",
  --   zindex = 1000,
  --   -- Additional vim.wo and vim.bo options
  --   bo = {},
  --   wo = {
  --     -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
  --   },
  -- },
  -- layout = {
  --   width = { min = 20 }, -- min and max width of the columns
  --   spacing = 3, -- spacing between columns
  -- },
  -- keys = {
  --   scroll_down = "<c-d>", -- binding to scroll down inside the popup
  --   scroll_up = "<c-u>", -- binding to scroll up inside the popup
  -- },
  -- ---@type (string|wk.Sorter)[]
  -- --- Mappings are sorted using configured sorters and natural sort of the keys
  -- --- Available sorters:
  -- --- * local: buffer-local mappings first
  -- --- * order: order of the items (Used by plugins like marks / registers)
  -- --- * group: groups last
  -- --- * alphanum: alpha-numerical first
  -- --- * mod: special modifier keys last
  -- --- * manual: the order the mappings were added
  -- --- * case: lower-case first
  -- sort = { "local", "order", "group", "alphanum", "mod" },
  -- ---@type number|fun(node: wk.Node):boolean?
  -- expand = 0, -- expand groups when <= n mappings
  -- -- expand = function(node)
  -- --   return not node.desc -- expand all nodes without a description
  -- -- end,
  -- -- Functions/Lua Patterns for formatting the labels
  -- ---@type table<string, ({[1]:string, [2]:string}|fun(str:string):string)[]>
  -- replace = {
  --   key = {
  --     function(key)
  --       return require("which-key.view").format(key)
  --     end,
  --     -- { "<Space>", "SPC" },
  --   },
  --   desc = {
  --     { "<Plug>%(?(.*)%)?", "%1" },
  --     { "^%+", "" },
  --     { "<[cC]md>", "" },
  --     { "<[cC][rR]>", "" },
  --     { "<[sS]ilent>", "" },
  --     { "^lua%s+", "" },
  --     { "^call%s+", "" },
  --     { "^:%s*", "" },
  --   },
  -- },
  icons = {
  --   breadcrumb = '»',               -- symbol used in the command line area that shows your active key combo
  --   separator = '➜',                -- symbol used between a key and it's label
    group = ' ',                    -- symbol prepended to a group
  --   ellipsis = "…",
  --   -- set to false to disable all mapping icons,
  --   -- both those explicitly added in a mapping
  --   -- and those from rules
  --   mappings = true,
  --   --- See `lua/which-key/icons.lua` for more details
  --   --- Set to `false` to disable keymap icons from rules
  --   ---@type wk.IconRule[]|false
  --   rules = {},
  --   -- use the highlights from mini.icons
  --   -- When `false`, it will use `WhichKeyIcon` instead
  --   colors = true,
  --   -- used by key format
  --   keys = {
  --     Up = " ",
  --     Down = " ",
  --     Left = " ",
  --     Right = " ",
  --     C = "󰘴 ",
  --     M = "󰘵 ",
  --     D = "󰘳 ",
  --     S = "󰘶 ",
  --     CR = "󰌑 ",
  --     Esc = "󱊷 ",
  --     ScrollWheelDown = "󱕐 ",
  --     ScrollWheelUp = "󱕑 ",
  --     NL = "󰌑 ",
  --     BS = "󰁮",
  --     Space = "󱁐 ",
  --     Tab = "󰌒 ",
  --     F1 = "󱊫",
  --     F2 = "󱊬",
  --     F3 = "󱊭",
  --     F4 = "󱊮",
  --     F5 = "󱊯",
  --     F6 = "󱊰",
  --     F7 = "󱊱",
  --     F8 = "󱊲",
  --     F9 = "󱊳",
  --     F10 = "󱊴",
  --     F11 = "󱊵",
  --     F12 = "󱊶",
  --   },
  },
  -- show_help = true,                 -- show help message on the command line when the popup is visible
  -- show_keys = true,                 -- show the currently pressed key and its label as a message in the command line
  -- -- disable the WhichKey popup for certain buf types and file types.
  -- disable = {
  --   ft = {},
  --   bt = {},
  -- },
  -- debug = false, -- enable wk.log in the current directory
}

-- local normal_mode = {
--   mode = 'n'
--   , prefix = '<leader>'
--   , buffer = nil
--   , silent = true
--   , noremap = true
--   , nowait = false
-- }

wk.add({
  ---
  ---  window resize operations
  ---
  {
    { '<leader>-'     , '<cmd>resize -5<cr>',          desc = 'decrease up-down'      },
    { '<leader>='     , '<cmd>resize +5<cr>',          desc = 'increase up-down'      },
    { '<leader>\\'    , '<cmd>vertical resize -5<cr>', desc = 'increase side-to-side' },
    { '<leader><tab>' , '<cmd>vertical resize +5<cr>', desc = 'increase side-to-side' },
    { '<leader>0'     , '<c-w>=',                      desc = 'normalize / equalize'  },
  },

  ---
  ---  surround with *
  ---
  {
    ---  s
    { '<leader>s' , group = 'surround / search' },
      { '<leader>s"' , [[msciw""<esc>P`sl]],           desc = 'word with double quotes'     },
      { "<leader>s'" , [[msciw'<c-r><c-o>"'<esc>`sl]], desc = 'word with single quotes'     },
      { '<leader>s[' , 'ciw[]<esc>P',                  desc = 'word with square brackets'   },
      { '<leader>s9' , 'ciw()<esc>P',                  desc = 'word with round  brackets'   },
      { '<leader>s]' , 'ciw{}<esc>P',                  desc = 'word with squiggly brackets' },

      ---  sc
      { '<leader>sc' , group = 'change' },
        { '<leader>sc"' , [[ciwxx""P]],    desc = 'to single quotes'                     },
        { "<leader>sc'" , [[ciw''<esc>P]], desc = 'surround word with single   quotes'   },
        { '<leader>sc[' , 'ciw[]<esc>P',   desc = 'surround word with square   brackets' },
        { '<leader>sc]' , 'ciw{}<esc>P',   desc = 'surround word with squiggly brackets' },
        { '<leader>sc9' , 'ciw()<esc>P',   desc = 'surround word with round    brackets' },

    { '<leader>sd' , [[daw''=substitute(@@,"'\\\|\"","","g")<cr>P]], desc = 'delete quotes' },
    -- , { '<leader>sd' , [[daW''=substitute(@@,"'\\\|\"","","g")<cr>P]], 'delete quotes' }

    { '<leader>sh' , function() require 'telescope.builtin'.pickers()   end , desc = 'picker history'    },

    { '<leader>sp' , [[<cmd>split<cr>]]                                     , desc = 'split top-bottom'  },
    { '<leader>sr' , function() require 'telescope.builtin'.resume()    end , desc = 'resume search'     },
    { '<leader>st' , [[<cmd>lua require('theme').ThemeToggle()<cr>]]        , desc = 'toggle dark/light' },
    { '<leader>st' , function() require "telescope.builtin".live_grep() end , desc = 'search text'       },
  },

  {
    ---
    ---  do we really want to do this?
    ---
    { '<leader><c-p>' ,  function() require 'telescope.builtin'.git_files() end , desc = 'search git files' },

    ---
    ---  Reload init.lua from standard config path
    ---  note that the stdpath makes this portable
    ---
    { '<leader><cr>'  , '<cmd>luafile ~/.config/nvim/init.lua<cr>', desc = 'reload config' },
  },

  ---
  ---  b* mappings
  ---
  {
    { '<leader>b', group = 'buffer / browse' },
  },
  -- b = {
  --   name = 'buffer / browse'
  --   , ['.'] = { function()
  --     require 'telescope'.extensions.file_browser.file_browser()
  --   end, 'file browser'}
  --   -- , ['.'] = { '<cmd>lua require "telescope.builtin".file_browser()<cr>', 'files' }
  --   -- , c = { '<cmd>BufferClose<cr>', 'close buffer' }
  -- },

  ---
  ---  k* mappings
  ---
  -- k = {
  --   name = 'nerd'
  --   , t = { '<cmd>lua require "telescope.builtin".file_browser()<cr>',             'tree' }
  -- },

  ---
  ---  f* mappings
  ---
  {
    { '<leader>f', group = 'search' },
      { '<leader>fb'  , function() require 'telescope.builtin'.buffers()                      end , desc = 'in open buffers'   },
      { '<leader>ff'  , function() require 'telescope.builtin'.find_files()                   end , desc = 'by file name'      },
      { '<leader>fg'  , function() require 'telescope.builtin'.live_grep()                    end , desc = 'with live grep'    },
      { '<leader>fh'  , function() require 'telescope.builtin'.help_tags()                    end , desc = 'help tags'         },
      { '<leader>fj'  , function() require 'telescope.builtin'.jumplist()                     end , desc = 'jumplist'          },
      { '<leader>fi'  , function() require 'telescope.builtin'.builtin()                      end , desc = 'builtins'          },
      { '<leader>fk'  , function() require 'telescope.builtin'.keymaps()                      end , desc = 'keymaps'           },
      { '<leader>fl'  , function() require 'telescope.builtin'.current_buffer_fuzzy_find()    end , desc = 'current buffer'    },
      { '<leader>fm'  , function() require 'telescope.builtin'.man_pages()                    end , desc = 'man pages'         },
      { '<leader>fo'  , function() require 'telescope.builtin'.oldfiles()                     end , desc = 'recent files'      },
      { '<leader>fq'  , function() require 'telescope.builtin'.quickfix()                     end , desc = 'quickfix'          },
      { '<leader>fr'  , function() require 'telescope.builtin'.reloader()                     end , desc = 'reloader'          },
      { '<leader>fs'  , function() require 'telescope.builtin'.lsp_workspace_symbols()        end , desc = 'lsp symbols'       },
      { '<leader>ft'  , function() require 'telescope.builtin'.filetypes()                    end , desc = 'filetypes'         },
      { '<leader>fw'  , function() require 'telescope.builtin'.grep_string()                  end , desc = 'word under cursor' },
      { '<leader>f;'  , function() require 'telescope.builtin'.command_history()              end , desc = 'command history'   },
      { '<leader>f//' , function() require 'telescope.builtin'.search_history()               end , desc = 'search history'    },
      { '<leader>f.'  , function() require 'telescope'.extensions.file_browser.file_browser() end , desc = 'file browser'      },
      { '<leader>f:'  , function() require 'telescope.builtin'.commands()                     end , desc = 'commands'          },
  },

  ---
  ---  \\* mappings
  ---
  {
    { '\\' , group = 'fast action' },
      { '\\a'        , function() vim.lsp.buf.code_action()                                   end , desc = 'code action'           },
      { '\\d'        , function() vim.diagnostic.jump { count =  1, float = true }            end , desc = 'Next diagnostic'       },
      -- { '\\f'        , function() vim.lsp.format()                                            end , desc = 'format'                },
      { '\\f'        , function() require 'conform'.format({ async = true })                  end , desc = 'format buffer'         },
      { '\\r'        , function() vim.lsp.buf.rename()                                        end , desc = 'rename'                },
      { '\\s'        , function() vim.lsp.buf.signature_help()                                end , desc = 'signature help'        },
  },

  ---
  ---  l* mappings
  ---
  {
    { '<leader>l' , group = 'lsp' },
      { '<leader>la' , function() vim.lsp.buf.code_action()                                   end , desc = 'code action'           },
      -- { '<leader>lA' , function() vim.lsp.buf.code_action { range = {                         end , desc = 'code action range'     },

      ---  lc
      { '<leader>lc' , group = 'calls' },
        { '<leader>lci' , function() require "telescope.builtin".lsp_incoming_calls()         end , desc = 'incoming calls'        },
        { '<leader>lco' , function() require "telescope.builtin".lsp_outgoing_calls()         end , desc = 'outgoing calls'        },

      { '<leader>ld' , function() require 'telescope.builtin'.diagnostics({bufnr = 0})        end , desc = 'document diagnostics'  },
      { '<leader>lf' , function() vim.lsp.buf.format()                                        end , desc = 'format'                },
      { '<leader>lh' , function() vim.lsp.buf.hover()                                         end , desc = 'hover'                 },
      { '<leader>lH' , function() vim.lsp.buf.signature_help()                                end , desc = 'signature help'        },
      { '<leader>li' , '<cmd>LspInfo<cr>'                                                         , desc = 'info'                  },
      { '<leader>lI' , function() require 'mason.ui'.open()                                   end , desc = 'installer info'        },

      { '<leader>lj' , function() vim.diagnostic.jump { count =  1, float = true }            end , desc = 'Next diagnostic'       },
      { '<leader>lk' , function() vim.diagnostic.jump { count = -1, float = true }            end , desc = 'Previous diagnostic'   },
      { '<leader>ll' , function() vim.lsp.codelens.run()                                      end , desc = 'codelens action'       },

      { '<leader>lp' , group = 'peek' },
        { '<leader>lpi' , function() require 'lvim.lsp.peek'.Peek('implementation')           end , desc = 'implementation'        },
        { '<leader>lpr' , function() vim.lsp.buf.references()                                 end , desc = 'references'            },
        { '<leader>lpt' , function() require 'lvim.lsp.peek'.Peek('typeDefinition')           end , desc = 'type definition'       },

      { '<leader>lq' , function() vim.diagnostic.setloclist()                                 end , desc = 'quickfix'              },
      { '<leader>lr' , function() vim.lsp.buf.rename()                                        end , desc = 'rename'                },
      { '<leader>ls' , function() require 'telescope.builtin'.lsp_document_symbols()          end , desc = 'document symbols'      },
      { '<leader>lS' , function() require 'telescope.builtin'.lsp_dynamic_workspace_symbols() end , desc = 'workspace symbols'     },
      { '<leader>lw' , function() require 'telescope.builtin'.diagnostics()                   end , desc = 'workspace diagnostics' },
  },

  ---
  ---  o* mapptings
  ---
  {
    { '<leader>o', group = 'org mode' },
      -- { '<leader>om', group = 'mode' },
      -- { '<leader>on', group = 'keybind' },
      { '<leader>ow', group = 'workspace' },
  },


  ---
  ---  O* mappings
  ---
  {
    '<leader>O',
    function()
      require 'neorg'
    end, desc = 'Start org mode'
  },

  ---
  ---  p* mappings
  ---
  {
    { '<leader>p', group = 'pick' },
      { '<leader>pa' , function() require 'telescope.builtin'.autocommands()                              end, desc = 'an autocommand'      },
      { '<leader>pb' , function() require 'telescope.builtin'.buffers()                                   end, desc = 'from open buffers'   },
      { '<leader>pe' , function() require 'telescope.builtin'.symbols{sources = {'emoji', 'gitmoji'}}     end, desc = '*moji'               },
      { '<leader>pf' , function() require 'telescope.builtin'.find_files()                                end, desc = 'a file'              },
      { '<leader>pg' , function() require 'telescope.builtin'.live_grep()                                 end, desc = 'from live grep'      },
      { '<leader>ph' , function() require 'telescope.builtin'.help_tags()                                 end, desc = 'help tags'           },
      { '<leader>pl' , function() require 'telescope.builtin'.current_buffer_fuzzy_find()                 end, desc = 'from current buffer' },
      -- { '<leader>ps' , function() require 'telescope.builtin'.grep_string()                               end, desc = 'word under cursor'   },
      -- { '<leader>ps' , function() require 'telescope.builtin'.grep_string()                               end, desc = 'with grep string'    },
      { '<leader>ps' , function() require 'telescope.builtin'.spell_suggest()                             end, desc = 'spelling suggestion' },
      { '<leader>pS' , function() require 'telescope.builtin'.treesitter()                                end, desc = 'treesitter symbols'  },
      { '<leader>pw' , function() require 'telescope'.extensions.project.project{ display_type = 'full' } end, desc = 'workspace' },

      { '<leader>pp', group = 'plugins' },
        { '<leader>pps' , function() require 'lazy.view.commands'.commands.sync()                         end, desc = 'sync'    },
        -- { '<leader>ppc' , function() require 'plugins'.init_lazy() require 'packer'.compile()             end, desc = 'compile' },
        { '<leader>ppc' , function() require 'lazy.view.commands'.commands.check()                        end, desc = 'check'   },
        { '<leader>ppd' , function() require 'lazy.view.commands'.commands.debug()                        end, desc = 'debug'   },
        { '<leader>pph' , function() require 'lazy.view.commands'.commands.health()                       end, desc = 'health'  },
        -- { '<leader>ppl' , function() require 'telescope'.extensions.packer.plugins()                      end, desc = 'list'    },
        { '<leader>ppl' , function() require 'lazy.view.commands'.commands.log()                          end, desc = 'log'     },
        { '<leader>ppt' , function() require 'lazy.view.commands'.commands.show()                         end, desc = 'status'  },
        { '<leader>ppp' , function() require 'lazy.view.commands'.commands.profile()                      end, desc = 'profile' },
        { '<leader>ppu' , function() require 'lazy.view.commands'.commands.update()                       end, desc = 'update'  },
        { '<leader>ppw' , function() require 'lazy.view.commands'.commands.clean()                        end, desc = 'clean'   },

      { '<leader>pv', group = 'vim' },
        { '<leader>pvh' , function() require 'telescope.builtin'.highlights()  end, desc = 'vim highlights' },
        { '<leader>pvo' , function() require 'telescope.builtin'.vim_options() end, desc = 'vim options'    },
        { '<leader>pvr' , function() require 'telescope.builtin'.registers()   end, desc = 'vim registers'  },
  },

  ---
  ---  c* mappings
  ---
  {
    { '<leader>c', group = 'comments' },
      { '<leader>c<c_>' , function() require 'Comment.api'.toggle_current_linewise_op() end, desc = 'comment line'   },
      { '<leader>cl'    , function() require 'Comment.api'.toggle_current_linewise_op() end, desc = 'comment line'   },
      -- { '<leader>cm'    , function() require 'Comment.api'.toggle_linewise_count_op()   end, desc = 'comment motion' },
  },

  ---
  ---  e* mappings
  ---
  -- e = { function() require 'nvim-tree.api'.tree.toggle() end , 'explorer' },

  ---
  ---  d* mappings
  ---
  {
    { '<leader>d', group = 'debug' },
      { '<leader>db' , function() require 'dap'.step_back()         end, desc = 'Step Back'         },
      { '<leader>dc' , function() require 'dap'.continue()          end, desc = 'Continue'          },
      { '<leader>dC' , function() require 'dap'.run_to_cursor()     end, desc = 'Run to Cursor'     },
      { '<leader>dd' , function() require 'dap'.disconnect()        end, desc = 'Disconnect'        },
      { '<leader>dg' , function() require 'dap'.session()           end, desc = 'Get Session'       },
      { '<leader>di' , function() require 'dap'.step_into()         end, desc = 'Step Into'         },
      { '<leader>do' , function() require 'dap'.step_over()         end, desc = 'Step Over'         },
      { '<leader>dp' , function() require 'dap'.pause.toggle()      end, desc = 'Pause'             },
      { '<leader>dq' , function() require 'dap'.close()             end, desc = 'Quit'              },
      { '<leader>dr' , function() require 'dap'.repl.toggle()       end, desc = 'Toggle Repl'       },
      { '<leader>ds' , function() require 'dap'.continue()          end, desc = 'Start'             },
      { '<leader>dt' , function() require 'dap'.toggle_breakpoint() end, desc = 'Toggle Breakpoint' },
      { '<leader>du' , function() require 'dap'.step_out()          end, desc = 'Step Out'          },
  },

  ---
  ---  g* mappings
  ---
  {
    { '<leader>g', group = 'git' },
      { '<leader>gb' , function() require 'telescope.builtin'.git_branches() end, desc = 'git branches'       },
      { '<leader>gc' , function() require 'telescope.builtin'.git_commits()  end, desc = 'git commits'        },

      { '<leader>gd', name = 'git diff' }, -- diffview

      { '<leader>gh' , function() require 'telescope.builtin'.git_stash()    end, desc = 'git stash'          },
      { '<leader>gl' , function() require 'telescope.builtin'.git_bcommits() end, desc = 'git buffer commits' },
      { '<leader>gs' , function() require 'telescope.builtin'.git_status()   end, desc = 'git status'         },
  },

  ---
  ---  h* mappings
  ---
  {
    { '<leader>h', group = 'gitsigns' },
  },

  ---
  ---  i* mappings
  ---
  ---  Indentation
  ---
  -- i = { function() require 'functions.toggle'.indent_blankline() end , 'toggle indentation guides' },

  ---
  ---  t* mappings
  ---
  {
    { '<leader>t', group = 'toggle' },
      { '<leader>td', group = 'toggle diagnostics' },
      -- { '<leader>th' , '<cmd>TSHighlightCapturesUnderCursor<cr>',             desc = 'highlight captures'     },
      { '<leader>th' , function() vim.show_pos() end,                         desc = 'highlight captures'     },
      { '<leader>tH' , function() vim.print( vim.inspect_pos() ) end,         desc = 'all items at cursor'    },
      { '<leader>ti' , function()
        -- vim.cmd 'IBLToggle'
        local ibl = require 'ibl'
        -- local conf = require 'ibl.config'

        if ibl.initialized then
          vim.print('updated')
          -- ibl.update {
          --   enabled = not conf.get_config( -1 ).enabled
          -- }
        else
          vim.print('hello')
          -- require 'configs.indentation.blankline'
        end
      end ,   desc = 'indentation guides'     },
      { '<leader>tk' , function() require 'nvim-tree.api'.tree.toggle() end , desc = 'file tree sidebar'      },
      { '<leader>tt' , '<cmd>split term://$SHELL<cr>',                        desc = 'terminal'               },
      { '<leader>ts' , function() vim.treesitter.inspect_tree() end,          desc = 'tree-sitter playgournd' },
  },

  ---
  ---  r* mappings
  ---
  {
    { '<leader>r', group = 'rest' },
      { '<leader>rl' , function() require 'rest-nvim'.last()    end, desc = 'run last request'         },
      { '<leader>rp' , function() require 'rest-nvim'.run(true) end, desc = 'preview the curl command' },
      { '<leader>rr' , function() require 'rest-nvim'.run()     end, desc = 'run request under cursor' },
  },

  ---  v* mapptings
  ---
  {
    { '<leader>v', group = 'vertical' },
      { '<leader>vp' , [[<cmd>vsplit<cr>]], desc = 'split side-to-side' },
  },

  ---  v* mapptings
  ---
  {
    { '<leader>x', group = 'trouble' },
  }
})

-- wk.register(normal_mappings, normal_mode)

---  Fix weird default mappings
---
-- wk.register({
--   Y = { 'y$', 'yank to end of line instead of whole line' }
-- })

-- wk.register({
--   ["<leader>f"] = { name = "+file" }
--   , ["<leader>fx"] = { '<nop>', 'no operation'}
-- })

-- wk.register({
--   f = {
--     x = { '<nop>', 'no operation'}
--   }
-- }, { prefix = "<leader>"})

---  Window Navigation
---
---  navigate cursor to adjoining window
---
-- normal mode
-- wk.register({
--   ['<c-h>'] = { '<cmd>wincmd h<cr>', "focus left"  },
--   ['<c-j>'] = { '<cmd>wincmd j<cr>', "focus down"  },
--   ['<c-k>'] = { '<cmd>wincmd k<cr>', "focus up"    },
--   ['<c-l>'] = { '<cmd>wincmd l<cr>', "focus right" }
-- })
-- termainl mode
-- wk.register({
--   ['<esc>'] = { [[<c-\><c-n>]],       'escape'      },
--   ['<c-h>'] = { [[<c-\><c-n><c-w>h]], 'focus left'  },
--   ['<c-j>'] = { [[<c-\><c-n><c-w>j]], 'focus down'  },
--   ['<c-k>'] = { [[<c-\><c-n><c-w>k]], 'focus up'    },
--   ['<c-l>'] = { [[<c-\><c-n><c-w>l]], 'focus right' },
-- }, {
--   mode = 't'
-- })
local ku = require 'keymap.utility'
local tnoremap = ku.tnoremap
tnoremap( '<esc>', [[<C-\><C-n>]] )
tnoremap( '<C-h>', [[<C-\><C-n><C-w>h]] )
tnoremap( '<C-j>', [[<C-\><C-n><C-w>j]] )
tnoremap( '<C-k>', [[<C-\><C-n><C-w>k]] )
tnoremap( '<C-l>', [[<C-\><C-n><C-w>l]] )

local autocmd = vim.api.nvim_create_autocmd

autocmd( { 'BufWinEnter', 'WinEnter', 'TermEnter' }, {
  pattern = 'term://*'
  , callback = function()
    vim.opt.relativenumber = false
    vim.opt.number = false
    vim.opt.signcolumn = 'no'
  end
})

autocmd( { 'BufWinEnter', 'WinEnter', 'TermEnter' }, {
  pattern = 'term://*'
  , command = [[startinsert]]
})

autocmd( 'BufLeave', {
  pattern = 'term://*'
  , command = [[stopinsert]]
})

autocmd( 'TermClose', {
  pattern = 'term://*'
  , command = [[call nvim_input('<cr>')]]
})

---  Escape
---
wk.add({
  -- ['jk'] = { '<esc>', 'escape' },
  -- ['hl'] = { '<esc>', 'escape' },
  -- ['iu'] = { '<esc>', 'escape' },

  ---  luasnip jumping
  ---
  mode = 'i',

  { '<c-_>', function() require 'functions.luasnip'.next()      end , desc = 'snippet jump forward' },
  { '<c-y>', function() require 'functions.luasnip'.jump_back() end , desc = 'snippet jump back'    },
})

local cmd = vim.cmd
cmd [[inoremap jk <esc>]]

-- wk.register({
--   ['C-_'] = { '<plug>NERDCommenterToggle', 'comment visual block' },
-- }, {
--   mode = 'v'
  -- , prefix = ''
  -- , buffer = nil
  -- , silent = true
  -- , noremap = true
  -- , nowait = false
  -- , nowait = true
-- })

---  Treesitter Unit
---
-- vim.keymap.set('x', 'iu', '<cmd>lua require "treesitter-unit".select()<cr>',     { noremap = true })
-- vim.keymap.set('x', 'au', '<cmd>lua require "treesitter-unit".select(true)<cr>', { noremap = true })
-- vim.keymap.set('o', 'iu', '<cmd>lua require "treesitter-unit".select()<cr>',     { noremap = true })
-- vim.keymap.set('o', 'au', '<cmd>lua require "treesitter-unit".select(true)<cr>', { noremap = true })
wk.add(
  {
    mode = 'x',

    { 'i',  group = 'inner' },
    { 'iu', function() require 'treesitter-unit'.select()     end , desc = 'unit select' },

    { 'a',  group = 'outer' },
    { 'au', function() require 'treesitter-unit'.select(true) end , desc = 'unit select' },

  }, {

    mode = 'o',

    { 'i',  group = 'inner' },
    { 'iu', function() require 'treesitter-unit'.select()     end , desc = 'inner unit' },

    { 'a',  group = 'outer' },
    { 'au', function() require 'treesitter-unit'.select(true) end , desc = 'a unit (with white space)' },
  }
)

---  effect initial timeout
-- vim.opt.timeoutlen = 300

-- LuaFormatter on
-- stylua: ignore end
