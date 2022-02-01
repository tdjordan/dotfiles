require 'better_escape'.setup {
  mapping = { 'jk' }
  , timeout = vim.o.timeoutlen
  , clear_empty_lines = false
  -- , keys = '<esc>'
  , keys = function()
    return vim.fn.col '.' - 2 >= 1 and '<esc>1' or '<esc>'
  end
}
