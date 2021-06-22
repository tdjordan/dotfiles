local M = {}

local function noremap(scope, lfs, rhs)
  local opt = { noremap = true, silent = true }
  vim.api.nvim_set_keymap(scope, lfs, rhs, opt)
end

M.nnoremap = function(lfs, rhs) noremap('n', lfs, rhs) end
M.inoremap = function(lfs, rhs) noremap('i', lfs, rhs) end
M.vnoremap = function(lfs, rhs) noremap('v', lfs, rhs) end
M.tnoremap = function(lfs, rhs) noremap('t', lfs, rhs) end

return M
