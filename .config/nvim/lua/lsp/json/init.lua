local common = require 'lsp.common'

--  jsonls configuration
--
--      yarn global add vscode-langservers-extracted
--

require 'lspconfig'.jsonls.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
  , commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting(
          {}
          , { 0, 0 }
          , { vim.fn.line('$'), 0 }
        )
      end
    }
  }
}
