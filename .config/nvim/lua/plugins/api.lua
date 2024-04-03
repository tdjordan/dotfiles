---  rest explorations
---
return  {
  {
    'vhyrro/luarocks.nvim'
    , config = function()
      require 'luarocks'.setup {}
    end
  },
  {
    'rest-nvim/rest.nvim'
    , ft = 'http'
    , dependencies = {
      'luarocks.nvim'
    }
    , config = function()
      require 'configs.rest'
    end
  }
}
