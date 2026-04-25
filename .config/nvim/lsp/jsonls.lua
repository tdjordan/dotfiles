local sc = require 'schema-companion'

---@type vim.lsp.Config
return sc.setup_client(
  sc.adapters.jsonls.setup({
    sources = {
      sc.sources.lsp.setup(),
      sc.sources.none.setup()
    }
  })
  -- {
  --   --- your language server configuration
  -- }
)
