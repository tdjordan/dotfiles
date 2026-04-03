local sc = require 'schema-companion'
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
