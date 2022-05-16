require 'better_escape'.setup {
  mapping = { 'jk' }
  -- , timeout = vim.o.timeoutlen
  , timeout = 100
  , clear_empty_lines = true
  -- , keys = '<esc>'
  , keys = function()
    return vim.fn.col '.' - 2 >= 1 and '<esc>1' or '<esc>'
  end
}
