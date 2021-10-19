local common = require 'lsp.common'

--  gopls configuration
--
--      brew install gopls
--
require 'lspconfig'.gopls.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}
