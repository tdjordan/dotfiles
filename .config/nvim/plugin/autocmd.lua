-- local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd

---  When opening a file, return to last edit position
---
autocmd( 'BufReadPost' , {
  pattern = '*'
  , command = [[ if line("'\"") > 1 && line("'\"") <= line('$') | execute 'normal! g`"' | endif ]]
})

---  Text Yank
---
autocmd( 'TextYankPost' , {
  pattern = '*'
  , callback = function()
    require 'vim.highlight'.on_yank { timeout = 100 }
  end
})

---  Resize splits when the window is resized
---
autocmd( 'VimResized' , {
  pattern = '*'
  , command = [[ silent :wincmd = ]]
})

---  Always set TSComment to italic
---
autocmd( 'ColorScheme' , {
  pattern = '*'
  , command = [[ silent highlight TSComment gui=italic ]]
})
