local common = require 'lsp.common'

--  cucumber_language_server configuration
--
--      yarn global add @cucumber/language-server
--
require 'lspconfig'.cucumber_language_server.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}
