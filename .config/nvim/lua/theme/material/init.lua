vim.g.material_style = 'oceanic'
require 'material'.setup {
  contrast = true           -- set dark for sidebars, floats, & popup menus
  , borders = false         -- no borders between verical splits
  , popup_menu = 'dark'     -- set popup menu style
  , italics =
    { comments = true       -- set italic comments
    , strings = false       -- no  italic strings
    , keywords = true       -- set italic keywords
    , functions = true      -- set italic functions
    , variables = false     -- no  italic variables
  }
  , contrast_windows =
    { 'terminal'            -- dark terminal background
    , 'packer'              -- dark pckaer background
    , 'qf'                  -- dark quick fix background
  }
  , disable =
    { background = true     -- do not set background
    , term_colors = false   -- do not set terminal colors
    , eob_lines = false     -- do not hide eob lines
  }
}
