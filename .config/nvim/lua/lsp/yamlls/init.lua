local common = require 'lsp.common'

--  yamls configuration
--
--      yarn global add yaml-language-server
--
require 'lspconfig'.yamlls.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
  , settings = {
    yaml = {
      hover = true
      , completion = true
      , validate = true
      , schemaStore = {
        enable = true
        , url = "https://www.schemastore.org/api/json/catalog.json"
      }
      , schemas = {
        kubernetes = {
          'daemon.{yml,yaml}'
          ,'kubectl-edit*.yaml'
        }
      }
    }
  }
}
