local common = require 'lsp.common'

--  denols configuration
--
--      brew install deno
--
require 'lspconfig'.denols.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}

--  tsserver configuration
--
--      yarn global add typescript typescript-language-server
--
require 'lspconfig'.tsserver.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}

--  eslint configuration
--
--      yarn global add vscode-langservers-extracted
--
-- require 'lspconfig'.eslint.setup {
--   on_attach = common.on_attach
--   , capabilities = common.capabilities
--   , flags = common.flags
-- }
