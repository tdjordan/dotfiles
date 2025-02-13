-- local common = require 'lsp.common'
local nls = require 'null-ls'
-- nls.register(require('none-ls-shellcheck.diagnostics'))
-- nls.register(require('none-ls-shellcheck.code_actions'))

local b = nls.builtins

local command_resolver = require 'null-ls.helpers.command_resolver'

local sources = {
  ---  bash
  ---
  -- TODO: find a replacement
  -- b.diagnostics.shellcheck
  -- b.diagnostics.shellcheck.with {
  --   diagnostics_format = '[#{c}] #{m}',
  --   diagnostic_config = {
  --     underline = true,
  --     signs = true,
  --     severity_sort = true,
  --     update_in_insert = false,
  --     virtual_text = false,
  --     -- virtual_line = false
  --   }
  -- }
  -- , b.code_actions.shellcheck
  b.formatting.shfmt
  , b.formatting.shellharden
  , b.hover.printenv

  ---  zsh
  ---
  , b.diagnostics.zsh

  ---  terraform
  ---
  , b.diagnostics.tfsec
  -- , b.formatting.terraform_fmt
  -- , b.formatting.terrafmt        -- markdown terraform code block

  ---  packer ( hcl )
  ---
  , b.formatting.packer

  ---  c++
  ---
  , b.formatting.cmake_format
  , b.formatting.clang_format

  ---  cue
  ---
  , b.diagnostics.cue_fmt
  , b.formatting.cue_fmt
  , b.formatting.cueimports

  ---  makefiles
  ---
  -- , b.diagnostics.checkmake

  ---  python
  ---
  -- , b.diagnostics.ruff
  , b.formatting.black
  -- , b.diagnostics.pylint

  ---  ruby
  ---
  -- , b.diagnostics.rubocop
  -- , b.diagnostics.standardrb

  ---  javascript
  ---
  -- TODO: find a replacement
  -- , b.diagnostics.standardjs

  ---  kotlin
  ---
  , b.diagnostics.ktlint.with {
    -- enable the Android Kotlin Style Guide
    extra_args = { '--android' }
  }
  , b.formatting.ktlint.with {
    extra_args = { '--android' }
  }

  ---  groovy
  ---
  -- , b.formatting.npm_groovy_lint

  ---  docker
  ---
  -- , b.diagnostics.hadolint

  ---  markdown
  ---
  -- , b.diagnostics.markdownlint
  , b.formatting.markdownlint
  , b.diagnostics.proselint.with {
    diagnostics_format = '(#{s}) #{m}'
  }
  , b.code_actions.proselint.with {
    diagnostics_format = '(#{s}) #{m}'
  }
  -- , b.formatting.markdown_toc

  ---  nix
  ---
  , b.formatting.nixfmt
  -- , b.diagnostics.statix
  -- , b.diagnostics.deadnix
  -- , b.code_actions.statix
  -- https://github.com/kamadorueda/alejandra
  -- , b.formatting.alejandra

  ---  xml
  ---
  , b.diagnostics.tidy
  -- TODO: find a replacement
  -- , b.formatting.xmllint

  ---  github actions
  ---
  -- , b.diagnostics.actionlint

  ---  lua
  ---
  -- , b.formatting.stylua.with {
  --   condition = function(utils)
  --     return utils.root_has_file { 'stylua.toml', '.stylua.toml' }
  --   end
  -- }
  , b.diagnostics.selene
  -- , b.formatting.lua_format

  ---  haskell
  ---
  -- TODO: find a replacement
  -- , b.formatting.stylish_haskell

  ---  text files
  ---
  -- , b.diagnostics.textlint
  -- , b.diagnostics.vale.with {
  --   diagnostics_format = '(#{s}) #{m}'
  -- }

  ---  gitsigns
  ---
  , b.code_actions.gitsigns

  ---  json files
  ---
  -- , b.formatting.jq

  ---  Protocol Buffers
  ---
  , b.diagnostics.protolint.with {
    diagnostics_format = '(#{s}) #{m}'
  }
  , b.formatting.protolint

  -- , b.formatting.eslint
  -- , b.formatting.prettierd.with {
  --   filetypes = {
  --     'html'
  --     , 'json'
  --     , 'yaml'
  --     , 'markdown'
  --   }
  -- }
  , b.formatting.prettier.with {
    dynamic_command = function(params)
      return command_resolver.from_node_modules( params )
          or command_resolver.from_yarn_pnp( params )
          or vim.fn.executable( params.command ) == 1 and params.command
    end
    , filetypes = {
      'html'
      , 'json'
      -- , 'yaml'
      , 'markdown'
    }
  }

  ---  yaml files
  ---
  -- , b.formatting.yamlfmt

  ---  generic formatting
  ---
  -- TODO: find a replacement
  -- , b.formatting.dprint

  ---  editorconfig
  ---
  -- , b.diagnostics.editorconfig_checker.with {
  --   condition = function (utils)
  --     return utils.root_has_file { '.editorconfig' }
  --   end
  --   , diagnostics_format = 'ed [#{c}] #{m}'
  -- }

  ---  git repositories
  ---
  , b.diagnostics.gitlint

  ---  refactoring code actions
  ---
  -- , b.code_actions.refactoring

  ---  dictionary
  ---
  , b.hover.dictionary
  -- , b.diagnostics.codespell.with {
  --   diagnostics_format = '(#{s}) #{m}'
  -- }
  -- , b.diagnostics.codespell.with {
  --   filetypes = {
  --     '!Brewfile'
  --   }
  -- }
  -- , b.diagnostics.codespell
  , b.formatting.codespell
  -- TODO: find a replacement
  -- , b.diagnostics.misspell

  ---  trail space
  ---
  , b.diagnostics.trail_space.with {
    disabled_filetypes =
      { 'gitcommit'
      , 'help'
      , 'man'
      , 'packer'
      , 'NvimTree'
      , 'Trouble'
      , 'trouble'
      , 'lazy'
    }
  }

  ---  Completions
  ---
  , b.completion.luasnip

  ---  Cloud Formation
  ---
  -- , b.diagnostics.cfn_lint

  ---  open policy agent
  ---
  , b.diagnostics.opacheck
  , b.formatting.rego

  ---  OpenAPI
  ---
  -- , b.diagnostics.vacuum

  ---  Changelog
  ---
  -- , b.formatting.ocdc

  ---  justfile
  ---
  , b.formatting.just

  ---  commit messages
  ---
  , b.diagnostics.commitlint

  ---  .env files
  ---
  -- , b.diagnostics.dotenv_linter
}

nls.setup {
  sources = sources
  , debug = true
}


---  null-ls utils
---
-- local null = {
--   'misspell'
-- }

require 'mason-null-ls'.setup {
  -- ensured_installed      = null,
  automatic_installation = true,
  automatic_setup        = false,
}
