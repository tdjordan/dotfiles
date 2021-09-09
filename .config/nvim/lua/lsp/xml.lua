--  yamls configuration
--
--      wget https://download.jboss.org/jbosstools/vscode/stable/lemminx-binary/0.18.0-400/lemminx-osx-x86_64.zip
--
require 'lspconfig'.lemminx.setup {
  cmd = { "lemminx" }
}
