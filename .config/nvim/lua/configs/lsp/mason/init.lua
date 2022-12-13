require 'lsp.handlers'.setup()

require 'mason'.setup()

local servers =
  { 'ansiblels'                -- Ansible
  , 'awk_ls'                   -- AWK
  , 'bashls'                   -- bash
  , 'clangd'                   -- C++
  , 'cmake'                    -- CMake
  , 'neocmake'                 -- CMake
  , 'cucumber_language_server' -- Cucumber
  , 'dagger'                   -- Cue
  , 'dockerls'                 -- Docker
  , 'dotls'                    -- Dot
  , 'elmls'                    -- Elm
  , 'gopls'                    -- go
  , 'graphql'                  -- GraphQL
  , 'gradle_ls'                -- gradle
  , 'groovyls'                 -- groovy
  -- , 'jdtls'                    -- Java
  , 'jsonls'                   -- json
  , 'jsonnet_ls'               -- jsonnet
  , 'julials'                  -- Julia
  , 'kotlin_language_server'   -- Kotlin
  , 'lemminx'                  -- XML
  , 'marksman'                 -- Markdown
  -- , 'nginx_language_server'    -- Nginx
  , 'pyright'                  -- Python
  , 'rnix'                     -- Nix
  , 'rust_analyzer'            -- Rust
  , 'salt_ls'                  -- Salt
  , 'sumneko_lua'              -- lua
  , 'taplo'                    -- Toml
  , 'terraformls'              -- terraform
  , 'tflint'                   -- terraform
  , 'tsserver'                 -- typescript
  , 'vimls'                    -- Vim
  -- , 'visualforce_ls'           -- sfdx
  , 'yamlls'                   -- yaml
  -- , 'zls'                      -- Zig
}

local customized_servers = {
  ['sumneko_lua'] = 'lua'
}

require 'mason-lspconfig'.setup {
  ensure_installed       = servers,
  automatic_installation = true
}

local lspconfig = require 'lspconfig'
local common    = require 'lsp.common'
-- for _, server in pairs(servers) do
--   if customized_servers[server] then
--     require( 'lsp.' .. server )
--     -- vim.pretty_print(server)
--   else
--     lspconfig[server].setup {
--       on_attach = common.on_attach
--       , capabilities = common.capabilities
--       , flags = common.flags
--     }
--   end
-- end

-- local server_settings = require 'lsp.servers'
local server_options = require 'lsp.server.options'
local common_options =
  { on_attach    = common.on_attach
  , capabilities = common.capabilities
  , flags        = common.flags
}

require 'mason-lspconfig'.setup_handlers {
  function( server_name )
    local opts = vim.tbl_deep_extend( "force",
      {},
      common_options,
      server_options[server_name] or {}
    )

    lspconfig[server_name].setup(opts)
  end
}
