local lsp = vim.lsp
local navic = require 'nvim-navic'

local kset = function( mode, l, r, desc )
  opts        = opts or { noremap = true, silent = true }
  opts.desc   = desc
  vim.keymap.set( mode, l, r, opts )
end
kset( 'n', '[d',        vim.diagnostic.goto_prev,  'prev diagnostic'  )
kset( 'n', ']d',        vim.diagnostic.goto_next,  'next diagnostic'  )
kset( 'n', '<space>le', vim.diagnostic.open_float, 'open diagnositcs' )
kset( 'n', '<space>q',  vim.diagnostic.setloclist, 'list diagnostics' )

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function( client, bufnr )
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option( bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc' )

  -- Navic
  if client.server_capabilities.documentSymbolProvider then
    navic.attach( client, bufnr )
  end

  -- Mappings.
  local function set( mode, l, r, desc )
    opts        = opts or { noremap = true, silent = true, buffer = bufnr }
    opts.desc   = desc
    vim.keymap.set( mode, l, r, opts )
  end

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  set( 'n', 'gD',         vim.lsp.buf.declaration,             'goto declaration'        )
  set( 'n', 'gd',         vim.lsp.buf.definition,              'goto definition'         )
  set( 'n', 'gt',         vim.lsp.buf.type_definition,         'goto type definition'    )
  set( 'n', '<leader>D',  vim.lsp.buf.type_definition,         'goto type definition'    )
  set( 'n', 'gi',         vim.lsp.buf.implementation,          'goto implemenation'      )
  set( 'n', 'K',          vim.lsp.buf.hover,                   'hover'                   )
  set( 'n', '<leader>k',  vim.lsp.buf.hover,                   'hover'                   )
  set( 'n', '<leader>h',  vim.lsp.buf.signature_help,          'show signature help'     )
  -- set( 'n', '<C-k>',     vim.lsp.buf.signature_help,          'signature help'          )
  set( 'n', '<leader>wa', vim.lsp.buf.add_workspace_folder,    'add workspace folder'    )
  set( 'n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, 'remove workspace folder' )
  set( 'n', '<leader>wl', function() vim.pretty_print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'list workspace folders' )
  -- set( 'n', '<space>D',  vim.lsp.buf.type_definition,         'goto type definition'          )
  set( 'n', '<leader>rn', vim.lsp.buf.rename,                  'rename'                       )
  set( 'n', '<leader>ca', vim.lsp.buf.code_action,             'code action'                  )
  set( 'n', 'gr',         vim.lsp.buf.references,              'references'                   )
  set( 'n', '<leader>F',  vim.lsp.buf.formatting,              'formatting'                   )
  set( 'n', '<leader>lF',  function() vim.lsp.buf.format { async = true } end, 'format async' )
  -- set( 'n', '<leader>ca', vim.lsp.buf.range_code_action,       'range code action'            )
  set( 'n', '<leader>le', vim.diagnostic.open_float,           'show diagnostic'              )
end

local common_capabilities = function()
  local capabilities = require 'cmp_nvim_lsp'.default_capabilities()

  -- capabilities.textDocument.completion.completionItem.documentFormating = {
  --   'markdown'
  --   , 'plaintext'
  -- }

  -- capabilities.textDocument.foldingRange = {
  --   dynamicRegistration = false,
  --   lineFoldingOnly = true
  -- }

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
