local keymap = vim.keymap.set
local ft     = require 'Comment.ft'

require 'Comment'.setup()

---  Comments
---
keymap( "n", "<c-_>", "<cmd>lua require 'Comment.api'.call('toggle.linewise.current')<cr>g@$",                { } )
keymap( "v", "<c-_>", "<esc><cmd>lua require 'Comment.api'.locked('toggle.linewise')(vim.fn.visualmode())<cr>", { } )

ft.Jenkinsfile = { '//%s', '//%s' }
