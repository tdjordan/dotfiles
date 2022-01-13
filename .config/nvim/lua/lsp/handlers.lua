---  Customize the sign column icons
---
local sign_column = function()
  local signs = {
    Error = "",
    Warning = "",
    Hint = "",
    Information = ""
  }

  for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end

local setup = function()
  sign_column()

  ---  diagnostics
  ---
  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {
        prefix = "",     --        
        spacing = 3
      },
      severity_sort = true
    }
  )

  ---  hover
  ---
  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover, {
      border = 'single'
    }
  )

  ---  signature help
  ---
  vim.lsp.handlers['textDocument.signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
      border = 'single'
    }
  )

end

return {
  setup = setup
}
