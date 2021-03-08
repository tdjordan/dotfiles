local lspconfigs = require 'lspconfig'
local util       = require 'lspconfig/util'

local on_attach = function(_, bufnr)
  --require 'diagnostic'.on_attach()
  --vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua.lsp.buf.hover()<CR>', { noremap = true },
  require 'completion'.on_attach()
end

--  simpleton configs ( no specializations )
--
local servers = {
  --  lsp configs /w notes on how to install
  --
  'vimls'             -- yarn global add vim-language-server
  --, 'sumneko_lua'     -- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
                      -- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/sumneko_lua.lua#L38
  --, 'groovyls'        -- https://github.com/prominic/groovy-language-server
  , 'dockerls'        -- npm install -g dockerfile-language-server-nodejs
  , 'bashls'          -- yarn global add bash-language-server  or  npm install -g bash-language-server
  , 'jsonls'          -- yarn global add vscode-json-languageserver
  , 'terraformls'     -- brew install hashicorp/tap/terraform-ls
  , 'yamlls'          -- yarn global add yaml-language-server
  --, 'solargraph'      -- gem install solargraph
  , 'sorbet'          -- gem install sorbet
  , 'rust_analyzer'   -- brew install rust-analyzer

--  lsp configs with installers
--
  --, 'jdtls'
  --, 'sqlls'
  , 'tsserver'
  --, 'diagnosticls'
  --, 'angularls'
  , 'elmls'
--  lsp configs needing installers
--
  , 'cmake'
  , 'rls'
  , 'gopls'
  , 'clangd'
  , 'jedi_language_server'
  , 'pyright'
}

--  just attach completions to simple list
for _, lsp in ipairs(servers) do
  lspconfigs[lsp].setup {
    on_attach = on_attach,
  }
end

--  sumnelo_lua configuration
--
local system_type
if       vim.fn.has("mac")   == 1 then system_type = 'macOS'
  elseif vim.fn.has("unix")  == 1 then system_type = 'Linux'
  elseif vim.fn.has("win32") == 1 then system_type = 'Windows'
end

local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary    = sumneko_root_path..'/bin/'..system_type ..'/lua-language-server'

require 'lspconfig'.sumneko_lua.setup {
  on_attach = on_attach,
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
    },
  },
}

--  groovyls configuration
--
--local groovyls_root_path = vim.fn.stdpath('cache')..'/lspconfig/groovyls/groovy-lanaguage-server'
--local groovyls_binary    = groovyls_root_path..'/build/libs/groovy_language_server_all.jar'
--require 'lspconfig'.groovyls.setup {
  --on_attach = on_attach,
  --cmd = { 'java', '-jar', groovyls_binary },
  --filetypes = { 'groovy', 'gradle' }
--}

--  sorbet configuration
--
--local groovyls_root_path = vim.fn.stdpath('cache')..'/lspconfig/groovyls/groovy-lanaguage-server'
--local groovyls_binary    = groovyls_root_path..'/build/libs/groovy_language_server_all.jar'
--require 'lspconfig'.sorbet.setup {
  --on_attach = on_attach,
  ----root_dir = util.root_pattern('Gemfile', '.git')
  --filetypes = { 'ruby' },
  --root_dir = function(fname)
    ----return util.root_pattern("Gemfile", ".git") or fname
    ----return util.find_git_ancestor(fname)
    --util.search_ancestors(fname, function(path)
      --if util.path.is_dir(util.path.join(path, "Gemfile")) then
        --return path
      --end
    --end)
  --end
--}


