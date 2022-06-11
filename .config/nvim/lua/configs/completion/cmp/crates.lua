require 'plenary.job'
require 'crates'.setup()

-- vim.cmd [[
--   autocmd BufReadPost Cargo.toml lua require 'cmp'.setup.buffer {sources = {{ name = 'crates' } } }
-- ]]

local cmp = require 'cmp'
cmp.setup.filetype( 'toml', {
  sources = cmp.config.sources {
    { name = 'crates'   },
    { name = 'buffer'   },
    { name = 'luasnip'  },
    { name = 'nvim_lsp' },
    { name = 'path'     },
    { name = 'tags'     }
  }
})
