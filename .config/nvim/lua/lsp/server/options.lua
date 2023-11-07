local fn = vim.fn

local path_sep = vim.loop.os_uname().version:match "Windows" and "\\" or "/"

local join_paths = function( ... )
  return table.concat( { ... }, path_sep )
end

local server_options = {
  docker_compose_language_service = {
    filetypes = { '!yaml', 'docker-compose' }
  },
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
        , schemas = require 'schemastore'.yaml.schemas()
        -- , schemas = {
        --   kubernetes = {
        --     'daemon.{yml,yaml}',
        --     "manager.{yml,yaml}",
        --     "restapi.{yml,yaml}",
        --     "role.{yml,yaml}",
        --     "role_binding.{yml,yaml}",
        --     "*onfigma*.{yml,yaml}",
        --     "*ngres*.{yml,yaml}",
        --     "*ecre*.{yml,yaml}",
        --     "*eployment*.{yml,yaml}",
        --     "*ervic*.{yml,yaml}",
        --     'kubectl-edit*.{yml,yaml}',
        --     'deployment.{yml,yaml}',
        --     'configmap.{yml,yaml}',
        --     'hpa.{yml,yaml}',
        --     'ingress.{yml,yaml}',
        --     'secrets.{yml,yaml}',
        --     'service.{yml,yaml}',
        --     'sserviceaccount.{yml,yaml}',
        --   }
        -- }
      }
    }
  }
}

return server_options
