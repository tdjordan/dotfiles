-- local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
local autogrp = vim.api.nvim_create_augroup

---  When opening a file, return to last edit position
---
autocmd( 'BufReadPost' , {
  pattern = '*'
  , command = [[ if line("'\"") > 1 && line("'\"") <= line('$') | execute 'normal! g`"' | endif ]]
  , group = autogrp( 'LastEditPosition', { clear = true } )
})

---  Text Yank
---
autocmd( 'TextYankPost' , {
  pattern = '*'
  , callback = function()
    vim.hl.on_yank { timeout = 100 }
  end
  , group = autogrp( 'TextYank', { clear = true } )
})

---  Resize splits when the window is resized
---
autocmd( 'VimResized' , {
  pattern = '*'
  , command = [[ silent :wincmd = ]]
  , group = autogrp( 'WindowResizing', { clear = true } )
})

---  Always set TSComment to italic
---
autocmd( 'ColorScheme' , {
  pattern = '*'
  , command = [[ silent highlight TSComment gui=italic ]]
  , group = autogrp( 'ItalicComments', { clear = true } )
})

---  Toggle off side columns for certain sidebars
---
-- local sidebars_buffers = {
--   'nofile'
-- }
local sidebars = {
  'qf'
  , 'help'
  , 'query'
  , 'tsplayground'
  , 'lazy'
  , 'lazy_backdrop'
  -- , ''
}
local no_side_column = autogrp( 'NoSideColumn', { clear = true } )
autocmd( { 'BufWinEnter', 'WinEnter', 'WinLeave', 'BufNewFile', 'BufReadPost' }, {
  pattern = '*'
  , callback = function()
    -- if vim.tbl_contains(sidebars_buffers, vim.bo.buftype) then
    --   vim.opt.relativenumber = false
    --   vim.opt.number = false
    --   vim.opt.signcolumn = 'no'
    -- end
    if vim.tbl_contains(sidebars, vim.bo.filetype) then
      vim.opt.relativenumber = false
      vim.opt.number = false
      vim.opt.signcolumn = 'no'
    end
  end
  , group = no_side_column
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
  , 'trouble'
  , 'lazy'
  , 'lazy_backdrop'
  , 'DiffviewFileHistory'
  , 'DiffviewFiles'
  , 'neo-tree'
  , 'qf'
  , 'octo_panel'
  , 'query'
  , 'tsplayground'
  , 'git'
  , ''
  , 'Outline'
  , 'checkhealth'
}
autocmd( { 'WinEnter', 'BufWinEnter' }, {
  pattern = '*'
  , callback = function()
    -- vim.print( vim.bo.filetype )
    if vim.tbl_contains(disabled_filetypes, vim.bo.filetype) then
      -- vim.print( vim.bo.filetype )
      -- vim.diagnostic.config( { virtual_lines = false } )
      -- require 'lsp_lines'.toggle()
      -- vim.print( vim.inspect(vim.diagnostic.config()) )
      return
    end
    vim.opt.relativenumber = true
  end
  , group = no_side_column
})
autocmd( 'WinLeave', {
  pattern = '*'
  , callback = function()
    if vim.tbl_contains(disabled_filetypes, vim.bo.filetype) then
      -- vim.print( vim.bo.filetype )
      -- vim.print( vim.inspect(vim.diagnostic.config()) )
      -- vim.diagnostic.config( {
      --   virtual_lines = {
      --     only_current_line = true
      --   }
      -- } )
      -- vim.print( vim.inspect(vim.diagnostic.config()) )
      -- require 'lsp_lines'.toggle()
      return
    end
    vim.opt.relativenumber = false
  end
  , group = no_side_column
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
  , group = autogrp( 'EnableSpellChecking', { clear = true } )
})
