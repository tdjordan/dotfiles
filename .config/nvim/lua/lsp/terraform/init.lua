local common = require 'lsp.common'

--  terraformls configuration
--
--      brew install hashicorp/tap/terraform-ls
--
require 'lspconfig'.terraformls.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}
