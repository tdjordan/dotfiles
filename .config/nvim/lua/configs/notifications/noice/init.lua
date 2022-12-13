require 'noice'.setup {
  presets = {
    bottom_search = true
    , command_palette = false
  }
  , cmdline = {
    view = 'cmdline'
  }
  , views = {
    cmdline_popup = {
      border = {
        style = 'none'
        -- , padding = { 2, 3 }
      }
      , filter_options = {}
      , win_options = {
        winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder'
      }
    }
  }
  , routes = {
    {
      filter = {
        event = "msg_show"
        , kind = "search_count"
      }
      , opts = { skip = true }
    }
  }
}

local keymap = vim.keymap.set

keymap( 'n', '<leader>nl', function()
  require('noice').cmd('last')
end, { desc = 'noice list' } )

keymap( 'n', '<leader>nh', function()
  require('noice').cmd('history')
end, { desc = 'noice history' } )
