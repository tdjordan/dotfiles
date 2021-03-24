local api    = vim.api
local keymap = api.nvim_set_keymap

require 'kommentary.config'.configure_language( "default", {
  prefer_single_line_comments = true,
})

---  Comments
---
keymap( "n", "<c-_>",      "<Plug>kommentary_line_default",   { } )
keymap( "v", "<c-_>",      "<Plug>kommentary_visual_default", { } )
keymap( "n", "<leader>cc", "<Plug>kommentary_line_default",   { } )
keymap( "n", "<leader>c",  "<Plug>kommentary_motion_default", { } )
keymap( "v", "<leader>c",  "<Plug>kommentary_visual_default", { } )
