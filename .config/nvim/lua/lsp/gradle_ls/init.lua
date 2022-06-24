local common = require 'lsp.common'

require 'lspconfig'.gradle_ls.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}
