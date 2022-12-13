local cmp = require 'cmp'

local formatting = {
  format = function( _, vim_item )
    vim_item.kind = ''
    return vim_item
  end
}

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources {
    { name = 'path'    },
    { name = 'cmdline'
      , option = {
        ignore_cmds = { 'Man', '!' }
      }
    },
  },
  formatting = formatting
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources {
    { name = 'buffer' }
  },
  formatting = formatting
})
