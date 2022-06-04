local keymap = vim.keymap.set
local ft     = require 'Comment.ft'

require 'Comment'.setup()

---  Comments
---
keymap( "n", "<c-_>", "<cmd>lua require 'Comment.api'.call('toggle_current_linewise_op')<cr>g@$",                { } )
keymap( "v", "<c-_>", "<esc><cmd>lua require 'Comment.api'.toggle_current_linewise_op(vim.fn.visualmode())<cr>", { } )
-- keymap( "v", "<leader>c",  "<Plug>kommentary_visual_default<esc>", { } )

ft.Jenkinsfile = { '//%s', '//%s' }
