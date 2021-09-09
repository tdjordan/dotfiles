vim.g.material_style = 'oceanic'
require 'material'.setup {
  contrast = true
  , borders = false
  , italics =
    { comments = true
    , strings = false
    , keywords = true
    , functions = true
    , variables = false
  }
  , contrast_windows =
    { 'terminal'
    , 'packer'
    , 'qf'
  }
  , disable =
    { background = false
    , term_colors = false
    , eob_lines = false
  }
}

-- vim.cmd [[ colorscheme material ]]
