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
    prompt_position = 'top',                                                    -- default: bottom
    --prompt_prefix = '>',
    selection_strategy = 'reset',
    sorting_strategy = 'ascending',                                             -- default: descending
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
  },
}
