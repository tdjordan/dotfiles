local cmp = require 'cmp'

cmp.setup.filetype( 'Jenkinsfile', {
  sources = cmp.config.sources(
    {
      { name = 'jenkinsfile' },
    }, {
      { name = 'buffer'      },
      { name = 'luasnip'     },
      { name = 'nvim_lsp'    },
      { name = 'path'        },
      { name = 'tags'        }
    }
  )
})
