return {
  ---  quick fix
  ---
  {
    'kevinhwang91/nvim-bqf'
    , ft = 'qf'
    , config = true
  },
  {
    "folke/trouble.nvim"
    , cmd  = {
      "TroubleToggle",
      "Trouble"
    }
    , event = {
      'BufReadPost'
    }
    , opts = {
      modes = {
        diagnostics = {
          auto_close = true,
          auto_open = true,
          filter = {
            buf = 0
          }
        },
        -- cascade = {
        --   mode = "diagnostics",
        --   filter = {
        --     any = {
        --       buf = 0,
        --       {
        --         severity = vim.diagnostic.severity.ERROR,
        --         function(item)
        --           return item.filename:find(
        --             ---@diagnostic disable-next-line: undefined-field
        --             (vim.uv or vim.loop).cwd(), 1, true
        --           )
        --         end
        --       }
        --     }
        --   }
        -- }
      }
      -- use_diagnostic_signs = true,
    }
    , keys = {
      {
        '<leader>xd', function()
          require 'trouble'.toggle({
            mode = 'diagnostics',
          })
        end, desc = 'document  diagnostics'
      },
      {
        '<leader>xx', function()
          require 'trouble'.toggle({
            mode = 'diagnostics',
            filter = {
              buf = 0
            }
          })
        end, desc = 'document  diagnostics (trouble)'
      },
      {
        '<leader>xc', function()
          require 'trouble'.toggle({
            mode = 'diagnostics',
            filter = function(items)
              local severity = vim.diagnostic.severity.HINT
              for _, item in ipairs( items ) do
                severity = math.min( severity, item.severity )
              end
              return vim.tbl_filter( function(item)
                return item.severity == severity
              end, items )
            end
          })
        end, desc = 'cascade (workspace diagnostics)'
      },
      {
        '<leader>xe', function()
          require 'trouble'.toggle({
            mode = 'diagnostics',
            filter = {
              any = {
                buf = 0,
                {
                  severity = vim.diagnostic.severity.ERROR,
                  function(item)
                    return item.filename:find(
                      ---@diagnostic disable-next-line: undefined-field
                      (vim.uv or vim.loop).cwd(), 1, true
                    )
                  end
                }
              }
            }
          })
        end, desc = 'errors only (diagnostics)'
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
