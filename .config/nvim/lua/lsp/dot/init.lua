local common = require 'lsp.common'

--  dotls configuration
--
--      yarn global add dot-language-server
--
require 'lspconfig'.dotls.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}
