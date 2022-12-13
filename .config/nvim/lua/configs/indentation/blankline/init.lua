-- local cmd = vim.cmd
-- cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 blend=nocombine]]
-- cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B blend=nocombine]]
-- cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 blend=nocombine]]
-- cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 blend=nocombine]]
-- cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF blend=nocombine]]
-- cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD blend=nocombine]]

-- cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f blend=nocombine]]
-- cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a blend=nocombine]]

require 'indent_blankline'.setup
  { char = '¦'
  , show_end_of_line = true
  , space_char_blankline = " "
  , show_trailing_blankline_indent = false
  -- , show_first_indent_level = false
  , show_first_indent_level = true
  , show_current_context = true
  , show_current_context_start = true
  , show_foldtext = false
  , strict_tabs = true
  , use_treesitter = true
  -- , use_treesitter_scope = true
  , buftype_exclude = {
    'terminal'
    , 'nofile'
    , 'quickfix'
    , 'prompt'
  }
  , filetype_exclude =
    { 'help'
    , 'packer'
    , 'checkhealth'
    , 'man'
    , 'lspinfo'
    , 'diagnosticpopup'
    , 'gitmessengerpopup'
    , 'vimwiki'
    , 'defx'
    , 'notify'
    , ''
  }
  , context_patterns =
    { 'class'
    , 'return'
    , '^func'
    , 'function'
    , 'method'
    , '^if'
    , '^while'
    , '^for'
    , 'while'
    , 'for'
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
    , 'object'
    , '^table'
    , 'table'
    , 'if_statement'
    , 'else_clause'
    , 'jsx_element'
    , 'jsx_self_closing_element'
    , 'import_statement'
    , 'operation_type'
    , 'tuble'
    , 'do_block'
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
