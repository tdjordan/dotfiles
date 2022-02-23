-- local common = require 'lsp.common'
local nls = require 'null-ls'
local b = nls.builtins

local sources = {
  ---  bash
  ---
  b.diagnostics.shellcheck.with {
    diagnostics_format = '[#{c}] #{m}'
  }
  , b.code_actions.shellcheck
  , b.formatting.shfmt
  , b.formatting.shellharden

  ---  zsh
  ---
  , b.diagnostics.zsh

  ---  terraform
  ---
  , b.formatting.terraform_fmt
  -- , b.formatting.terrafmt        -- markdown terraform code block

  ---  c++
  ---
  , b.formatting.cmake_format
  , b.formatting.clang_format

  ---  makefiles
  ---
  -- , b.diagnostics.checkmake

  ---  python
  ---
  , b.formatting.black
  -- , b.diagnostics.pylint

  ---  ruby
  ---
  , b.diagnostics.rubocop
  , b.diagnostics.standardrb

  ---  javascript
  ---
  , b.diagnostics.standardjs

  ---  docker
  ---
  , b.diagnostics.hadolint

  ---  markdown
  ---
  , b.diagnostics.markdownlint
  , b.diagnostics.proselint

  ---  nix
  ---
  -- , b.formatting.nixfmt
  , b.diagnostics.statix
  -- , b.diagnostics.deadnix
  , b.code_actions.statix

  ---  xml
  ---
  , b.formatting.xmllint

  ---  github actions
  ---
  , b.diagnostics.actionlint.with {
    runtime_condition = function()
      local current_file = vim.api.nvim_buf_get_name(0)
      local regex = vim.regex( ".github/workflows" )
      return regex:match_str( current_file )
    end
  }

  --- lua
  ---
  , b.formatting.stylua.with {
    condition = function(utils)
      return utils.root_has_file { 'stylua.toml', '.stylua.toml' }
    end
  }
  -- , b.diagnostics.selene

  ---  text files
  ---
  -- , b.diagnostics.textlint
  , b.diagnostics.vale

  ---  gitsigns
  ---
  , b.code_actions.gitsigns

  ---  Protocol Buffers
  ---
  -- , b.formatting.protolint

  -- , b.formatting.eslint
  -- , b.formatting.prettier.with {
  --   filetypes = {
  --     'html'
  --     , 'json'
  --     , 'yaml'
  --     , 'markdown'
  --   }
  -- }

  ---  editorconfig
  ---
  , b.diagnostics.editorconfig_checker.with {
    condition = function (utils)
      return utils.root_has_file { '.editorconfig' }
    end
  }

  ---  git repositories
  ---
  , b.diagnostics.gitlint

  ---  refactoring code actions
  ---
  -- , b.code_actions.refactoring

  ---  dictionary
  ---
  , b.hover.dictionary

  ---  trail space
  ---
  -- , b.diagnostics.trail_space.with {
  --   disabled_filetypes = {
  --     'gitcommit'
  --   }
  -- }
}

nls.setup {
  sources = sources
}
