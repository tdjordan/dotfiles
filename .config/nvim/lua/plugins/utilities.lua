return {
  ---  Utility - Alignment
  {
    'junegunn/vim-easy-align'
    , cmd = 'EasyAlign'
  },

  ---  braces
  ---
  -- { 'rstacruz/vim-closer' },
  -- { 'jiangmiao/auto-pairs' },
  {
    'windwp/nvim-autopairs'
    , event = 'InsertEnter'
    , config = function()
      require 'configs.autopairs'
    end
  },

  ---  performance
  ---
  {
    'tweekmonster/startuptime.vim'
    , cmd = 'StartupTime'
  },
  --   'norcalli/profiler.nvim',

  ---  convenience
  ---
  {
    'numToStr/Comment.nvim'
    -- , event = 'CursorHold'
    -- , event = { 'BufReadPost', 'BufNewFile' }
    , keys = {
      { '<c-_>', mode = { 'n', 'v' } },
      { '<c-/>', mode = { 'n', 'v' } },
      -- { 'gc',    mode = { 'n', 'v' }, desc = 'Comment toggle linewise'      },
      -- { 'gcc',   mode = { 'n', 'v' }, desc = 'Comment toggle current line'  },
      -- { 'gb',    mode = { 'n', 'v' }, desc = 'Comment toggle blockwise'     },
      -- { 'gbc',   mode = { 'n', 'v' }, desc = 'Comment toggle current block' }
    }
    , opts = {
      padding   = true,  -- Add a space b/w comment and the line
      sticky    = true,  -- Whether the cursor should stay at its position
      ignore    = nil,   -- Lines to be ignored while (un)comment
      toggler   = {      -- -LHS of toggle mappings in NORMAL mode
        line    = 'gcc', -- Line-comment toggle keymap
        block   = 'gbc', -- Block-comment toggle keymap
      },
      opleader  = {      -- LHS of operator-pending mappings in NORMAL and VISUAL mode
        line    = 'gc',  -- Line-comment keymap
        block   = 'gb',  -- Block-comment keymap
      },
      extra     = {      -- LHS of extra mappings
        above   = 'gcO', -- Add comment on the line above
        below   = 'gco', -- Add comment on the line below
        eol     = 'gcA', -- Add comment at the end of line
      },
      -- NOTE: If given `false` then the plugin won't create any mappings
      mappings  = {      -- Enable keybindings
        basic   = true,  -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        extra   = true,  -- Extra mapping; `gco`, `gcO`, `gcA`
      },
      pre_hook  = nil,   -- Function to call before (un)comment
      post_hook = nil,   -- Function to call after (un)comment
    }
    , config = function(x)
      local keymap = vim.keymap.set
      local ft     = require 'Comment.ft'
      local api    = require 'Comment.api'

      require 'Comment'.setup(x.opts)

      keymap( "n", "<c-_>", api.call('toggle.linewise.current', 'g@$'), { expr = true, desc = 'Comment current line' } )
      keymap( "v", "<c-_>", "<esc><cmd>lua require 'Comment.api'.locked('toggle.linewise')(vim.fn.visualmode())<cr>", { } )

      keymap( "n", "<c-/>", api.call('toggle.linewise.current', 'g@$'), { expr = true, desc = 'Comment current line' } )
      keymap( "v", "<c-/>", "<esc><cmd>lua require 'Comment.api'.locked('toggle.linewise')(vim.fn.visualmode())<cr>", { } )

      ft.Jenkinsfile = { '//%s', '//%s' }
    end
  }
}
