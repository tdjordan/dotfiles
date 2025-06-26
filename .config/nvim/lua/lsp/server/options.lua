local fn = vim.fn

---@diagnostic disable-next-line: undefined-field
local path_sep = vim.uv.os_uname().version:match "Windows" and "\\" or "/"

local join_paths = function( ... )
  return table.concat( { ... }, path_sep )
end

local server_options = {
  docker_compose_language_service = {
    filetypes = { '!yaml', 'docker-compose' }
  },
  ['helm-ls'] = {
    settings = {
      yamls = {
        path = 'yaml-language-server'
      }
    }
  },
  groovyls = {
    filetypes = { 'groovy', 'Jenkinsfile' }
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
  lua_ls = {
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
            , 'Snacks'
          },
          disable =
            { 'lowercase-global'
            , 'different-requires'
            -- , 'missing-parameter'
            -- , 'trailing-space'
          }
        },
        workspace = {
          checkThirdParty = false,
          -- Make the server aware of Neovim runtime files
          library = {
            -- vim.env.VIMRUNTIME,
            [join_paths( fn.stdpath('data'), 'nvim', 'lua' )] = true,
            [fn.expand( '$VIMRUNTIME/lua' )]                  = true,
            [fn.expand( '$VIMRUNTIME/lua/vim/lsp' )]          = true
          }
        },
        codeLens = {
          enable = true
        },
        completion = {
          callSnippet = "Replace"
        },
        doc = {
          privateName = { "^_" }
        },
        hint = {
          enable = true,
          setType = false,
          paramType = true,
          paramName = 'Disable',
          semicolon = 'Disable',
          arrayIndex = 'Disable'
        }
      }
    }
  },
  yamlls = {
    settings = {
      yaml = {
        redhat = { telemetry = { enabled = false } }
        , hover = true
        , format = { enabled = true }
        , style = {
          flowSequence = 'forbid'
        }
        -- , editor = { formatOnType = false }
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
