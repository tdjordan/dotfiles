local M = {}

local function noremap( mode, lhs, rhs, desc )
  local opt = {
    noremap  = true
    , silent = true
    , desc   = desc
  }
  vim.keymap.set( mode, lhs, rhs, opt )
end

M.nnoremap = function(lhs, rhs, desc) noremap('n', lhs, rhs, desc) end
M.inoremap = function(lhs, rhs, desc) noremap('i', lhs, rhs, desc) end
M.vnoremap = function(lhs, rhs, desc) noremap('v', lhs, rhs, desc) end
M.tnoremap = function(lhs, rhs, desc) noremap('t', lhs, rhs, desc) end

return M
