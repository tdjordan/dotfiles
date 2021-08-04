local cmd = vim.cmd

---  establish new filetyp detection
cmd [[
  au BufNewFile,BufRead *.http setf http
]]

---  Nofifications of packer workflows
---
-- cmd [[
--   au User PackerCompile     ++once lua print "Waiting for PackerCompile ..."
--   au User PackerCompileDone ++once lua print "PackerCompile done ..."
-- ]]

---  When opening a file, return to last edit postion
---
cmd [[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line('$') | execute 'normal! g`"' | endif
]]

---  Text Yank
---
vim.cmd [[
  autocmd TextYankPost * silent lua require'vim.highlight'.on_yank {timeout = 100}
]]
