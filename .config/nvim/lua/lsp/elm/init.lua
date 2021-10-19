local common = require 'lsp.common'

--  elmls configuration
--
--      yarn global add elm elm-test elm-format @elm-tooling/elm-language-server
--
require 'lspconfig'.elmls.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}
