-- New <leader> of the band
-- vim.cmd [[
--   nnoremap <silent> <space> <nop>
--   vnoremap <silent> <space> <nop>
-- ]]

vim.g.mapleader = ' '

local wk = require 'which-key'

wk.setup {
  plugins = {
    marks = true
    , registers = true
  }
  -- , layout = {
  --   spacing = 5
  -- }
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
    name = '+surround'
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
      , ['"'] = { [[ciwxx""P]], 'to signle quotes' }
      , ["'"] = { [[ciw''<esc>P]], 'surround word with single   quotes'   }
      , ['['] = { 'ciw[]<esc>P',   'surround word with square   brackets' }
      , [']'] = { 'ciw{}<esc>P',   'surround word with squiggly brackets' }
      , ['9'] = { 'ciw()<esc>P',   'surround word with round    brackets' }
    }
    , d = { [[daw''=substitute(@@,"'\\\|\"","","g")<cr>P]], 'delete quotes' }
    -- , d = { [[daW''=substitute(@@,"'\\\|\"","","g")<cr>P]], 'delete quotes' }

    , p = { [[<cmd>split<cr>]], 'split top-bottom' }
    , t = { [[<cmd>lua require('theme').ThemeToggle()<cr>]], 'toggle dark/light' }
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
  b = {
    name = '+browse'
    , ['.'] = { '<cmd>lua require "telescope.builtin".file_browser()<cr>', 'files' }
  },

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
    , d = { '<cmd>lua require "telescope.builtin".lsp_workspace_diagnostics()<cr>', 'lsp diagnostics' }
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
    -- , v = { '<cmd>lua require "telescope.builtin".vim_options()<cr>',               'vim options'      }
    , s = { '<cmd>lua require "telescope.builtin".grep_string()<cr>',               'with grep string' }
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
    -- , w = { '<cmd>lua require "telescope".extensions.project.project{ theme = "ivy" }<cr>', 'workspace' }
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
    , c =         { '<Plug>kommentary_motion_deafult', 'comment motion' }
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
  i = { '<cmd>DoIndentBlankline<cr>', 'toggle indentation guides' },

  ---
  ---  k* mappings
  ---
  ---  File Browser
  ---
  k = { '<cmd>NvimTreeToggle<cr>', 'toggle file tree sidebar' },

  ---
  ---  t* mappings
  ---
  t = {
    name = '+toggle'
    , h = { '<cmd>TSHighlightCapturesUnderCursor<cr>', 'highlight captures'     }
    , t = { '<cmd>split term://$SHELL<cr>',            'terminal'               }
    , s = { '<cmd>TSPlaygroundToggle<cr>',             'tree-sitter playgournd' }
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
    , l = { [[<cmd>TroubleToggle loclist<cr>]],                   'lsp references'        }
    , d = { [[<cmd>TroubleToggle lsp_document_diagnositcs<cr>]],  'document diagnositcs'  }
    , q = { [[<cmd>TroubleToggle quickfix<cr>]],                  'quickfix'              }
    , w = { [[<cmd>TroubleToggle lsp_workspace_diagnostics<cr>]], 'workspace diagnostics' }
    , x = { [[<cmd>TroubleToggle<cr>]],                           'trouble toggle'        }
  },

  ---  Comment Handling
  ---
  ['<c-_>'] = { '<plug>NERDCommenterToggle', 'toggle comment'},
}

wk.register(normal_mappings, normal_mode)

---  Fix wierd default mappings
---
wk.register({
  Y = { 'y$', 'yank to end of line instead of whole line' }
})

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
tnoremap( '<Esc>', [[<C-\><C-n>]] )
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
  ['jk'] = { '<esc>', 'escape' },
}, {
  mode = 'i'
})
cmd [[ autocmd BufWinEnter,WinEnter TelescopePrompt :iunremap jk ]]
cmd [[ autocmd BufWinLeave,WinLeave TelescopePrompt :inoremap jk <esc> ]]

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
