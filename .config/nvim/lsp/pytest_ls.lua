---@type vim.lsp.Config
return {
  cmd = { 'pytest-language-server' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'pytest.ini', '.git', '.pytest.ini', 'tox.ini' },
  settings = {},
  capabilities = (function()
    local ok, blink = pcall(require, 'blink.cmp')
    return ok and blink.get_lsp_capabilities({}, true) or {}
  end)(),
}
