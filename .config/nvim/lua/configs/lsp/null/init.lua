-- local common = require 'lsp.common'
local nls = require 'null-ls'

local sources = {
  ---  bash
  nls.builtins.diagnostics.shellcheck.with {
    diagnostics_format = '[#{c}] #{m}'
  }
  , nls.builtins.code_actions.shellcheck
  , nls.builtins.formatting.shfmt
  , nls.builtins.formatting.shellharden
  ---  zsh
  , nls.builtins.diagnostics.zsh
  ---  terraform
  , nls.builtins.formatting.terraform_fmt
  ---  c++
  , nls.builtins.formatting.cmake_format
  , nls.builtins.formatting.clang_format
  ---  makefiles
  , nls.builtins.diagnostics.checkmake
  ---  python
  , nls.builtins.formatting.black
  ---  docker
  , nls.builtins.diagnostics.hadolint
  ---  markdown
  , nls.builtins.diagnostics.markdownlint
  ---  nix
  , nls.builtins.formatting.nixfmt
  ---  xml
  , nls.builtins.formatting.xmllint
  ---  github actions
  , nls.builtins.diagnostics.actionlint
  -- , null_ls.builtins.formatting.eslint
  -- null_ls.builtins.formatting.stylua
  -- , null_ls.builtins.formatting.pretter.with {
  --   filetypes = {
  --     'html'
  --     , 'json'
  --     , 'yaml'
  --     , 'markdown'
  --   }
  -- }
  ---  plugins
  ---
  , nls.builtins.code_actions.gitsigns
}

nls.setup {
  sources = sources
}

-- require 'lspconfig'['null-ls'].setup {
--   on_attach = common.on_attach
-- }
