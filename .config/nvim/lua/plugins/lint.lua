return {
  {
    'mfussenegger/nvim-lint'
    , enabled = false
    , event = { 'BufReadPost' }
    , opts = {
      linters_by_ft = {
        lua = { 'selene' },
        sh = { 'shellcheck' },
        ['*'] = { 'codespell' },
        conf = { 'codespell' },
      }
    }
    -- , init = function()
    --   vim.api.nvim_create_autocmd( { 'BufWritePost' }, {
    --     callback = function()
    --       require 'lint'.try_lint()
    --     end
    --   })
    -- end
    -- , config = function( _, opts )
      -- local lint = require 'lint'(opts)
      -- lint.linters_by_ft = {
      --   lua = { 'selene' },
      --   sh = { 'shellcheck' },
      --   -- ['*'] = { 'codespell' },
      --   conf = { 'codespell' },
      -- }
      -- lint.try_lint()
    -- end
  }
}
