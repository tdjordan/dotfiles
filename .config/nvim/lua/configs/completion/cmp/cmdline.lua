local cmp = require 'cmp'

cmp.setup.cmdline(':', {
  sources = cmp.config.sources {
    { name = 'path'    },
    { name = 'cmdline' },
  },
  formatting = {
    format = function( _, vim_item )
      vim_item.kind = ''
      return vim_item
    end
  },
  mapping = {
    ['<Tab>']   = cmp.mapping(cmp.mapping.select_next_item(), { 'c' }),
    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'c' }),
    -- ['<CR>']    = cmp.mapping(cmp.mapping.confirm({ select = false }), { 'c' })
  }
})

cmp.setup.cmdline('/', {
  sources = cmp.config.sources {
    { name = 'buffer' }
  },
  formatting = {
    format = function( _, vim_item )
      vim_item.kind = ''
      return vim_item
    end
  },
  mapping = {
    ['<Tab>']   = cmp.mapping(cmp.mapping.select_next_item(), { 'c' }),
    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'c' }),
    -- ['<CR>']    = cmp.mapping(cmp.mapping.confirm({ select = false }), { 'c' })
  }
})
