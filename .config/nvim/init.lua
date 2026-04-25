vim.loader.enable()

vim.g.mapleader = ' '

local ok, ui2 = pcall(require, 'vim._core.ui2')
if ok then ui2.enable {} end

-- vim.pack.add {
--   { src = 'https://github.com/ray-x/go.nvim' }
-- }

require 'configs.lazy'

vim.lsp.enable 'pytest_ls'
