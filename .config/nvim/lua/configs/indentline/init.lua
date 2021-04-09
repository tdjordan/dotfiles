local g = vim.g

g.indent_blankline_buftype_exclude  = {
  'terminal'
}

g.indent_blankline_filetype_exclude = {
    'help'
  , 'packer'
}

g.indent_blankline_char = '┆'

g.indent_blankline_use_treesitter                 = true
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level        = false
g.indent_blankline_show_current_context           = true

-- g.indent_blankline_char = '┆'

g.indent_blankline_char = '¦'

-- g.indent_blankline_char = '|'

-- g.indent_blankline_char = '┊'

-- g.indent_blankline_char_list = {'|', '¦', '┆', '┊'}

g.indent_blankline_context_patterns = {
    'class'
  , 'return'
  , 'function'
  , 'method'
  , '^if'
  , '^while'
  , 'jsx_element'
  , '^for'
  , '^object'
  , '^table'
  , 'block'
  , 'arguments'
  , 'if_statement'
  , 'else_clause'
  , 'jsx_element'
  , 'jsx_self_closing_element'
  , 'try_statement'
  , 'catch_clause'
  , 'import_statement'
  , 'operation_type'
}

local keymap = vim.api.nvim_set_keymap

keymap( 'n', '<leader>i', '<cmd>IndentBlanklineToggle<cr>', { noremap = true, silent = true } )
