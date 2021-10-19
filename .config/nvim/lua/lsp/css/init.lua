local common = require 'lsp.common'

--  cssls configuration
--
--      yarn global add vscode-langservers-extracted
--
require 'lspconfig'.cssls.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}
