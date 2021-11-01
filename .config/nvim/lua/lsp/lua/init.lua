local common = require 'lsp.common'

--  sumnelo_lua configuration
--
--      https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
--
-- local system_type
-- if       vim.fn.has("mac")   == 1 then system_type = 'macOS'
--   elseif vim.fn.has("unix")  == 1 then system_type = 'Linux'
--   elseif vim.fn.has("win32") == 1 then system_type = 'Windows'
-- end

-- local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
-- local sumneko_binary    = sumneko_root_path..'/bin/'..system_type ..'/lua-language-server'

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
-- local capabilities = common.capabilities
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require 'cmp_nvim_lsp'.update_capabilities(capabilities)
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.preselectSupport = true
-- capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
-- capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
-- capabilities.textDocument.completion.completionItem.deprecatedSupport = true
-- capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
-- capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--   properties = {
--     'documentation',
--     'detail',
--     'additionalTextEdits',
--   }
-- }

-- The following example advertise capabilities to `clangd`.
-- require'lspconfig'.clangd.setup {
--   capabilities = capabilities,
-- }

local path_sep = vim.loop.os_uname().version:match "Windows" and "\\" or "/"

local join_paths = function(...)
  local result = table.concat({ ... }, path_sep)
  return result
end

local opts = {
-- require 'lspconfig'.sumneko_lua.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
  -- , cmd = {sumneko_binary, "-E", sumneko_root_path .. '/main.lua'}
  , settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        -- path = vim.split(package.path, ';'),
      },
      diagnostics = {
        enable = true,
        -- Get the language server to recognize the `vim` global
        globals =
          { 'vim'
          , 'hs'
          , 'spoon'
          , 'packer_plugins'
          , 'lvim'
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [join_paths(vim.fn.stdpath('data'), 'nvim', 'lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      telemetry = {
        enable = false
      },
    },
  },
}

return opts
