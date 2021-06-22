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
  ---  window sizing
  ---
  ['-']     = { '<cmd>resize -5<cr>',          'decrease up-down'      },
  ['=']     = { '<cmd>resize +5<cr>',          'increase up-down'      },
  ['\\']    = { '<cmd>vertical resize -5<cr>', 'increase side-to-side' },
  ['<tab>'] = { '<cmd>vertical resize +5<cr>', 'increase side-to-side' },

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
    name = '+search'
    , a = { '<cmd>lua require "telescope.builtin".autocommands()<cr>',              'autocommands'     }
    , b = { '<cmd>lua require "telescope.builtin".buffers()<cr>',                   'in open buffers'  }
    , c = { '<cmd>lua require "telescope.builtin".colorscheme()<cr>',               'colorschemes'     }
    , f = { '<cmd>lua require "telescope.builtin".find_files()<cr>',                'by file name'     }
    , g = { '<cmd>lua require "telescope.builtin".live_grep()<cr>',                 'with live grep'   }
    , l = { '<cmd>lua require "telescope.builtin".current_buffer_fuzzy_find()<cr>', 'current buffer'   }
    , s = { '<cmd>lua require "telescope.builtin".live_grep()<cr>',                 'with live grep'   }
    , v = { '<cmd>lua require "telescope.builtin".vim_options()<cr>',               'vim options'      }
    , w = { '<cmd>lua require "telescope.builtin".grep_string()<cr>',               'with grep string' }
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
  ---  k* mappings
  ---
  ---  File Browser
  ---
  k = { '<cmd>NERDTreeToggle<cr>', 'toggle file tree sidebar' },

  ---  Comment Handling
  ---
  ['<C-_>'] = { '<plug>NERDCommenterToggle', 'toggle comment'},
}

wk.register(normal_mappings, normal_mode)

-- wk.register({
--   ["<leader>f"] = { name = "+file" }
--   , ["<leader>fx"] = { '<nop>', 'no operation'}
-- })

wk.register({
  f = {
    x = { '<nop>', 'no operation'}
  }
}, { prefix = "<leader>"})
