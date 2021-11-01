local cmp = require 'cmp'

cmp.setup.cmdline(':', {
  sources = cmp.config.sources {
    { name = 'cmdline' },
  },
  mapping = {
    ['<Tab>']   = cmp.mapping(cmp.mapping.select_next_item(), { 'c' }),
    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'c' }),
    -- ['<CR>']    = cmp.mapping(cmp.mapping.confirm({ select = false }), { 'c' })
  }
})

cmp.setup.cmdline('/', {
  sources = cmp.config.sources {
    { name = 'nvim_lsp_document_symbol' },
    { name = 'buffer' }
  },
  mapping = {
    ['<Tab>']   = cmp.mapping(cmp.mapping.select_next_item(), { 'c' }),
    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'c' }),
    -- ['<CR>']    = cmp.mapping(cmp.mapping.confirm({ select = false }), { 'c' })
  }
})
