return {
  ---  quick fix
  ---
  {
    'kevinhwang91/nvim-bqf'
    , ft = 'qf'
    , config = true
  },
  {
    "folke/trouble.nvim",
    cmd  = { "TroubleToggle", "Trouble"  },
    opts = { use_diagnostic_signs = true },
    keys = {
      {
        '<leader>xd', function()
          require 'trouble'.open()
        end, desc = 'document  diagnostics'
      },
      {
        '<leader>xx', function()
          require 'trouble'.open( 'document_diagnostics' )
        end, desc = 'document  diagnostics (trouble)'
      },
      {
        '<leader>xX', function()
          require 'trouble'.open( 'workspace_diagnostics' )
        end, desc = 'workspace diagnostics (trouble)'
      },
      {
        '<leader>xw', function()
          require 'trouble'.open( 'workspace_diagnostics' )
        end, desc = 'workspace diagnostics'
      },
      {
        '<leader>xl', function()
         require 'trouble'.open( 'loclist' )
        end, desc = 'location  list (trouble)'
      },
      {
        '<leader>xq', function()
          require 'trouble'.open( 'quickfix' )
        end, desc = 'quickfix  list (trouble)'
      },
      {
        'gR', function()
          require 'trouble'.open( 'lsp_references' )
        end, desc = 'lsp references'
      },
      -- {
      --   '<leader>xQ', function()
      --     vim.cmd.TroubleToggle { 'quickfix' }
      --   end, desc = 'quickfist list (trouble)'
      -- },
      -- {
      --   '<leader>xD', function()
      --     vim.cmd.TroubleToggle { 'lsp_definitions' }
      --   end, desc = 'lsp definitions'
      -- },
      -- {
      --   '<leader>xr', function()
      --     vim.cmd.TroubleToggle { 'lsp_references' }
      --   end, desc = 'lsp references'
      -- },
      -- {
      --   '<leader>xt', function()
      --     vim.cmd.TroubleToggle { 'lsp_type_definitions' }
      --   end, desc = 'lsp type definitions'
      -- },
    },
  }
}
