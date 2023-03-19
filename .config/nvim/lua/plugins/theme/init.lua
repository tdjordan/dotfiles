return {
  { 'nvim-tree/nvim-web-devicons' },
  {
    'NvChad/nvim-colorizer.lua'
    , event = { 'BufReadPost', 'BufNewFile' }
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
    , cmd = { 'TodoTrouble', 'TodoTelescope' }
    , event = { 'BufReadPost', 'BufNewFile' }
    , keys = {
      {
        ']t', function()
          require 'todo-comments'.jump_next()
        end, desc = 'Next todo comment'
      },
      {
        '[t', function()
          require 'todo-comments'.jump_prev()
        end, desc = 'Previous todo comment'
      },
      {
        '<leader>xt', function()
          vim.cmd.TodoTrouble {}
        end, desc = 'todo (trouble)'
      },
      {
        '<leader>xT', function()
          vim.cmd.TodoTrouble { 'keywords=TODO,FIX,FIXME' }
        end, desc = 'todo/fix/fixme (trouble)'
      },
      {
        '<leader>pt', function()
          require 'telescope'.extensions['todo-comments'].todo()
        end, desc = 'todos'
      },
    }
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
