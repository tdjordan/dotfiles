local common = require 'lsp.common'

--  dockerls configuration
--
--      [ TODO: Issue Attaching ] yarn global add dockerfile-language-server-nodejs
--
--      npm install -g dockerfile-language-server-nodejs
--
require 'lspconfig'.dockerls.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}
