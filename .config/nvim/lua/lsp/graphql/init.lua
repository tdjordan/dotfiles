local common = require 'lsp.common'

--  graphql configuration
--
--      [ TODO : Attachment Issues ] yarn global add graphql-language-service-cli
--
--      npm install -g graphql-language-service-cli
--
--      TODO : research graphql more
--
require 'lspconfig'.graphql.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}
