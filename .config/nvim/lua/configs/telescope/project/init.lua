require 'telescope'.setup {
  extensions = {
    project = {
      base_dirs =
        { { '~/devRoot/_bf',    max_depth = 4 }
        , { '~/devRoot/neovim', max_depth = 4 }
      }
      -- , hidden_files = false
      , theme = 'ivy'
      -- , order_by = 'asc'
      -- , search_by = 'title'
      -- , sync_win_nvim_tree = false    -- default: false
    }
  }
}
