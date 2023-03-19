---  rest explorations
---
return  {
  {
    'rest-nvim/rest.nvim'
    , ft = 'http'
    , config = function()
      require 'configs.rest'
    end
  }
}
