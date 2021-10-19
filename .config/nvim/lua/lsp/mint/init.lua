local common = require 'lsp.common'

--  mint configuration
--
--      brew install mint-lang/mint-lang/mint-lang
--
require 'lspconfig'.mint.setup {
  capabilities = common.capabilities
  , on_attach = common.on_attach
  , flags = common.flags
}{ }
