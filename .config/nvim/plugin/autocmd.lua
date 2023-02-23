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

---  Toggle relative line numbers for only active windows
---
local disabled_filetypes = {
  'gitcommit'
  , 'help'
  , 'man'
  , 'packer'
  , 'NvimTree'
  , 'Trouble'
  , 'lazy'
  , 'DiffviewFileHistory'
  , 'DiffviewFiles'
  , ''
}
autocmd( 'WinEnter', {
  pattern = '*'
  , callback = function()
    -- vim.pretty_print(vim.bo.filetype)
    if vim.tbl_contains(disabled_filetypes, vim.bo.filetype) then
    -- if vim.bo.filetype == 'NvimTree' then
      return
    end
    vim.cmd [[ set relativenumber ]]
  end
})
autocmd( 'WinLeave', {
  pattern = '*'
  , callback = function()
    if vim.tbl_contains(disabled_filetypes, vim.bo.filetype) then
    -- if vim.bo.filetype == 'NvimTree' then
      return
    end
    vim.cmd [[ set norelativenumber ]]
  end
})
