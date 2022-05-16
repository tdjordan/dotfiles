local common = require 'lsp.common'

require 'lspconfig'.kotlin_language_server.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
  , settings = {
    kotlin = {
      compiler = {
        jvm = {
          target = '1.8'
        }
      }
    }
  }
  -- , commands = {
  --   Format = {
  --     function()
  --       vim.lsp.buf.range_formatting(
  --         {}
  --         , { 0, 0 }
  --         , { vim.fn.line('$'), 0 }
  --       )
  --     end
  --   }
  -- }
}
