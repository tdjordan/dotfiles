-- local common = require 'lsp.common'
local nls = require 'null-ls'
local b = nls.builtins

local command_resolver = require 'null-ls.helpers.command_resolver'

local sources = {
  ---  bash
  ---
  -- b.diagnostics.shellcheck
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

  ---  kotlin
  ---
  , b.diagnostics.ktlint.with {
    -- enable the Android Kotlin Style Guide
    extra_args = { '--android' }
  }
  , b.formatting.ktlint.with {
    extra_args = { '--android' }
  }

  ---  docker
  ---
  , b.diagnostics.hadolint

  ---  markdown
  ---
  , b.diagnostics.markdownlint
  , b.formatting.markdownlint
  , b.diagnostics.proselint
  , b.code_actions.proselint

  ---  nix
  ---
  -- , b.formatting.nixfmt
  , b.diagnostics.statix
  -- , b.diagnostics.deadnix
  , b.code_actions.statix

  ---  xml
  ---
  , b.diagnostics.tidy
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
  , b.formatting.prettier.with {
    dynamic_command = function(params)
      return command_resolver.from_node_modules( params )
          or command_resolver.from_yarn_pnp( params )
          or vim.fn.executable( params.command ) == 1 and params.command
    end
    , filetypes = {
      'html'
      , 'json'
      , 'yaml'
      , 'markdown'
    }
  }

  ---  editorconfig
  ---
  , b.diagnostics.editorconfig_checker.with {
    condition = function (utils)
      return utils.root_has_file { '.editorconfig' }
    end
    , diagnostics_format = 'ed [#{c}] #{m}'
  }

  ---  git repositories
  ---
  , b.diagnostics.gitlint

  ---  refactoring code actions
  ---
  -- , b.code_actions.refactoring

  ---  dictionary
  ---
  -- , b.hover.dictionary
  , b.diagnostics.codespell
  , b.formatting.codespell

  ---  trail space
  ---
  , b.diagnostics.trail_space.with {
    disabled_filetypes =
      { 'gitcommit'
      , 'help'
      , 'man'
      , 'packer'
    }
  }

  ---  Completions
  ---
  , b.completion.luasnip
}

nls.setup {
  sources = sources
}
