local common = require 'lsp.common'

--  vimls configuration
--
--      yarn global add vim-language-server
--
require 'lspconfig'.vimls.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}
