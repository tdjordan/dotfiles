return {
  {
    'NvChad/nvim-colorizer.lua'
    , event = 'CursorHold'
    , opts = {
      filetypes = { '*', '!lazy', '!mason'    },
      buftype   = { '*', '!prompt', '!nofile' }
    }
  },

  -- TEST: this is a test
  -- NOTE: this is a note
  -- PERF: performance
  -- WARN: warn me
  -- HACK: hack away
  -- TODO: something to do
  -- FIX:  fix me
  {
    'folke/todo-comments.nvim'
    , event = 'BufReadPost'
    , config = true
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
