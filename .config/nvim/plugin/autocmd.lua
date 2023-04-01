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

---  Toggle off side columns for certain sidebars
---
local sidebars = {
  'qf'
  , 'help'
}
autocmd( { 'BufWinEnter', 'WinEnter' }, {
  pattern = '*'
  , callback = function()
    if vim.tbl_contains(sidebars, vim.bo.filetype) then
      vim.opt.relativenumber = false
      vim.opt.number = false
      vim.opt.signcolumn = 'no'
    end
  end
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
  , 'neo-tree'
  , 'qf'
  , 'octo_panel'
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
    vim.opt.relativenumber = true
  end
})
autocmd( 'WinLeave', {
  pattern = '*'
  , callback = function()
    if vim.tbl_contains(disabled_filetypes, vim.bo.filetype) then
    -- if vim.bo.filetype == 'NvimTree' then
      return
    end
    vim.opt.relativenumber = false
  end
})

---  Enable spell checking for some filetypes
---
autocmd( { 'BufRead', 'BufNewFile' }, {
  pattern = {
    '*.txt',
    '*.md',
    '*.norg'
  }
  , callback = function()
    vim.opt.spell = true
    -- vim.opt.spelllang = 'en_us'
  end
})
