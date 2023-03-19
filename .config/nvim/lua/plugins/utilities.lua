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
    -- , event = 'CursorHold'
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
    , event = { 'BufReadPost', 'BufNewFile' }
    , config = function()
      require 'configs.comment'
    end
  },

}
