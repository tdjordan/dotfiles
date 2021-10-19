local common = require 'lsp.common'

--  yamls configuration
--
--      yarn global add yaml-language-server
--
require 'lspconfig'.yamlls.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}
