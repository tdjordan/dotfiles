--  jsonls configuration
--
--      yarn global add vscode-langservers-extracted
--
--require 'lspconfig'.jsonls.setup { }

require 'lspconfig'.jsonls.setup {
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
