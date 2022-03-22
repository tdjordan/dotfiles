local cmd = vim.cmd

---  establish new filetyp detection
-- cmd [[
--   autocmd BufNewFile,BufRead *.http setf http
-- ]]

---  Nofifications of packer workflows
---
-- cmd [[
--   au User PackerCompile     ++once lua print "Waiting for PackerCompile ..."
--   au User PackerCompileDone ++once lua print "PackerCompile done ..."
-- ]]

---  When opening a file, return to last edit position
---
cmd [[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line('$') | execute 'normal! g`"' | endif
]]

---  Text Yank
---
cmd [[
  autocmd TextYankPost * silent lua require'vim.highlight'.on_yank {timeout = 100}
]]

---  Resize splits when the window is resized
---
cmd [[
  autocmd VimResized * silent :wincmd =
]]

---  Always set TSComment to italic
---
cmd [[
  autocmd ColorScheme * silent highlight TSComment gui=italic
]]

-- cmd [[
--   autocmd FileType NvimTree_* call glyph_palette#apply()
-- ]]

-- cmd [[
--   autocmd FileType * lua require'utility.ft'.do_filetype(vim.fn.expand("<amatch>"))
-- ]]
