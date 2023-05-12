-- stylua: ignore start
-- LuaFormatter off

-- New <leader> of the band
-- vim.cmd [[
--   nnoremap <silent> <space> <nop>
--   vnoremap <silent> <space> <nop>
-- ]]

vim.g.mapleader = ' '

local wk = require 'which-key'

-- wk.setup {
--   plugins = {
--     marks = true
--     , registers = true
--   }
--   -- , layout = {
--   --   spacing = 5
--   -- }
-- }
wk.setup {
  -- plugins = {
  --   marks = true,          -- shows a list of your marks on ' and `
  --   registers = true,      -- shows your registers on " in NORMAL or <C-r> in INSERT mode
  --   spelling = {
  --     enabled = false,     -- enabling this will show WhichKey when pressing z= to select spelling suggestions
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
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    --   For example:
    ['<space>'] = 'SPC',
    ['<CR>']    = 'RET',
    ['<Tab>']   = 'TAB',
  },
  icons = {
    -- breadcrumb = '»',               -- symbol used in the command line area that shows your active key combo
    -- separator = '➜',                -- symbol used between a key and it's label
    group = ' ',                    -- symbol prepended to a group
  },
  -- popup_mappings = {
  --   scroll_down = '<c-d>',          -- binding to scroll down inside the popup
  --   scroll_up = '<c-u>',            -- binding to scroll up inside the popup
  -- },
  -- window = {
  --   border = 'none',                -- none, single, double, shadow
  --   position = 'bottom',            -- bottom, top
  --   margin = { 1, 0, 1, 0 },        -- extra window margin [top, right, bottom, left]
  --   padding = { 2, 2, 2, 2 },       -- extra window padding [top, right, bottom, left]
  --   winblend = 0,                   -- value between 0-100 0 for fully opaque and 100 for fully transparent
  --   zindex = 1000,                  -- positive value to position WHichKey above other floating windows
  -- },
  -- layout = {
  --   height = { min = 4, max = 25 }, -- min and max height of the columns
  --   width = { min = 20, max = 50 }, -- min and max width of the columns
  --   spacing = 3,                    -- spacing between columns
  --   align = 'left',                 -- align columns left, center or right
  -- },
  -- ignore_missing = false,           -- enable this to hide mappings for which you didn't specify a label
  -- hidden = {                        -- hide mapping boilerplate
  --   '<silent>',
  --   '<cmd>',
  --   '<Cmd>',
  --   '<CR>',
  --   'call',
  --   'lua',
  --   '^:',
  --   '^ '
  -- },
  -- show_help = true,                 -- show help message on the command line when the popup is visible
  -- show_keys = true,                 -- show the currently pressed key and its label as a message in the command line
  -- triggers = 'auto',                -- automatically setup triggers
  --                                   -- triggers = {'<leader>'} -- or specify a list manually
  -- triggers_blacklist = {
  --   -- list of mode / prefixes that should never be hooked by WhichKey
  --   -- this is mostly relevant for key maps that start with a native binding
  --   -- most people should not need to change this
  --   i = { 'j', 'k' },
  --   v = { 'j', 'k' },
  -- },
  -- -- disable the WhichKey popup for certain buf types and file types.
  -- -- Disabled by default for Telescope
  -- disable = {
  --   buftypes = {},
  --   filetypes = { "TelescopePrompt" },
  -- },
}

local normal_mode = {
  mode = 'n'
  , prefix = '<leader>'
  , buffer = nil
  , silent = true
  , noremap = true
  , nowait = false
}

local normal_mappings = {
  ---
  ---  window resize operations
  ---
  ['-']     = { '<cmd>resize -5<cr>',          'decrease up-down'      },
  ['=']     = { '<cmd>resize +5<cr>',          'increase up-down'      },
  ['\\']    = { '<cmd>vertical resize -5<cr>', 'increase side-to-side' },
  ['<tab>'] = { '<cmd>vertical resize +5<cr>', 'increase side-to-side' },

  ---
  --- surround with *
  ---
  s = {
    name = 'surround / search'
    , ['"'] = { [[msciw""<esc>P`sl]],           'word with double quotes'     }
    , ["'"] = { [[msciw'<c-r><c-o>"'<esc>`sl]], 'word with single quotes'     }
    -- , ["'"] = { [[msea'<esc>bi'<esc>`sl]], 'word with single quotes'     }
    -- , ["'"] = { [[ciw'<c-r><c-o>"'<esc>]], 'word with single quotes'     }
    -- , ["'"] = { [[ciw''<esc>P]], 'word with single quotes'     }
    , ['['] = { 'ciw[]<esc>P',   'word with square brackets'   }
    , ['9'] = { 'ciw()<esc>P',   'word with round  brackets'   }
    , [']'] = { 'ciw{}<esc>P',   'word with squiggly brackets' }

    , c = {
      name = 'change'
      , ['"'] = { [[ciwxx""P]],    'to single quotes'                     }
      , ["'"] = { [[ciw''<esc>P]], 'surround word with single   quotes'   }
      , ['['] = { 'ciw[]<esc>P',   'surround word with square   brackets' }
      , [']'] = { 'ciw{}<esc>P',   'surround word with squiggly brackets' }
      , ['9'] = { 'ciw()<esc>P',   'surround word with round    brackets' }
    }
    , d = { [[daw''=substitute(@@,"'\\\|\"","","g")<cr>P]], 'delete quotes' }
    -- , d = { [[daW''=substitute(@@,"'\\\|\"","","g")<cr>P]], 'delete quotes' }

    , h = { function() require 'telescope.builtin'.pickers()                          end , 'picker history' }

    , p = { [[<cmd>split<cr>]], 'split top-bottom' }
    , r = { function() require 'telescope.builtin'.resume()                           end , 'resume search'  }
    -- , t = { [[<cmd>lua require('theme').ThemeToggle()<cr>]], 'toggle dark/light' }
    , t = { function() require "telescope.builtin".live_grep()                        end , 'search text'    }
  },

  ---
  ---  do we really want to do this?
  ---
  ['<c-p>'] = { function() require 'telescope.builtin'.git_files() end , 'search git files' },

  -- Reload init.lua from standard config path
  -- note that the stdpath makes this portable
  --
  ['<cr>']  = { '<cmd>luafile ~/.config/nvim/init.lua<cr>', 'reload config' },

  ---
  ---  b* mappings
  ---
  b = { name = 'buffer / browse' },
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
  f = {
    name = 'search'
    , b = { function() require 'telescope.builtin'.buffers()                          end , 'in open buffers'   }
    , f = { function() require 'telescope.builtin'.find_files()                       end , 'by file name'      }
    , g = { function() require 'telescope.builtin'.live_grep()                        end , 'with live grep'    }
    , h = { function() require 'telescope.builtin'.help_tags()                        end , 'help tags'         }
    , j = { function() require 'telescope.builtin'.jumplist()                         end , 'jumplist'          }
    , i = { function() require 'telescope.builtin'.builtin()                          end , 'builtins'          }
    , k = { function() require 'telescope.builtin'.keymaps()                          end , 'keymaps'           }
    , l = { function() require 'telescope.builtin'.current_buffer_fuzzy_find()        end , 'current buffer'    }
    , m = { function() require 'telescope.builtin'.man_pages()                        end , 'man pages'         }
    , o = { function() require 'telescope.builtin'.oldfiles()                         end , 'recent files'      }
    , q = { function() require 'telescope.builtin'.quickfix()                         end , 'quickfix'          }
    , r = { function() require 'telescope.builtin'.reloader()                         end , 'reloader'          }
    , s = { function() require 'telescope.builtin'.lsp_workspace_symbols()            end , 'lsp symbols'       }
    , t = { function() require 'telescope.builtin'.filetypes()                        end , 'filetypes'         }
    , w = { function() require 'telescope.builtin'.grep_string()                      end , 'word under cursor' }
    , [';'] = { function() require 'telescope.builtin'.command_history()              end , 'command history'   }
    , ['/'] = { function() require 'telescope.builtin'.search_history()               end , 'search history'    }
    , ['.'] = { function() require 'telescope'.extensions.file_browser.file_browser() end , 'file browser'      }
    , [':'] = { function() require 'telescope.builtin'.commands()                     end , 'commands'          }
  },

  ---
  ---  l* mappings
  ---
  l = {
    name = 'lsp'
    , a = { function() vim.lsp.buf.code_action()                            end , 'code action'          }
    , A = { function() vim.lsp.buf.range_code_action()                      end , 'code action range'    }
    , c = {
      name = 'calls'
      , i = { function() require "telescope.builtin".lsp_incoming_calls()     end , 'incoming calls'     }
      , o = { function() require "telescope.builtin".lsp_outgoing_calls()     end , 'outgoing calls'     }
    }
    , d = { function() require 'telescope.builtin'.diagnostics({bufnr = 0}) end , 'document diagnostics' }
    , f = { function() vim.lsp.buf.format()                                 end , 'format'               }
    , h = { function() vim.lsp.buf.hover()                                  end , 'hover'                }
    , H = { function() vim.lsp.buf.signature_help()                         end , 'signature help'       }
    , i = { '<cmd>LspInfo<cr>',                                                   'info'                 }
    , I = { function() require 'mason.ui'.open()                            end , 'installer info'       }  -- Mason
    , j = { function() vim.diagnostic.goto_next()                           end , 'Next diagnositc'      }
    , k = { function() vim.diagnostic.goto_prev()                           end , 'Previous diagnositc'  }
    , l = { function() vim.lsp.codelens.run()                               end , 'codelens action'      }
    , p = {
      name = 'peek'
      , i = { function() require 'lvim.lsp.peek'.Peek('implementation') end , 'implementation'  }
      , r = { function() vim.lsp.buf.references()                       end , 'references'      }
      , t = { function() require 'lvim.lsp.peek'.Peek('typeDefinition') end , 'type definition' }
    }
    , q = { function() vim.diagnostic.setloclist()                                 end , 'quickfix'              }
    , r = { function() vim.lsp.buf.rename()                                        end , 'rename'                }
    , s = { function() require 'telescope.builtin'.lsp_document_symbols()          end , 'document symbols'      }
    , S = { function() require 'telescope.builtin'.lsp_dynamic_workspace_symbols() end , 'workspace symbols'     }
    , w = { function() require 'telescope.builtin'.diagnostics()                   end , 'workspace diagnostics' }
  },

  ---
  ---  o* mapptings
  ---
  o = {
    name = 'org mode',
    -- m = { name = 'mode' },
    -- n = { name = 'keybind' },
    w = { name = 'workspace' },
  },


  ---
  ---  O* mappings
  ---
  O = {
    function()
      require 'neorg'
    end, 'Start org mode'
  },

  ---
  ---  p* mappings
  ---
  p = {
    name = 'pick'
    , a = { function() require 'telescope.builtin'.autocommands()                          end , 'an autocommand'      }
    , b = { function() require 'telescope.builtin'.buffers()                               end , 'from open buffers'   }
    , e = { function() require 'telescope.builtin'.symbols{sources = {'emoji', 'gitmoji'}} end , '*moji'               }
    , f = { function() require 'telescope.builtin'.find_files()                            end , 'a file'              }
    , g = { function() require 'telescope.builtin'.live_grep()                             end , 'from live grep'      }
    , l = { function() require 'telescope.builtin'.current_buffer_fuzzy_find()             end , 'from current buffer' }
    -- , s = { function() require 'telescope.builtin'.grep_string()                           end , 'word under cursor'   }
    -- , s = { function() require 'telescope.builtin'.grep_string()                           end , 'with grep string'    }
    , s = { function() require 'telescope.builtin'.spell_suggest()                         end , 'spelling suggestion' }
    , S = { function() require 'telescope.builtin'.treesitter()                            end , 'treesitter symbols'  }
    , p = {
      name = 'plugins'
      , s = { function() require 'lazy.view.commands'.commands.sync()                    end , 'sync'    }
      -- , c = { function() require 'plugins'.init_lazy() require 'packer'.compile()        end , 'compile' }
      , c = { function() require 'lazy.view.commands'.commands.check()                   end , 'check'   }
      , d = { function() require 'lazy.view.commands'.commands.debug()                   end , 'debug'   }
      , h = { function() require 'lazy.view.commands'.commands.health()                  end , 'health'  }
      -- , l = { function() require 'telescope'.extensions.packer.plugins()                 end , 'list'    }
      , l = { function() require 'lazy.view.commands'.commands.log()                     end , 'log'     }
      , t = { function() require 'lazy.view.commands'.commands.show()                    end , 'status'  }
      , p = { function() require 'lazy.view.commands'.commands.profile()                 end , 'profile' }
      , u = { function() require 'lazy.view.commands'.commands.update()                  end , 'update'  }
      , w = { function() require 'lazy.view.commands'.commands.clean()                   end , 'clean'   }
    }
    , w = { function() require 'telescope'.extensions.project.project{ display_type = 'full' } end , 'workspace' }
    , v = {
      name = 'vim'
      , h = { function() require 'telescope.builtin'.highlights()  end , 'vim highlights' }
      , o = { function() require 'telescope.builtin'.vim_options() end , 'vim options'    }
      , r = { function() require 'telescope.builtin'.registers()   end , 'vim registers'  }
    }
  },

  ---
  ---  c* mappings
  ---
  c = {
    name = 'comments'
    , ['<c-_>'] = { function() require 'Comment.api'.toggle_current_linewise_op() end , 'comment line'   }
    , l =         { function() require 'Comment.api'.toggle_current_linewise_op() end , 'comment line'   }
    -- , m =         { function() require 'Comment.api'.toggle_linewise_count_op()   end , 'comment motion' }
  },

  ---
  ---  e* mappings
  ---
  -- e = { function() require 'nvim-tree.api'.tree.toggle() end , 'explorer' },

  ---
  ---  d* mappings
  ---
  d = {
    name = 'debug'
    , t = { function() require 'dap'.toggle_breakpoint() end , 'Toggle Breakpoint' }
    , b = { function() require 'dap'.step_back()         end , 'Step Back'         }
    , c = { function() require 'dap'.continue()          end , 'Continue'          }
    , C = { function() require 'dap'.run_to_cursor()     end , 'Run to Cursor'     }
    , d = { function() require 'dap'.disconnect()        end , 'Disconnect'        }
    , g = { function() require 'dap'.session()           end , 'Get Session'       }
    , i = { function() require 'dap'.step_into()         end , 'Step Into'         }
    , o = { function() require 'dap'.step_over()         end , 'Step Over'         }
    , u = { function() require 'dap'.step_out()          end , 'Step Out'          }
    , p = { function() require 'dap'.pause.toggle()      end , 'Pause'             }
    , r = { function() require 'dap'.repl.toggle()       end , 'Toggle Repl'       }
    , s = { function() require 'dap'.continue()          end , 'Start'             }
    , q = { function() require 'dap'.close()             end , 'Quit'              }
  } ,

  ---
  ---  g* mappings
  ---
  g = {
    name = 'git'
    , b = { function() require 'telescope.builtin'.git_branches() end , 'git branches'       }
    , c = { function() require 'telescope.builtin'.git_commits()  end , 'git commits'        }
    , d = { name = 'git diff'                                                                }
    , h = { function() require 'telescope.builtin'.git_stash()    end , 'git stash'          }
    , l = { function() require 'telescope.builtin'.git_bcommits() end , 'git buffer commits' }
    , s = { function() require 'telescope.builtin'.git_status()   end , 'git status'         }
  },

  ---
  ---  h* mappings
  ---
  h = {
    name = 'gitsigns'
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
  t = {
    name = 'toggle'
    , h = { '<cmd>TSHighlightCapturesUnderCursor<cr>',                        'highlight captures'     }
    , i = { function() require 'indent_blankline.commands'.toggle(true) end , 'indentation guides'     }
    , k = { function() require 'nvim-tree.api'.tree.toggle() end ,            'file tree sidebar'      }
    , t = { '<cmd>split term://$SHELL<cr>',                                   'terminal'               }
    , s = { '<cmd>TSPlaygroundToggle<cr>',                                    'tree-sitter playgournd' }
  },

  ---
  ---  r* mappings
  ---
  r = {
    name = 'rest'
    , l = { function() require 'rest-nvim'.last()    end , 'run last request'         }
    , p = { function() require 'rest-nvim'.run(true) end , 'preview the curl command' }
    , r = { function() require 'rest-nvim'.run()     end , 'run request under cursor' }
  },

  ---  v* mapptings
  ---
  v = {
    p = { [[<cmd>vsplit<cr>]], 'split side-to-side' }
  },

  ---  v* mapptings
  ---
  x = {
    name = 'trouble'
  },
}

wk.register(normal_mappings, normal_mode)

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
wk.register({
  -- ['jk'] = { '<esc>', 'escape' },
  -- ['hl'] = { '<esc>', 'escape' },
  -- ['iu'] = { '<esc>', 'escape' },

  ---  luasnip jumping
  ---
  ['<c-_>'] = { function() require 'functions.luasnip'.next()      end , 'snippet jump forward' },
  ['<c-y>'] = { function() require 'functions.luasnip'.jump_back() end , 'snippet jump back'    },
}, {
  mode = 'i'
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
wk.register({
  i =  {
    name = 'inner'
    , u = { function() require 'treesitter-unit'.select()     end , 'unit select' },
  }
  , a = {
    name = 'outer'
    , u = { function() require 'treesitter-unit'.select(true) end , 'unit select' },
  }
}, {
  mode = 'x'
})

wk.register({
  i =  {
    name = 'inner'
    , u = { function() require 'treesitter-unit'.select()     end , 'inner unit'                },
  }
  , a = {
    name = 'outer'
    , u = { function() require 'treesitter-unit'.select(true) end , 'a unit (with white space)' },
  }
}, {
  mode = 'o'
})

---  effect initial timeout
vim.opt.timeoutlen = 300

-- LuaFormatter on
-- stylua: ignore end
