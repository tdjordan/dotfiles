-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 blend=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B blend=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 blend=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 blend=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF blend=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD blend=nocombine]]

-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f blend=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a blend=nocombine]]

require 'indent_blankline'.setup
  { char = '¦'
  , show_end_of_line = true
  , space_char_blankline = " "
  , show_trailing_blankline_indent = false
  , show_first_indent_level = false
  , show_current_context = true
  , show_foldtext = false
  , strict_tabs = true
  , use_treesitter = true
  , buftype_exclude = {
    'terminal'
  }
  , filetype_exclude =
    { 'help'
    , 'packer'
    , 'man'
    , 'lspinfo'
    , 'diagnosticpopup'
    , 'gitmessengerpopup'
    , 'vimwiki'
    , 'defx'
    , 'notify'
  }
  , context_patterns =
    { 'class'
    , 'return'
    , 'function'
    , 'method'
    , '^if'
    , '^while'
    , '^for'
    , 'func_literal'
    , 'block'
    , 'try'
    , 'try_statement'
    , 'catch_clause'
    , 'execpt'
    , 'arguments'
    , 'argument_list'
    , 'dictionary'
    , 'element'
    , '^object'
    , '^table'
    , 'if_statement'
    , 'else_clause'
    , 'jsx_element'
    , 'jsx_self_closing_element'
    , 'import_statement'
    , 'operation_type'
  }
  -- , char_highlight_list =
  --   { "IndentBlanklineIndent1"
  --   , "IndentBlanklineIndent2"
  --   , "IndentBlanklineIndent3"
  --   , "IndentBlanklineIndent4"
  --   , "IndentBlanklineIndent5"
  --   , "IndentBlanklineIndent6"
  -- }
  -- , char_highlight_list =
  --   { "IndentBlanklineIndent1"
  --   , "IndentBlanklineIndent2"
  -- }
}
