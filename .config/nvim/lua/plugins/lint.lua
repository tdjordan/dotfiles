return {
  {
    'mfussenegger/nvim-lint'
    , event = { 'BufReadPost' }
    , opts = {
      linters_by_ft = {
        lua = { 'selene' },
        sh = { 'shellcheck' },
      }
    }
    , config = function( _, opts )
      local lint = require 'lint'
    end
  }
}
