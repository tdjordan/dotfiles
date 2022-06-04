require 'telescope'.setup {
  extensions = {
    file_browser = {
      theme = 'ivy'
      , hijack_netrw = true
      -- , mappings = {
      --   i = {},
      --   n = {}
      -- }
    }
  }
}

require 'telescope'.load_extension 'file_browser'
