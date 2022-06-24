local lsp = vim.lsp

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '[d',        vim .diagnostic.goto_prev,  opts)
vim.keymap.set('n', ']d',        vim .diagnostic.goto_next,  opts)
vim.keymap.set('n', '<space>le', vim .diagnostic.open_float, opts)
vim.keymap.set('n', '<space>q',  vim .diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function( _, bufnr )
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option( bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc' )

  -- Mappings.
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', 'gD',        vim .lsp.buf.declaration,             bufopts)
  vim.keymap.set('n', 'gd',        vim .lsp.buf.definition,              bufopts)
  vim.keymap.set('n', 'K',         vim .lsp.buf.hover,                   bufopts)
  vim.keymap.set('n', 'gi',        vim .lsp.buf.implementation,          bufopts)
  vim.keymap.set('n', '<space>k',  vim .lsp.buf.hover,                   bufopts)
  vim.keymap.set('n', '<space>h',  vim .lsp.buf.signature_help,          bufopts)
  -- vim.keymap.set('n', '<C-k>',     vim .lsp.buf.signature_help,          bufopts)
  vim.keymap.set('n', '<space>wa', vim .lsp.buf.add_workspace_folder,    bufopts)
  vim.keymap.set('n', '<space>wr', vim .lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()print(vim .inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
  vim.keymap.set('n', '<space>D',  vim .lsp.buf.type_definition,         bufopts)
  vim.keymap.set('n', '<space>rn', vim .lsp.buf.rename,                  bufopts)
  vim.keymap.set('n', '<space>ca', vim .lsp.buf.code_action,             bufopts)
  vim.keymap.set('n', 'gr',        vim .lsp.buf.references,              bufopts)
  vim.keymap.set('n', '<space>F',  vim .lsp.buf.formatting,              bufopts)
  -- vim.keymap.set('n', '<space>f',  vim .lsp.buf.formatting,              bufopts)
  -- vim.keymap.set('n', '<space>ca', vim .lsp.buf.range_code_action,       bufopts)
end

local common_capabilities = function()
  local capabilities = lsp.protocol.make_client_capabilities()

  local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
  if ok then
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
  end

  capabilities.textDocument.completion.completionItem.documentFormating = {
    'markdown'
    , 'plaintext'
  }
  capabilities.textDocument.completion.completionItem.snippetSupport          = true
  capabilities.textDocument.completion.completionItem.preselectSupport        = true
  capabilities.textDocument.completion.completionItem.insertReplaceSupport    = true
  capabilities.textDocument.completion.completionItem.labelDetailsSupport     = true
  capabilities.textDocument.completion.completionItem.deprecatedSupport       = true
  capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    }
  }

  return capabilities
end

local flags = {
  debounce_text_changes = 150
}

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 150,
--     }
--   }
-- end

-- return M

return {
  capabilities = common_capabilities()
  , on_attach = on_attach
  , flags = flags
}
