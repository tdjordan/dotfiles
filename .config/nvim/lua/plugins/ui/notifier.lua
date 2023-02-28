return {
  'vigoux/notifier.nvim'
  , enabled = false
  -- , event = 'CursorHold'
  , event = 'VeryLazy'
  , config = function()
    require 'notifier'.setup {}
  end
}
