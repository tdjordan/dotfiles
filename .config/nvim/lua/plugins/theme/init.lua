return {
  { 'nvim-tree/nvim-web-devicons' },
  {
    'NvChad/nvim-colorizer.lua'
    , event = { 'BufReadPost', 'BufNewFile' }
    , opts = {
      filetypes = { '*', '!lazy', '!mason'    },
      buftype   = { '*', '!prompt', '!nofile' },
      user_default_options = {
        AARRGGBB = true
      }
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
    -- , optional = true
    , cmd = { 'TodoTrouble', 'TodoTelescope' }
    , event = { 'BufReadPost', 'BufNewFile' }
    , keys = {
      { '<leader>st' , function() Snacks.picker.todo_comments() end, desc = 'todo' },
      { '<leader>sT' , function() Snacks.picker.todo_comments({ keywords = { 'TODO', 'FIX', 'FIXME' } }) end, desc = 'todo / fix / fixme' },
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
        '<leader>ct', function()
          Snacks.picker.todo_comments()
        end, desc = 'todo (snacks)'
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
    , opts = {}
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
