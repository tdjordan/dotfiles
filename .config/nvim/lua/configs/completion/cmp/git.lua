require 'cmp_git'.setup {
  filetypes = { 'gitcommit' },
  github = {
    issues = {
      filter = 'all',
      limit = 100,
      state = 'open'
    },
    mentions = {
      limit = 100
    }
  },
  gitlab = {
    issues = {
      limit = 100,
      state = 'opened'
    },
    mentions = {
      limit = 100
    },
    merge_requests = {
      limit = 100,
      state = 'opened'
    }
  }
}

local cmp = require 'cmp'
cmp.setup.filetype( 'gitcommit', {
  sources = cmp.config.sources {
    { name = 'cmp_git'  },
    { name = 'buffer'   },
    { name = 'luasnip'  },
    { name = 'nvim_lsp' }
  }
})
