-- local common = require 'lsp.common'

--  rust_analyzer configuration
--
--      brew install rust-analyzer
--
-- require 'lspconfig'.rust_analyzer.setup {
--   on_attach = common.on_attach
--   , capabilities = common.capabilities
--   , flags = common.flags
-- }

--  rls configuration
--
--      curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
--
--      || on macOS
--        brew install rustup-init
--
--      rustup update
--      rustup component add rls rust-erc
--
-- require 'lspconfig'.rls.setup { }
