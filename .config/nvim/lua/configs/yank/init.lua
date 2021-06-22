vim.cmd [[autocmd TextYankPost * silent lua require'vim.highlight'.on_yank {timeout = 100}]]
-- vim.api.nvim_exec( [[ autocmd TextYankPost * silent! lua require'vim.highligt'.on_yank {timeout = 100}]] , false)
