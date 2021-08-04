local actions = require 'telescope.actions'

require 'telescope'.setup {
  defaults = {
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
    --layout_defaults = { },
    --file_sorter = require 'telescope.sorters'.get_fuzzy_file,
    --file_ignore_patterns = {},
    --generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
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
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
        ["<c-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
      },
      n = {
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
        ["<c-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
      }
    }
  },
  pickers = {
    find_files                = {
      theme = 'ivy'
      -- , mirror = true
    },

    jumplist                  = { theme = 'dropdown' },

    buffers = {
      theme = 'dropdown'
      , layout_strategy = 'bottom_pane'
    },

    builtin = {
      -- theme = 'ivy',
      previewer = false
    },

    current_buffer_fuzzy_find = {
      theme = 'ivy'
      , previewer = false
      , mirror = true
    },

    file_browser = {
      theme = 'ivy'
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
    project = {
      -- base_dir = vim.env.HOME.."/devRoot/_bf"
      base_dir = '~/devRoot/_bf'
      , max_depth = 3
    }
  }
}
