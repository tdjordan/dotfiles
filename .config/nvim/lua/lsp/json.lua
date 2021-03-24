--  jsonls configuration
--
--      yarn global add vscode-json-languageserver
--
--require 'lspconfig'.jsonls.setup { }

require 'lspconfig'.jsonls.setup {
  commands = {
    format = {
      function()
        vim.lsp.range_formatting(
          {}
          , {0,0}
          , { vim.fn.line('$'), 0 }
        )
      end
    }
  }
}
