return {
  {
    'nvim-neotest/neotest'
    , event = {
      'BufReadPost'
      , 'BufNewFile'
    }
    , dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'nvim-neotest/neotest-python',
      "TimCreasman/neo-tree-tests-source.nvim"
    },
    config = function()
      require 'neotest-python' {
        dap = { justMyCode = false }
      }
    end
  },
}
