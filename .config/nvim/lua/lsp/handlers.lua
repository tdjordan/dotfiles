---  Customize the sign column icons
---
local sign_column = function()
  local signs = {
    Error = "󰅚",
    Warn = "",
    -- Warn = "",
    Hint = "󰌶",
    Info = ""
  }

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  vim.diagnostic.config {
    underline = true,
    signs = {
      text = {
        [ vim.diagnostic.severity.ERROR ] = signs[ 'Error' ],
        [ vim.diagnostic.severity.WARN  ] = signs[ 'Warn'  ],
        [ vim.diagnostic.severity.HINT  ] = signs[ 'Hint'  ],
        [ vim.diagnostic.severity.INFO  ] = signs[ 'Info'  ],
      }
    },
    severity_sort = true,
    update_in_insert = false,
    virtual_text = false,        -- using virtual_lines instead
    -- virtual_text = true,        -- using virtual_lines instead
    -- virtual_lines = true
    -- virtual_text = {
    --   prefix = "",     --        
    --   spacing = 3,
    --   -- source = 'always'
    --   -- severity_limit = 'Warning'
    -- }
  }
end

local setup = function()
  vim.lsp.log_levels = 'OFF'
  sign_column()

  ---  diagnostics
  ---
  -- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  --   vim.lsp.diagnostic.on_publish_diagnostics, {
  --     virtual_text = {
  --       prefix = "",     --        
  --       spacing = 3
  --     },
  --   }
  -- )

  ---  hover
  ---
  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.buf.hover {
      border = 'single'
    }
  )

  ---  signature help
  ---
  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.buf.signature_help  {
      border = 'single'
    }
  )

  ---  esample : do not use signs
  ---
  -- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  --   vim.lsp.diagnostic.on_publish_diagnostics, {
  --     signs = false
  --   }
  -- )

end

return {
  setup = setup
}
