local sc = require 'schema-companion'
return sc.setup_client(
  sc.adapters.yamlls.setup({
    sources = {
      sc.sources.matchers.kubernetes.setup({ version = 'master' }),
      sc.sources.lsp.setup(),
      sc.sources.schemas.setup({
        {
          name = 'Kubernetes master',
          uri = 'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone-strict/all.json',
        }
      })
    }
  })
  -- {
  --   --- your language server configuration
  -- }
)
