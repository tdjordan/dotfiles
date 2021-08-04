local cmd = vim.cmd

---  establish new filetyp detection
cmd [[
  au BufNewFile,BufRead *.http setf http
]]

---  When opening a file, return to last edit postion
---
cmd [[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line('$') | execute 'normal! g`"' | endif
]]
