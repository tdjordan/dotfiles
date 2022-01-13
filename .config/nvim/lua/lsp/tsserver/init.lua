local common = require 'lsp.common'

--  tsserver configuration
--
--      yarn global add typescript typescript-language-server
--
local opts = {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}

return opts
