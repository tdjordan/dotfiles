--  jsonls configuration
--
--      yarn global add vscode-langservers-extracted
--
--require 'lspconfig'.jsonls.setup { }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.jsonls.setup {
  capabilities = capabilities,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting(
          {}
          , { 0, 0 }
          , { vim.fn.line('$'), 0 }
        )
      end
    }
  }
}
