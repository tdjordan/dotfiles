local common = require 'lsp.common'

--  bashls configuration
--
--      npm install -g bash-language-server
--
-- local capabilities = common.capabilities
-- capabilities = require 'cmp_nvim_lsp'.update_capabilities(capabilities)
require 'lspconfig'.bashls.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}
