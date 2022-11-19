local fn = vim.fn

local path_sep = vim.loop.os_uname().version:match "Windows" and "\\" or "/"

local join_paths = function( ... )
  return table.concat( { ... }, path_sep )
end

local server_options = {
  jsonls = {
    settings = {
      json = {
        schemas  = require 'schemastore'.json.schemas(),
        validate = { enable = true }
      }
    }
  },
  -- kotlin_language_server = {
  --   settings = {
  --     kotlin = {
  --       compiler = {
  --         jvm = {
  --           target = '1.8'
  --         }
  --       }
  --     }
  --   }
  -- },
  sumneko_lua = {
    settings = {
      Lua = {
        -- runtime = {
        --   version = 'LuaJIT'
        -- },
        diagnostics = {
          -- enable = true,
          globals =
            { 'vim'
            , 'hs'
            , 'spoon'
            , 'packer_plugins'
            , 'lvim'
          },
          disable =
            { 'lowercase-global'
            -- , 'missing-parameter'
            -- , 'trailing-space'
          }
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [join_paths( fn.stdpath('data'), 'nvim', 'lua' )] = true,
            [fn.expand( '$VIMRUNTIME/lua' )]                  = true,
            [fn.expand( '$VIMRUNTIME/lua/vim/lsp' )]          = true
          }
        }
      }
    }
  },
  yamlls = {
    settings = {
      yaml = {
        hover = true
        , completion = true
        , validate = true
        , schemaStore = {
          enable = true
          , url = "https://www.schemastore.org/api/json/catalog.json"
        }
        , schemas = {
          kubernetes = {
            'daemon.{yml,yaml}'
            ,'kubectl-edit*.yaml'
          }
        }
      }
    }
  }
}

return server_options
