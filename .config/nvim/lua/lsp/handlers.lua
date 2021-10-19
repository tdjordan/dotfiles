---  Customize the sign column icons
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

local handle_diagnostics = function()
  local config = {
    virtual_text = {
      prefix = "",
      spacing = 0
    }
  }

  vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, ctx, _)
    local uri = result.uri
    local bufnr = vim.uri_to_bufnr(uri)
    if not bufnr then
      return
    end

    local diagnostics = result.diagnostics
    vim.lsp.diagnostic.save(diagnostics, bufnr, ctx.client_id)
    if not vim.api.nvim_buf_is_loaded(bufnr) then
      return
    end
    vim.lsp.diagnostic.display(diagnostics, bufnr, ctx.client_id, config)
  end
end

local setup = function()
  sign_column()
  handle_diagnostics()
end

return {
  setup = setup
}
