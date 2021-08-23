require 'telescope'.setup {
  extensions = {
    project = {
      base_dirs =
        { { '~/devRoot/_bf',    max_depth = 4 }
        , { '~/devRoot/neovim', max_depth = 4 }
      }
    }
  }
}
