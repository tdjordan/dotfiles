require 'lsp.handlers'.setup()

local lsp_installer = require 'nvim-lsp-installer'

local servers =
  { 'ansiblels'
  -- , 'apex_ls'
  -- , 'awk_ls'
  -- , 'bashls'
  , 'clangd'
  , 'cmake'
  , 'cssls'
  -- , 'cucumber_language_server'
  -- , 'denols'
  -- , 'dhall_lsp_server'
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
  -- , 'gradle_ls'
  , 'groovyls'
  , 'html'
  , 'jdtls'
  , 'jsonls'
  , 'jsonnet_ls'
  , 'julials'
  , 'kotlin_language_server'
  , 'lemminx'
  , 'marksman'
  -- , 'mint'
  -- , 'nil_ls'
  -- , 'omnisharp'
  -- , 'powershell_es'
  , 'prosemd_lsp'
  , 'pyright'
  , 'rnix'
  , 'rust_analyzer'
  -- , 'salt_ls'
  -- , 'sorbet'
  -- , 'sourcery'
  , 'sumneko_lua'
  , 'terraformls'
  , 'tflint'
  , 'tsserver'
  , 'vimls'
  , 'visualforce_ls'
  , 'yamlls'
  -- , 'zls'
}

-- for _, name in pairs(servers) do
--   local ok, server = lsp_installer.get_server(name)
--   if ok then
--     if not server:is_installed() then
--       print('Intalling ' .. name)
--       server:install()
--     end
--   else
--     print('Unknown LSP : ' .. name)
--   end
-- end

local customized_servers = {
  ['gradle_ls'] = 'gradle',
  ['yamlls'] = 'yaml',
  ['sumneko_lua'] = 'lua',
  ['jsonls'] = 'json',
  ['kotlin_language_server'] = 'kotlin',
  -- ['cucumber_language_server'] = 'cucumber',
  -- ['rust_analyzer'] = 'rust_analyzer',
}

-- lsp_installer.on_server_ready(function(server)
--   local opts = {
--     on_attach = common.on_attach
--     , capabilities = common.capabilities
--     , flags = common.flags
--   }
--
--   if customized_servers[server.name] then
--     opts = require( 'lsp.' .. server.name )
--   end
--
--   if server.name == 'rust_analyzer' then
--     require 'rust-tools'.setup {
--       server = vim.tbl_deep_extend( 'force', server:get_default_options(), opts )
--     }
--     server:attach_buffers()
--     return
--   end
--
--   -- if server.name == 'eslint' then
--   --   opts.on_attach = function(client, bufnr)
--   --     client.resolved_capabilities.document_formatting = true
--   --     require 'lsp.common'.on_attach(client, bufnr)
--   --   end
--   --   opts.settings = {
--   --     format = {
--   --       enable = true
--   --     }
--   --   }
--   -- end
--
--   server:setup(opts)
--   -- vim.cmd [[ do User LspAttachBuffers ]]
-- end)

lsp_installer.setup {
  -- ensure_installed = servers,     -- ensure these servers are always installed

  ---  automatic_installation
  ---
  ---    false: no automatic installation
  ---    true: all servers setup via lspconfig are automatically installed
  ---    { exclude: string[]  }: all servers except the ones listed are installed
  -- automatic_installation = true   -- automatically detect which servers to install ( via lspconfig )
}

local lspconfig = require 'lspconfig'
local common = require 'lsp.common'
for _, server in pairs(servers) do
  if customized_servers[server] then
    require( 'lsp.' .. server )
    -- vim.pretty_print(server)
  else
    lspconfig[server].setup {
      on_attach = common.on_attach
      , capabilities = common.capabilities
      , flags = common.flags
    }
  end
end

local api = vim.api
local go = vim.go
vim.keymap.set( 'n', 'gm', function()
  local old_func = go.operatorfunc
  _G.op_func_formatting = function()
    local start  = api.nvim_buf_get_mark( 0, '[' )
    local finish = api.nvim_buf_get_mark( 0, ']' )
    vim.lsp.buf.range_formatting( {}, start, finish )
    go.operatorfunc = old_func
    _G.op_func_formatting = nil
  end
end, { noremap = true })

local configs = require 'lspconfig.configs'
local util    = require 'lspconfig.util'

if not configs.dagger then
  configs.dagger = {
    default_config = {
      cmd = { 'dagger', 'cuelsp' },
      filetypes = { 'cue' },
      root_dir = function(fname)
        return util.root_pattern( 'cue.mod', '.git' )( fname )
      end,
      single_file_support = true,
      settings = {}
    },
  }
end
lspconfig.dagger.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
}
