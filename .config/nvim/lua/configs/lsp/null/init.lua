local common = require 'lsp.common'
local nls = require 'null-ls'

nls.config {
  sources = {
    nls.builtins.diagnostics.shellcheck.with {
      diagnostics_format = '[#{c}] #{m} (${s})'
    }
    , nls.builtins.diagnostics.hadolint
    -- , null_ls.builtins.formatting.eslint
    -- , null_ls.builtins.formatting.terrform_fmt
    -- null_ls.builtins.formatting.stylua
    -- , null_ls.builtins.formatting.pretter.with {
    --   filetypes = {
    --     'html'
    --     , 'json'
    --     , 'yaml'
    --     , 'markdown'
    --   }
    -- }
  }
}

require 'lspconfig'['null-ls'].setup {
  on_attach = common.on_attach
}
