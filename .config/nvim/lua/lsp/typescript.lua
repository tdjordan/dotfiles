--  denols configuration
--
--      brew install deno
--
require 'lspconfig'.denols.setup { }

--  tsserver configuration
--
--      yarn global add typescript typescript-language-server
--
require 'lspconfig'.tsserver.setup { }
