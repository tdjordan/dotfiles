-- local cmd = vim.cmd
local o   = vim.o
local g   = vim.g

o.background = 'dark'
-- o.background = 'light'

local lush = require 'lush'
lush(require 'theme')

---  gruvbox-material settings
---
-- The loading time of this color scheme is very long because too many file types
-- and plugins are optimized. This feature allows you to load part of the code on
-- demand by placing them in the `after/ftplugin` directory.
--
-- Enabling this option will reduce loading time by approximately 50%.
g.gruvbox_material_better_performance          = 1         -- default: 0 ( off )

g.gruvbox_material_background                  = 'hard'    -- default: 'medium'
-- g.gruvbox_material_transparent_background    = 1           -- defualt: 0 ( off )
g.gruvbox_material_visual                      = 'reverse' -- default: 'grey background'
g.gruvbox_material_sign_column_background      = 'none'    -- default: 'default'
g.gruvbox_material_diagnostic_line_highlight   = 1         -- default: 0 ( off )
-- g.gruvbox_material_current_word              = 'bold'      -- default: 'grey background'
-- g.gruvbox_material_statusline_style          = 'original'  -- default: 'default'
g.gruvbox_material_lightline_disable_bold      = 1         -- default: 0 ( off )
g.gruvbox_material_enable_italic               = 1         -- default: 1 ( on )
-- g.gruvbox_material_menu_selectionbackground  = 'orange'    -- default: 'default'
-- g.gruvbox_material_diagnostic_line_highlight = 0           -- default: 1
-- g.gruvbox_material_diagnostic_text_highlight = 0           -- default: 1

-- g.gruvbox_material_palette                   = 'material'  -- default: 'material'


-- g.gruvbox_contrast_dark = 'hard'
-- cmd [[ let g:gruvbox_colors = { 'dark0_hard': [ '#000000', ] } ]]
-- o.background = 'dark'
-- cmd [[ colorscheme gruvbox ]]
-- cmd [[ colorscheme gruvbox-material ]]

-- require 'colorbuddy'.colorscheme 'gruvbuddy'
--

