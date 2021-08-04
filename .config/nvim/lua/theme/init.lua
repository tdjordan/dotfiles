-- vim.o.background = 'dark'
-- vim.o.background = 'light'
-- local cmd = vim.api.nvim_command
-- cmd [[
--   colorscheme jellybeans-nvim
-- ]]
-- vim.g.colors_name = 'melange'
-- vim.g.colors_name = 'jellybeans-nvim'
-- vim.g.colors_name = 'oak'
-- vim.g.material_style = "deep ocean"
-- vim.g.material_style = "lighter"
-- vim.g.material_style = "oceanic"
-- vim.g.material_style = "darker"
-- vim.g.material_italic_comments = true
-- vim.g.colors_name = 'material'
-- require 'material'.set()
-- vim.g.colors_name = 'nordbuddy'
-- vim.g.colors_name = 'onedark'
-- vim.g.colors_name = 'nord'
-- vim.g.colors_name = 'onedark_nvim'
-- vim.g.colors_name = 'gruvbox-material'
-- vim.g.colors_name = 'base16-ocean'

local M = {}

M.ThemeToggle = function()
  if vim.api.nvim_get_option('background') == 'dark' then
    vim.api.nvim_set_option('background', 'light')
  else
    vim.api.nvim_set_option('background', 'dark')
  end
end
-- local nnoremap = require 'keymap.utility'.nnoremap
-- nnoremap( '<leader>st', '<cmd>lua ThemeToggle()<cr>' )
return M
