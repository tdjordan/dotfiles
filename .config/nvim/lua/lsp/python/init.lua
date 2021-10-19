local common = require 'lsp.common'

--  pyright configuration
--
--      yarn global add pyright
--
require 'lspconfig'.pyright.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}
--require 'lspconfig'.jedi_language_server.setup{}
