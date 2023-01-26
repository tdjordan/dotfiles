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
  -- , 'hls'                      -- Haskell
  -- , 'jdtls'                    -- Java
  -- , 'jq-lsp'                   -- jq
  , 'jsonls'                   -- json
  , 'jsonnet_ls'               -- jsonnet
  , 'julials'                  -- Julia
  , 'kotlin_language_server'   -- Kotlin
  , 'lemminx'                  -- XML
  , 'marksman'                 -- Markdown
  -- , 'nginx_language_server'    -- Nginx
  -- , 'nil_ls'                   -- Nix
  , 'pyright'                  -- Python
  , 'raku_navigator'           -- Raku
  , 'rnix'                     -- Nix
  , 'ruff_lsp'                 -- Python
  , 'rust_analyzer'            -- Rust
  , 'salt_ls'                  -- Salt
  , 'sumneko_lua'              -- lua
  , 'taplo'                    -- Toml
  , 'terraformls'              -- terraform
  , 'tflint'                   -- terraform
  , 'tsserver'                 -- typescript
  , 'vimls'                    -- Vim
  -- , 'visualforce_ls'           -- sfdx
  -- , 'vtsls'                    -- typescript
  , 'yamlls'                   -- yaml
  -- , 'zls'                      -- Zig
}

local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed       = servers,
  automatic_installation = true
}

local lspconfig = require 'lspconfig'
local common    = require 'lsp.common'

local server_options = require 'lsp.server.options'
local common_options =
  { on_attach    = common.on_attach
  , capabilities = common.capabilities
  , flags        = common.flags
}

mason_lspconfig.setup_handlers {
  function( server_name )
    local opts = vim.tbl_deep_extend( "force",
      {},
      common_options,
      server_options[server_name] or {}
    )

    -- if server_name == 'yamlls' then
    --   vim.pretty_print(opts)
    -- end

    lspconfig[server_name].setup(opts)
  end
}
