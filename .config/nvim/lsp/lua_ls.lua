---@type vim.lsp.Config
return {
  settings = {
    Lua = {
      -- diagnostics = {
      --   globals = {
      --     'simple'
      --   }
      -- },
      -- codeLens = {
      --   enable = true
      -- },
      hint = {
        -- enable = true,
        setType = true
        , paramType = true
        , paramName = 'Disable'
        -- , semicolon = 'Disable'
        , arrayIndex = 'Disable'
      }
    }
  }
}
