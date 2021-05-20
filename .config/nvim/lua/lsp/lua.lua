--  sumnelo_lua configuration
--
--      https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
--
local system_type
if       vim.fn.has("mac")   == 1 then system_type = 'macOS'
  elseif vim.fn.has("unix")  == 1 then system_type = 'Linux'
  elseif vim.fn.has("win32") == 1 then system_type = 'Windows'
end

local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary    = sumneko_root_path..'/bin/'..system_type ..'/lua-language-server'

require 'lspconfig'.sumneko_lua.setup {
  --on_attach = on_attach,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. '/main.lua'};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        enable = true,
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
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
