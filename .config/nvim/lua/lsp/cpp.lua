--  cmake configuration
--
--      pip install cmake-language-server
--
require 'lspconfig'.cmake.setup { }

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
require 'lspconfig'.clangd.setup { }
