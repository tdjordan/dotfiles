local sc = require 'schema-companion'
return sc.setup_client(
  sc.adapters.helmls.setup({
    sources = {
      sc.sources.matchers.kubernetes.setup({ version = 'master' }),
    }
  })
  -- {
  --   --- your language server configuration
  -- }
)
