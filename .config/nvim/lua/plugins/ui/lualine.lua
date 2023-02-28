return {
  'nvim-lualine/lualine.nvim'
  -- , event = 'BufReadPost'
  , event = 'VeryLazy'
  , dependencies = {
    { 'SmiteshP/nvim-navic' }
  }
  , config = function()
    require 'configs.lualine'
  end
}
