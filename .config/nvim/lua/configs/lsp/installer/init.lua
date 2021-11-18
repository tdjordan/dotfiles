local lsp_installer = require 'nvim-lsp-installer'

local servers =
  { 'ansiblels'
  , 'bashls'
  , 'clangd'
  , 'cmake'
  , 'denols'
  , 'dockerls'
  , 'dotls'
  -- , 'efm'
  , 'elmls'
  , 'emmet_ls'
  , 'eslint'
  -- , 'fortls'
  , 'gopls'
  , 'graphql'
  , 'jsonls'
  , 'kotlin_language_server'
  , 'lemminx'
  -- , 'mint'
  -- , 'powershell_es'
  , 'pyright'
  , 'rust_analyzer'
  , 'sumneko_lua'
  , 'terraformls'
  -- , 'tflint'
  , 'tsserver'
  , 'vimls'
  , 'yamlls'
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

lsp_installer.on_server_ready(function(server)
  local opts = {}

  if server.name == 'yamls' then
    opts = require 'lsp.yaml'
  end

  if server.name == 'sumneko_lua' then
    opts = require 'lsp.lua'
  end

  if server.name == 'jsonls' then
    opts = require 'lsp.json'
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
  vim.cmd [[ do User LspAttachBuffers ]]
end)
