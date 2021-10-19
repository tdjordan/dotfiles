local common = require 'lsp.common'

--  ansiblels configuration
--
--      yarn global add ansible-language-server
--
require 'lspconfig'.ansiblels.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}
