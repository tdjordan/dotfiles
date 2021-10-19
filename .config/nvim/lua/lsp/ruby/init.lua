local common = require 'lsp.common'

--  sorbet configuration
--
--      gem install sorbet
--
require 'lspconfig'.sorbet.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}
