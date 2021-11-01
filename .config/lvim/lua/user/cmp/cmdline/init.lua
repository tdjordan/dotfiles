local cmp = require 'cmp'

cmp.setup.cmdline( ':', {
  sources = cmp.config.sources {
    { name = 'cmdline' }
  },
  mapping = {
    ['<Tab>']   = cmp.mapping( cmp.mapping.select_next_item(), { 'c' } ),
    ['<S-Tab>'] = cmp.mapping( cmp.mapping.select_prev_item(), { 'c' } )
  }
})
