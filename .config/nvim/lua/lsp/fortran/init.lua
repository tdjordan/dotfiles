local common = require 'lsp.common'

--  fortls configuration
--
--      pip install fortran-language-server
--
--      TODO : fix attach issue with test.f90
--
require 'lspconfig'.fortls.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}{ }
