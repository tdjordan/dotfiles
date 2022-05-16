require 'telescope'.setup {
  extensions = {
    file_browser = {
      theme = 'ivy'
      -- , mappings = {
      --   i = {},
      --   n = {}
      -- }
    }
  }
}

require 'telescope'.load_extension 'file_browser'
