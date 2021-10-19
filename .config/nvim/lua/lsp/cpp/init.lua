local common = require 'lsp.common'

--  cmake configuration
--
--      pip install cmake-language-server
--
require 'lspconfig'.cmake.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}

--  clangd configuration
--
--      https://clangd.llvm.org/installation.html
--
--      - brew install llvm
--
--      https://github.com/rizsotto/Bear
--
--      - brew install bear
--
require 'lspconfig'.clangd.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}
