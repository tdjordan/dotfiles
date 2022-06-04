local keymap = vim.keymap.set

local languages =
  { 'default'
  , 'gradle'
  , 'groovy'
  , 'java'
}

for _, language in pairs( languages ) do
  require 'kommentary.config'.configure_language( language, {
    prefer_single_line_comments = true,
    use_consistent_indentation = true,
    ignore_whitespace = true
  })
end

---  Comments
---
keymap( "n", "<c-_>",      "<Plug>kommentary_line_default",        { } )
keymap( "v", "<c-_>",      "<Plug>kommentary_visual_default<esc>", { } )
keymap( "v", "<leader>c",  "<Plug>kommentary_visual_default<esc>", { } )
