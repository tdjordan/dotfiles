vim.g.material_style = 'darker'
require 'material'.setup {
  contrast =
    { sidebars = false          -- contrast for sidebars
    , floating_windows = true   -- contrast for floating windows
    , line_numbers = true
    , sign_column = true
    , cursor_line = true
    , non_current_windows = false
    , popup_menu = false
  }
  , italics =
    { comments = true       -- set italic comments
    , keywords = true       -- set italic keywords
    , functions = true      -- set italic functions
    , strings = false       -- no  italic strings
    , variables = false     -- no  italic variables
  }
  , contrast_filetypes =
    { 'terminal'            -- dark terminal background
    , 'packer'              -- dark pckaer background
    , 'qf'                  -- dark quick fix background
  }
  , high_visibility =
    { lighter = true        -- high contrast text for lighter style
    , darker = false        -- high contrast text for darker style
  }
  , disable =
    { colored_cursor = true -- no colored cursor
    , borders = true        -- no boders between vertical splits
    , background = false    -- set background
    , term_colors = false   -- set terminal colors
    , eob_lines = true      -- do not hide eob lines
  }
  -- , lualine_style = 'stealth'
  -- , lualine_style = 'default'
  -- , async_loading = true
  -- , custom_highlights = {
  --   NvimTreeOpenedFolderName = { fg = require 'material.colors'.green, style = 'italic' }
  -- }
}
vim.cmd [[colorscheme material]]
