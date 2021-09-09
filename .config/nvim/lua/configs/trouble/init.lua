require 'trouble'.setup { }

local trouble = require 'trouble.providers.telescope'

require 'telescope'.setup {
  defaults = {
    mappings =
      { i = { ["<c-t>"] = trouble.open_with_trouble }
      , n = { ["<c-t>"] = trouble.open_with_trouble }
    }
  }
}
