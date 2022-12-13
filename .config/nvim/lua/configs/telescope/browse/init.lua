local browse = require 'browse'

browse.setup {
  provider = 'google'   -- google is default
}

local bookmarks = {
  'https://github.com/neovim/neovim'
}

vim.api.nvim_create_user_command( 'Browse', function()
  browse.browse { bookmarks = bookmarks }
end, {})

vim.api.nvim_create_user_command( 'BrowseInputSearch', function()
  browse.input_search { bookmarks = bookmarks }
end, {})
