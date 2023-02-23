return {
  {
    'NvChad/nvim-colorizer.lua'
    , event = 'CursorHold'
    , opts = {
      filetypes = { '*', '!lazy'              },
      buftype   = { '*', '!prompt', '!nofile' }
    }
  },

  ---  style windows with different colorschemes
  ---
  {
    'folke/styler.nvim'
    , enabled = false
    , event = 'VeryLazy'
    , opts = {
      themes = {
        markdown = { colorscheme = 'tokyonight-storm' },
        help     = { colorscheme = 'catppuccin-mocha', background = 'dark' }
      }
    }
  }
}
