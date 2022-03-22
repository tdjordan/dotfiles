local lsp_installer = require 'nvim-lsp-installer'
local common = require 'lsp.common'

local servers =
  { 'ansiblels'
  -- , 'awk_ls'
  , 'bashls'
  , 'clangd'
  , 'cmake'
  , 'cssls'
  , 'cucumber_language_server'
  -- , 'denols'
  , 'dhall_lsp_server'
  , 'dockerls'
  , 'dotls'
  -- , 'efm'
  , 'elmls'
  , 'emmet_ls'
  , 'eslint'
  , 'flux_lsp'
  -- , 'fortls'
  , 'gopls'
  , 'graphql'
  , 'groovyls'
  , 'html'
  , 'jdtls'
  , 'jsonls'
  , 'jsonnet_ls'
  , 'kotlin_language_server'
  , 'lemminx'
  -- , 'mint'
  -- , 'omnisharp'
  -- , 'powershell_es'
  , 'pyright'
  , 'rnix'
  , 'rust_analyzer'
  , 'salt_ls'
  , 'sorbet'
  -- , 'spectral'
  , 'sumneko_lua'
  , 'terraformls'
  -- , 'tflint'
  , 'tsserver'
  , 'vimls'
  , 'yamlls'
  -- , 'zeta_note'
  -- , 'zk'
}

for _, name in pairs(servers) do
  local ok, server = lsp_installer.get_server(name)
  if ok then
    if not server:is_installed() then
      print('Intalling ' .. name)
      server:install()
    end
  else
    print('Unknown LSP : ' .. name)
  end
end

local customized_servers = {
  ['yamlls'] = 'yaml',
  ['sumneko_lua'] = 'lua',
  ['jsonls'] = 'json',
  ['kotlin_language_server'] = 'kotlin'
  -- ['rust_analyzer'] = 'rust_analyzer',
}

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = common.on_attach
    , capabilities = common.capabilities
    , flags = common.flags
  }

  if customized_servers[server.name] then
    opts = require( 'lsp.' .. server.name )
  end

  if server.name == 'rust_analyzer' then
    require 'rust-tools'.setup {
      server = vim.tbl_deep_extend( 'force', server:get_default_options(), opts )
    }
    server:attach_buffers()
    return
  end

  -- if server.name == 'eslint' then
  --   opts.on_attach = function(client, bufnr)
  --     client.resolved_capabilities.document_formatting = true
  --     require 'lsp.common'.on_attach(client, bufnr)
  --   end
  --   opts.settings = {
  --     format = {
  --       enable = true
  --     }
  --   }
  -- end

  server:setup(opts)
  -- vim.cmd [[ do User LspAttachBuffers ]]
end)
