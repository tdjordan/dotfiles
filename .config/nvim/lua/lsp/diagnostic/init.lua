-- local common = require 'lsp.common'

--  diagnosticls configuration
--
--      yarn global add diagnostic-languageserver
--
require 'lspconfig'.diagnosticls.setup {
  --on_attach = on_attach,
  filetypes = {
    'sh'
  },
  init_options = {
    linters = {
      shellcheck = {
        command       = 'shellceck',
        rootPatterns  = {},
        isStdout      = true,
        isStderr      = false,
        debounce      = 100,
        args          = {
          --'--format-gcc',
          '--format=json',
          '-'
        },
        offsetLine    = 0,
        offsetColumn  = 0,
        sourceName    = 'shellcheck',
        formatLines   = 1,
        --formatPattern = {
          --'^[^:]+:(\\d+):(\\d+):\\s+([^:]+):\\s+(.*)$',
          --{
            --sourceName       = 1,
            --sourceNameFilter = true,
            --line             = 2,
            --column           = 3,
            --security         = 4,
            --message          = 5,
            --endColumn        = 3,
            --line     = 1,
            --column   = 2,
            --security = 3,
            --message  = 4
          --}
        --},
        parseJson = {
          errorsRoot       = '[0].messages',
          sourceName       = 'file',
          sourceNameFilter = true,
          line             = 'line',
          column           = 'column',
          endLine          = 'endLine',
          endColumn        = 'encColumn',
          security         = 'security',
          message          = '${message} [${code}]',
        },
        securities = {
          error    = 'error',
          warning  = 'warning',
          note     = 'info',
        },
        --requiredFields = {
          --'.shellcheckrc',
          --'shellcheckrc'
        --}
      }
    }
  }
}
