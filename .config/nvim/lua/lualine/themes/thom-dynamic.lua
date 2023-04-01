local theme = {}

local stealth_themes = {
  'kanagawa'
  , 'material'
}

if vim.g.colors_name == 'material' then
  theme = require 'lualine/themes/thom-material'
elseif vim.tbl_contains( stealth_themes, vim.g.colors_name ) then
  theme = require 'lualine/themes/thom-stealth'
else
  theme = require ('lualine/themes/' .. vim.g.colors_name)
end

-- vim.pretty_print(theme)

return theme
