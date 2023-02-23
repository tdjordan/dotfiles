local actions = require 'telescope.actions'

local telescope = require 'telescope'

telescope.setup {
  defaults = {
    cache_picker = {
      num_pickers = 50
      -- , limit_entries = 1000
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    --prompt_position = 'top',                                                    -- default: bottom
    --prompt_prefix = '>',
    selection_strategy = 'reset',
    --sorting_strategy = 'ascending',                                             -- default: descending
    --layout_strategy = 'horizontal',
    -- layout_config = {
    --   dropdown = {
    --     width = 0.75
    --   }
    -- },
    --file_sorter = require 'telescope.sorters'.get_fuzzy_file,
    --file_ignore_patterns = {},
    --generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
    -- path_display = 'smart',
    --shorten_path = true,
    --winblend = 0,
    --width = 0.75,
    --preview_cutoff = 120,
    --results_height = 1,
    --resutls_width = 0.8,
    --border = {},
    --borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    --use_less = true,
    --scroll_strategy = 'cycle'
    mappings = {
      i = {
        ["jk"] = function() return 'jk' end,
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
    --     ["<c-n>"] = actions.move_selection_next,
    --     ["<c-p>"] = actions.move_selection_previous,
        ["<c-Q>"] = actions.smart_send_to_qflist + actions.open_qflist,
    --     ["<esc>"] = actions.close,
      },
    --   n = {
    --     ["<c-j>"] = actions.move_selection_next,
    --     ["<c-k>"] = actions.move_selection_previous,
    --     ["<c-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
    --     ["<esc>"] = actions.close,
    --   }
    }
  },
  pickers = {
    -- autocommands = {
    --   theme = 'dropdown'
    --   , layout_config = {
    --     width = 0.9
    --     , height = 0.7
    --   }
    -- },

    find_files = {
      theme = 'ivy'
      -- , mirror = true
      , layout_config = {
        height = 0.75
      }
    },

    -- find_files = {
    --   theme = 'cursor'
    -- },

    -- live_grep = {
    --   theme = 'ivy'
    --   -- , mirror = true
    --   , layout_config = {
    --     height = 0.75
    --   }
    -- },

    lsp_document_symbols = {
      theme = 'ivy'
      -- , mirror = true
      , layout_config = {
        height = 0.75
      }
    },

    man_pages = {
      theme = 'ivy'
      -- , mirror = true
      , layout_config = {
        height = 0.90
      }
    },

    jumplist = { theme = 'dropdown' },

    buffers = {
      theme = 'dropdown'
      , layout_strategy = 'bottom_pane'
    },

    -- builtin = {
    --   theme = 'ivy',
    --   -- previewer = false
    --   -- vertical = { width = 0.5 }
    -- },

    current_buffer_fuzzy_find = {
      theme = 'ivy'
      , previewer = false
      , layout_config = {
        height = 0.75
      }
    },

    -- git_branches = {
    --   theme = 'dropdown'
      -- , layout_config = {
      --   height = 200
        -- , vertical = {
        --   mirror = true
        -- }
      -- }
      -- , layout_strategy = 'bottom_pane'
    -- }
  },
  extensions = {
    file_browser = {
      theme = 'ivy'
      , hijack_netrw = true
      -- , mappings = {
      --   i = {},
      --   n = {}
      -- }
    },
    project = {
      base_dirs =
        { { '~/devRoot/_bf',    max_depth = 4 }
        , { '~/devRoot/neovim', max_depth = 4 }
      }
      -- , hidden_files = false
      , theme = 'ivy'
      -- , order_by = 'asc'
      -- , search_by = 'title'
      -- , sync_win_nvim_tree = false    -- default: false
   }
  }
}

-- local _ = require 'notify'
-- require 'telescope'.load_extension('notify')
-- vim.cmd [[packadd telescope-packer.nvim]]
-- require 'telescope'.load_extension('packer')
