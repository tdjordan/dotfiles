local common = require 'lsp.common'

--  html configuration
--
--      yarn global add vscode-langservers-extracted
--
require 'lspconfig'.html.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}

--  emmet configuration
--
--      yarn global add emmet-ls
--
require 'lspconfig'.emmet_ls.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}
