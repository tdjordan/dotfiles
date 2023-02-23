return {
  'xfyuan/nightforest.nvim'
  , lazy = true
  -- , keys = '<leader>pc'
  -- , keys = {
  --   { '<leader>pc' }
  -- }
  , config = function()
    require 'nightforest'.setup {}
  end
}

