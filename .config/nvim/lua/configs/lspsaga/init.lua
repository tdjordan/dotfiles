--     local ku = require 'keymap.utility'
--     ku.nnoremap( '<leader>gh', '<cmd>Lspsaga lsp_finder<cr>' )
--     ku.nnoremap( '<leader>ca', '<cmd>Lspsaga code_action<cr>' )

require 'lspsaga'.init_lsp_saga {
    error_sign              = '❌'
  , warn_sign               = '⚠️'
  , hint_sign               = '💡'
  , infor_sign              = 'ℹ️'
  , dianostic_header_icon   = ' 🚒 '
  , definition_preview_icon = '📖 '
  , code_action_icon        = '💡'
  , finder_definition_icon  = '📖 '
  , finder_reference_icon   = '🔖 '
  , finder_action_keys =
    { open        = '<cr>'
    , split       = 's'
    , vsplit      = 'v'
    , quit        = '<esc>'
    , scroll_down = '<c-f>'
    , scroll_up   = '<c-b>'
  }
  , code_action_keys =
    { quit = '<esc>'
    , exec = '<cr>'
  }
}
