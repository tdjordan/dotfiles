require 'lsp.handlers'.setup()

require 'mason'.setup {}

local servers =
  { 'ansiblels'                       -- Ansible
  -- , 'ansible-lint'                    -- TODO Linters
  -- , 'ast_grep'                        -- Linter & Formatter based on AST
  -- , 'awk_ls'                          -- AWK
  , 'bashls'                          -- bash
  , 'clangd'                          -- C++
  , 'cmake'                           -- CMake
  , 'neocmake'                        -- CMake
  , 'cucumber_language_server'        -- Cucumber
  , 'dagger'                          -- Cue
  , 'dockerls'                        -- Docker
  , 'docker_compose_language_service' -- Docker Compose
  , 'dotls'                           -- Dot
  , 'elmls'                           -- Elm
  -- , 'erg_language_server'             -- Erg
  -- , 'gleam'                           -- Gleam
  , 'gopls'                           -- go
  , 'graphql'                         -- GraphQL
  , 'gradle_ls'                       -- gradle
  , 'groovyls'                        -- groovy
  , 'helm_ls'                         -- helm
  -- , 'hls'                          -- Haskell
  -- , 'jdtls'                        -- Java
  -- , 'jq-lsp'                       -- jq
  , 'jsonls'                          -- json
  , 'jsonnet_ls'                      -- jsonnet
  , 'julials'                         -- Julia
  , 'kotlin_language_server'          -- Kotlin
  , 'lemminx'                         -- XML
  , 'lua_ls'                          -- lua
  , 'marksman'                        -- Markdown
  -- , 'nginx_language_server'        -- Nginx
  -- , 'nil_ls'                       -- Nix
  -- , 'nomad_lsp'                    -- Nomad
  , 'pbls'                            -- Protocol Buffers
  , 'pylyzer'                         -- Python
  , 'pyright'                         -- Python
  , 'raku_navigator'                  -- Raku
  , 'rnix'                            -- Nix
  , 'ruff_lsp'                        -- Python
  , 'rust_analyzer'                   -- Rust
  -- , 'salt_ls'                         -- Salt
  , 'taplo'                           -- Toml
  , 'terraformls'                     -- terraform
  , 'textlsp'                         -- textLSP
  , 'tflint'                          -- terraform
  , 'tsserver'                        -- typescript
  -- , 'vale_ls'                         -- vale
  , 'vimls'                           -- Vim
  -- , 'visualforce_ls'               -- sfdx
  -- , 'vtsls'                        -- typescript
  , 'yamlls'                          -- yaml
  -- , 'zls'                          -- Zig
}

local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed       = servers,
  -- ensure_installed       = {},
  automatic_installation = true
}

-- local lspconfig = require 'lspconfig'
local common    = require 'lsp.common'

local lsp_bootstrap = function( server_name )
  local common_options =
    { on_attach    = common.on_attach
    , capabilities = common.capabilities
    , flags        = common.flags
  }

  local opts = vim.tbl_deep_extend( "force",
    {},
    common_options,
    require 'lsp.server.options'[server_name] or {}
  )

  -- if server_name == 'yamlls' then
  --   vim.print(opts)
  -- end

  require 'lspconfig'[server_name].setup(opts)
end

mason_lspconfig.setup_handlers {
  function( server_name )
    lsp_bootstrap( server_name )
  end
}

-- local mason_installer_servers = {
--   -- 'gleam'                             -- Gleam
--   -- , 'helm_ls'                         -- Helm
-- }
--
-- for _, server_name in ipairs( mason_installer_servers ) do
--   lsp_bootstrap( server_name )
-- end
