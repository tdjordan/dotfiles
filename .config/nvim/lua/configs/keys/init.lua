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
  plugins = {
    marks = true,          -- shows a list of your marks on ' and `
    registers = true,      -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false,     -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20,    -- how many suggestions should be shown in the list?
    },

    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true,      -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,      -- default bindings on <c-w>
      nav = true,          -- misc bindings to work with windows
      z = true,            -- bindings for folds, spelling and others prefixed with z
      g = true,            -- bindings for prefixed with g
    },
  },

  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    --   For example:
    --     ["<space>"] = "SPC",
    --     ["<cr>"] = "RET",
    --     ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»",               -- symbol used in the command line area that shows your active key combo
    separator = "➜",                -- symbol used between a key and it's label
    group = "+",                    -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>',          -- binding to scroll down inside the popup
    scroll_up = '<c-u>',            -- binding to scroll up inside the popup
  },
  window = {
    border = "none",                -- none, single, double, shadow
    position = "bottom",            -- bottom, top
    margin = { 1, 0, 1, 0 },        -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 },       -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3,                    -- spacing between columns
    align = "left",                 -- align columns left, center or right
  },
  ignore_missing = false,           -- enable this to hide mappings for which you didn't specify a label
  hidden = {                        -- hide mapping boilerplate
    "<silent>",
    "<cmd>",
    "<Cmd>",
    "<CR>",
    "call",
    "lua",
    "^:",
    "^ "
  },
  show_help = true,                 -- show help message on the command line when the popup is visible
  triggers = "auto",                -- automatically setup triggers
                                    -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local normal_mode = {
  mode = 'n'
  , prefix = "<leader>"
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
    name = '+surround / search'
    , ['"'] = { [[msciw""<esc>P`sl]], 'word with double quotes'     }
    , ["'"] = { [[msciw'<c-r><c-o>"'<esc>`sl]], 'word with single quotes'     }
    -- , ["'"] = { [[msea'<esc>bi'<esc>`sl]], 'word with single quotes'     }
    -- , ["'"] = { [[ciw'<c-r><c-o>"'<esc>]], 'word with single quotes'     }
    -- , ["'"] = { [[ciw''<esc>P]], 'word with single quotes'     }
    , ['['] = { 'ciw[]<esc>P',   'word with square brackets'   }
    , ['9'] = { 'ciw()<esc>P',   'word with round  brackets'   }
    , [']'] = { 'ciw{}<esc>P',   'word with squiggly brackets' }

    , c = {
      name = 'change'
      , ['"'] = { [[ciwxx""P]], 'to single quotes' }
      , ["'"] = { [[ciw''<esc>P]], 'surround word with single   quotes'   }
      , ['['] = { 'ciw[]<esc>P',   'surround word with square   brackets' }
      , [']'] = { 'ciw{}<esc>P',   'surround word with squiggly brackets' }
      , ['9'] = { 'ciw()<esc>P',   'surround word with round    brackets' }
    }
    , d = { [[daw''=substitute(@@,"'\\\|\"","","g")<cr>P]], 'delete quotes' }
    -- , d = { [[daW''=substitute(@@,"'\\\|\"","","g")<cr>P]], 'delete quotes' }

    , p = { [[<cmd>split<cr>]], 'split top-bottom' }
    -- , t = { [[<cmd>lua require('theme').ThemeToggle()<cr>]], 'toggle dark/light' }
    , t = { '<cmd>lua require "telescope.builtin".live_grep()<cr>', 'search text' }
  },

  ---
  ---  do we really want to do this?
  ---
  ['<c-p>'] = { "<cmd>lua require 'telescope.builtin'.git_files()<cr>", 'search git files' },

  -- Reload init.lua from standard config path
  -- note that the stdpath makes this portable
  --
  ['<cr>']  = { '<cmd>luafile ~/.config/nvim/init.lua<cr>', 'reload config' },

  ---
  ---  b* mappings
  ---
  -- b = {
  --   name = 'buffer / browse'
  --   -- name = 'buffer / browse'
  --   , ['.'] = { '<cmd>lua require "telescope.builtin".file_browser()<cr>', 'files' }
  --   -- , c = { '<cmd>BufferClose<cr>', 'close buffer' }
  -- },

  ---
  ---  k* mappings
  ---
  -- k = {
  --   name = '+nerd'
  --   , t = { '<cmd>lua require "telescope.builtin".file_browser()<cr>',             'tree' }
  -- },

  ---
  ---  f* mappings
  ---
  f = {
    name = '+search'
    , b = { '<cmd>lua require "telescope.builtin".buffers()<cr>',                   'in open buffers' }
    , d = { '<cmd>lua require "telescope.builtin".diagnostics()<cr>',               'lsp diagnostics' }
    , f = { '<cmd>lua require "telescope.builtin".find_files()<cr>',                'by file name'    }
    , g = { '<cmd>lua require "telescope.builtin".live_grep()<cr>',                 'with live grep'  }
    , h = { '<cmd>lua require "telescope.builtin".help_tags()<cr>',                 'help tags'       }
    , j = { '<cmd>lua require "telescope.builtin".jumplist()<cr>',                  'jumplist'        }
    , i = { '<cmd>lua require "telescope.builtin".builtin()<cr>',                   'builtins'        }
    , k = { '<cmd>lua require "telescope.builtin".keymaps()<cr>',                   'keymaps'         }
    , l = { '<cmd>lua require "telescope.builtin".current_buffer_fuzzy_find()<cr>', 'current buffer'  }
    , m = { '<cmd>lua require "telescope.builtin".man_pages()<cr>',                 'man pages'       }
    , o = { '<cmd>lua require "telescope.builtin".oldfiles()<cr>',                  'recent files'    }
    , q = { '<cmd>lua require "telescope.builtin".quickfix()<cr>',                  'quickfix'        }
    , r = { '<cmd>lua require "telescope.builtin".reloader()<cr>',                  'reloader'        }
    , s = { '<cmd>lua require "telescope.builtin".lsp_workspace_symbols()<cr>',     'lsp symbols'     }
    , t = { '<cmd>lua require "telescope.builtin".filetypes()<cr>',                 'filetypes'       }
    , [';'] = { '<cmd>lua require "telescope.builtin".command_history()<cr>',       'command history' }
    , ['/'] = { '<cmd>lua require "telescope.builtin".search_history()<cr>',        'search history'  }
  },

  ---
  ---  l* mappings
  ---
  l = {
    name = '+lsp'
    , a = { '<cmd>lua vim.lsp.buf.code_action()',                                 'code action'       }
    , c = { '<cmd>lua vim.lsp.buf.range_code_action()',                           'code action range' }
    , d = { '<cmd>lua require "telescope.builtin".diagnostics({buffnr = 0})<cr>', 'document diagnostics' }
    , f = { '<cmd>lua vim.lsp.buf.formatting()<cr>',                              'format'            }
    , h = { '<cmd>lua vim.lsp.buf.hover()<cr>',                                   'hover'             }
    , i = { '<cmd>LspInfo<cr>',                                                   'info'              }
    , I = { '<cmd>LspInstallInfo<cr>',                                            'installer info'    }
    , j = { '<cmd>lua vim.diagnostic.goto_next()<cr>',                            'next diagnositc'   }
    , k = { '<cmd>lua vim.diagnostic.goto_prev()<cr>',                            'prev diagnositc'   }
    , l = { '<cmd>lua vim.lsp.codelens.run()<cr>',                                'codelens action'   }
    , p = {
      name = '+peek'
      -- , d = { '<cmd>lua require "lvim.lsp.peek".Peek("definition")<cr>',     'definition'      }
      , d = { '<cmd>lua vim.lsp.buf.definition()<cr>',                       'definition'      }
      , i = { '<cmd>lua require "lvim.lsp.peek".Peek("implementation")<cr>', 'implementation'  }
      , r = { '<cmd>lua vim.lsp.buf.references()<cr>',                       'references'      }
      , t = { '<cmd>lua require "lvim.lsp.peek".Peek("typeDefinition")<cr>', 'type definition' }
    }
    , q = { '<cmd>lua vim.diagnostic.setloclist()<cr>',               'quickfix'              }
    , r = { '<cmd>lua vim.lsp.buf.rename()<cr>',                      'rename'                }
    , s = { '<cmd>Telescope lsp_document_symbols<cr>',                'document symbols'      }
    , S = { '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',       'workspace symbols'     }
    , w = { '<cmd>lua require "telescope.builtin".diagnostics()<cr>', 'workspace diagnostics' }
  },

  ---
  ---  p* mappings
  ---
  p = {
    name = '+pick'
    , a = { '<cmd>lua require "telescope.builtin".autocommands()<cr>',                          'an autocommand'      }
    , b = { '<cmd>lua require "telescope.builtin".buffers()<cr>',                               'from open buffers'   }
    , c = { '<cmd>lua require "telescope.builtin".colorscheme()<cr>',                           'a colorscheme'       }
    , e = { '<cmd>lua require "telescope.builtin".symbols{sources = {"emoji", "gitmoji"}}<cr>', '*moji'               }
    , f = { '<cmd>lua require "telescope.builtin".find_files()<cr>',                            'a file'              }
    , g = { '<cmd>lua require "telescope.builtin".live_grep()<cr>',                             'from live grep'      }
    , l = { '<cmd>lua require "telescope.builtin".current_buffer_fuzzy_find()<cr>',             'from current buffer' }
    , s = { '<cmd>lua require "telescope.builtin".grep_string()<cr>',                           'with grep string'    }
    , p = {
      name = '+packer'
      , s = { '<cmd>PackerSync<cr>',                                          'sync'    }
      , c = { '<cmd>PackerCompile<cr>',                                       'compile' }
      , l = { '<cmd>lua require "telescope".extensions.packer.plugins()<cr>', 'list'    }
      , t = { '<cmd>PackerStatus<cr>',                                        'status'  }
      , p = { '<cmd>PackerProfile<cr>',                                       'profile' }
      , u = { '<cmd>PackerUpdate<cr>',                                        'update'  }
      , w = { '<cmd>PackerClean<cr>',                                         'clean'   }
    }
    , w = { '<cmd>lua require "telescope".extensions.project.project{ display_type = "full" }<cr>', 'workspace' }
    , v = {
      name = '+vim'
      , h = { '<cmd>lua require "telescope.builtin".highlights()<cr>',  'vim highlights' }
      , o = { '<cmd>lua require "telescope.builtin".vim_options()<cr>', 'vim options'    }
      , r = { '<cmd>lua require "telescope.builtin".registers()<cr>',   'vim registers'  }
    }
  },

  ---
  ---  c* mappings
  ---
  c = {
    name = '+comments'
    , ["<c-_>"] = { '<Plug>kommentary_line_default',   'comment line'   }
    , l =         { '<Plug>kommentary_line_default',   'comment line'   }
    , m =         { '<Plug>kommentary_motion_default', 'comment motion' }
  },

  ---
  ---  e* mappings
  ---
  e = { [[<cmd>lua require 'functions.toggle'.nvim_tree()<cr>]], 'explorer'  },

  ---
  ---  d* mappings
  ---
  d = {
    name = '+Debug'
    , t = { '<cmd>lua require "dap".toggle_breakpoint()<cr>', 'Toggle Breakpoint' }
    , b = { '<cmd>lua require "dap".step_back()<cr>',         'Step Back'         }
    , c = { '<cmd>lua require "dap".continue()<cr>',          'Continue'          }
    , C = { '<cmd>lua require "dap".run_to_cursor()<cr>',     'Run to Cursor'     }
    , d = { '<cmd>lua require "dap".disconnect()<cr>',        'Disconnect'        }
    , g = { '<cmd>lua require "dap".session()<cr>',           'Get Session'       }
    , i = { '<cmd>lua require "dap".step_into()<cr>',         'Step Into'         }
    , o = { '<cmd>lua require "dap".step_over()<cr>',         'Step Over'         }
    , u = { '<cmd>lua require "dap".step_out()<cr>',          'Step Out'          }
    , p = { '<cmd>lua require "dap".pause.toggle()<cr>',      'Pause'             }
    , r = { '<cmd>lua require "dap".repl.toggle.()<cr>',      'Toggle Repl'       }
    , s = { '<cmd>lua require "dap".continue()<cr>',          'Start'             }
    , q = { '<cmd>lua require "dap".close()<cr>',             'Quit'              }
  },

  ---
  ---  g* mappings
  ---
  g = {
    name = '+git'
    , b = { '<cmd>lua require "telescope.builtin".git_branches()<cr>', 'git branches' }
    , c = { '<cmd>lua require "telescope.builtin".git_commits()<cr>',  'git commits'  }
    , h = { '<cmd>lua require "telescope.builtin".git_stash()<cr>',    'git stash'    }
    , l = { '<cmd>lua require "telescope.builtin".git_bcommits()<cr>', 'git buffer commits' }
    , s = { '<cmd>lua require "telescope.builtin".git_status()<cr>',   'git status'   }
  },

  ---
  ---  i* mappings
  ---
  ---  Indentation
  ---
  i = { [[<cmd>lua require 'functions.toggle'.indent_blankline()<cr>]], 'toggle indentation guides' },

  ---
  ---  k* mappings
  ---
  ---  File Browser
  ---

  ---
  ---  t* mappings
  ---
  t = {
    name = '+toggle'
    , h = { '<cmd>TSHighlightCapturesUnderCursor<cr>',                      'highlight captures'        }
    , i = { [[<cmd>lua require 'functions.toggle'.indent_blankline()<cr>]], 'toggle indentation guides' }
    , k = { [[<cmd>lua require 'functions.toggle'.nvim_tree()<cr>]],        'toggle file tree sidebar'  }
    , t = { '<cmd>split term://$SHELL<cr>',                                 'terminal'                  }
    , s = { '<cmd>TSPlaygroundToggle<cr>',                                  'tree-sitter playgournd'    }
  },

  ---
  ---  r* mappings
  ---
  r = {
    name = '+rest'
    , l = { "<cmd>lua require 'rest-nvim'.last()<cr>",    'run last request'         }
    , p = { "<cmd>lua require 'rest-nvim'.run(true)<cr>", 'preview the curl command' }
    , r = { "<cmd>lua require 'rest-nvim'.run()<cr>",     'run request under cursor' }
  },

  ---  v* mapptings
  ---
  v = {
    p = { [[<cmd>vsplit<cr>]], 'split side-to-side' }
  },

  ---  v* mapptings
  ---
  x = {
    name = '+trouble'
    , l = { [[<cmd>Trouble loclist<cr>]],                   'window location list'  }
    , d = { [[<cmd>Trouble lsp_document_diagnositcs<cr>]],  'document diagnositcs'  }
    , D = { [[<cmd>Trouble lsp_definitions<cr>]],           'lsp definitions'       }
    , q = { [[<cmd>Trouble quickfix<cr>]],                  'quickfix'              }
    , r = { [[<cmd>Trouble lsp_references<cr>]],            'lsp references'        }
    , t = { [[<cmd>Trouble lsp_type_definitions<cr>]],      'lsp type definitions'  }
    , w = { [[<cmd>Trouble lsp_workspace_diagnostics<cr>]], 'workspace diagnostics' }
    , x = { [[<cmd>TroubleToggle<cr>]],                     'trouble toggle'        }
  },

  ---  Comment Handling
  ---
  ['<c-_>'] = { '<plug>NERDCommenterToggle', 'toggle comment'},
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

local cmd = vim.cmd
cmd [[ autocmd BufWinEnter,WinEnter,TermEnter term://* setlocal nonumber norelativenumber ]]
cmd [[ autocmd BufWinEnter,WinEnter,TermEnter term://* startinsert                        ]]
cmd [[ autocmd BufLeave                       term://* stopinsert                         ]]
cmd [[ autocmd TermClose                      term://* call nvim_input('<cr>')            ]]

---  Escape
---
wk.register({
  -- ['jk'] = { '<esc>', 'escape' },
  -- ['hl'] = { '<esc>', 'escape' },
  -- ['iu'] = { '<esc>', 'escape' },

  ---  luasnip jumping
  ---
  ['<c-_>'] = { "<cmd>lua require 'functions.luasnip'.jump()<cr>", 'snippet jump forward' },
  ["<c-y>"] = { "<cmd>lua require 'functions.luasnip'.jump_back()<cr>", 'snippet jump back' },

}, {
  mode = 'i'
})
cmd [[ inoremap jk <esc> ]]
-- cmd [[ autocmd BufWinEnter,WinEnter,BufEnter TelescopePrompt <cmd><lua>vim.opt.timeoutlen = 0<cr> ]]
-- cmd [[ autocmd BufWinEnter,WinEnter,BufEnter TelescopePrompt :inoremap jk <nop>]]
-- cmd [[ autocmd BufWinLeave,WinLeave TelescopePrompt :inoremap jk <esc> ]]
-- cmd [[ autocmd BufWinEnter,WinEnter TelescopePrompt :inoremap hl ]]
-- cmd [[ autocmd BufWinLeave,WinLeave TelescopePrompt :inoremap hl <esc> ]]

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
-- vim.api.nvim_set_keymap('x', 'iu', '<cmd>lua require "treesitter-unit".select()<cr>',     { noremap = true })
-- vim.api.nvim_set_keymap('x', 'au', '<cmd>lua require "treesitter-unit".select(true)<cr>', { noremap = true })
-- vim.api.nvim_set_keymap('o', 'iu', '<cmd>lua require "treesitter-unit".select()<cr>',     { noremap = true })
-- vim.api.nvim_set_keymap('o', 'au', '<cmd>lua require "treesitter-unit".select(true)<cr>', { noremap = true })
wk.register({
  i =  {
    name = '+inner'
    , u = { '<cmd>lua require "treesitter-unit".select()<cr>',     'unit select' },
  }
  , a = {
    name = '+outer'
    , u = { '<cmd>lua require "treesitter-unit".select(true)<cr>', 'unit select' },
  }
}, {
  mode = 'x'
})

wk.register({
  i =  {
    name = '+inner'
    , u = { '<cmd>lua require "treesitter-unit".select()<cr>',     'inner unit' },
  }
  , a = {
    name = '+outer'
    , u = { '<cmd>lua require "treesitter-unit".select(true)<cr>', 'a unit (with white space)' },
  }
}, {
  mode = 'o'
})

---  effect initial timeout
vim.opt.timeoutlen = 300
