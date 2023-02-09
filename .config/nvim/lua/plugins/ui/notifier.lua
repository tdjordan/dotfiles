return {
  'vigoux/notifier.nvim'
  -- , event = 'CursorHold'
  , event = 'VeryLazy'
  , config = function()
    require 'notifier'.setup {}
  end
}
