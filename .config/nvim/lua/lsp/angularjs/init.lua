local common = require 'lsp.common'

--  angularls configuration
--
--      yarn global add vscode-ng-language-service
--
require 'lspconfig'.angularls.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}
