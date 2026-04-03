return {
  ---  Language Protocol Server - LSP
  ---
  -- {
  --   'ray-x/lsp_signature.nvim'
  --   , enabled = false
  --   , event = 'InsertEnter'
  --   , keys = {
  --     {
  --       '\\k', function()
  --         require 'lsp_signature'.toggle_float_win()
  --       end,
  --       desc = 'toggle signature'
  --     }
  --   }
  --   , opts = {
  --     bind = true,
  --     handler_opts = {
  --       border = 'rounded',
  --       hint_inline = 'right_aligned'
  --     }
  --   }
  -- },
  -- {
  --   'stevearc/conform.nvim'
  --   , event = { 'BufWritePre' }
  --   , cmd = {
  --     'ConformInfo'
  --   }
  --   , keys = {
  --     {
  --       '<leader>ln', function()
  --         require 'conform'.format({ async = true })
  --       end,
  --       mode = '',
  --       desc = 'format buffer'
  --     }
  --   }
  --   -- This will provide type hinting with LuaLS
  --   ---@module "conform"
  --   ---@type conform.setupOpts
  --   , opts =  {
  --     formatters_by_ft = {
  --       nix = { 'alejandra' },
  --       -- lua = { 'stylua' },
  --       terraform = { 'terraform_fmt' },
  --       -- sh = { 'shf,mt' },
  --       ['*'] = { 'codespell' },
  --       -- ['_'] = { 'trim_whitespace' },
  --     },
  --     default_format_opts = {
  --       lsp_format = 'fallback'
  --     }
  --   }
  -- },
  {
    'cenk1cenk2/schema-companion.nvim'
    , enabled = true
    , ft = { 'yaml' }
    , dependencies = {
      'nvim-lua/plenary.nvim'
    }
    -- , opts = {
    --   enable_telescope = true,
    --   matchers = {
    --     require 'schema-companion.matchers.kubernetes'.setup { version = 'master' }
    --   }
    -- }
    , config = true
    -- , config = function()
    --   require 'schema-companion'.setup {
    --     -- log_level = vim.log.log_levels.INFO
    --   --   enable_telescope = true,
    --   --   matchers = {
    --   --     require 'schema-companion.matchers.kubernetes'.setup { version = 'master' }
    --   --   },
    --   --   -- schemas = {
    --   --   --   {
    --   --   --     name = "Kubernetes master",
    --   --   --     uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone-strict/all.json",
    --   --   --   },
    --   --   -- }
    --   }
    -- end
  },
  -- {
  --   'someone-stole-my-name/yaml-companion.nvim'
  --   , enabled = true
  --   , ft = {
  --     'yaml',
  --     'json'
  --   }
  --   , opts = {
  --     builtin_matchers = {
  --       kubernetes = { enabled = true }
  --     },
  --     -- schemas = {
  --     --   {
  --     --     name = "Flux GitRepository",
  --     --     uri = "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/gitrepository-source-v1.json",
  --     --   }
  --     -- }
  --   }
  --   , config = function(_, opts)
  --     local cfg = require 'yaml-companion'.setup(opts)
  --     require 'lspconfig'['yamlls'].setup(cfg)
  --     require 'telescope'.load_extension('yaml_schema')
  --   end
  -- },
  -- {
  --   'msvechla/yaml-companion.nvim'
  --   , enabled = true
  --   , branch = "kubernetes_crd_detection"
  --   -- , ft = {
  --   --   'yaml',
  --   --   'json'
  --   -- }
  --   , opts = {
  --     builtin_matchers = {
  --       kubernetes = { enabled = true },
  --       cloud_init = { enabled = true },
  --       -- kubernetes_crd = { enabled = true }
  --     },
  --     -- schemas = {
  --     --   {
  --     --     name = "Flux GitRepository",
  --     --     uri = "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/gitrepository-source-v1.json",
  --     --   }
  --     -- }
  --   }
  --   , config = function(_, opts)
  --     local cfg = require 'yaml-companion'.setup(opts)
  --     require 'lspconfig'['yamlls'].setup(cfg)
  --     require 'telescope'.load_extension('yaml_schema')
  --   end
  -- },
  {
    'whoissethdaniel/mason-tool-installer.nvim'
    , opts = {
      ensure_installed = {
        -- 'erg'
        'golangci-lint-langserver',
        'vale-ls',
        -- 'bacon',
      }
    }
  },
  {
    'neovim/nvim-lspconfig'
    , event = { 'BufReadPre', 'BufWritePost', 'BufNewFile' }
    , dependencies = {
      {
        'mason-org/mason.nvim'
        , build = ':MasonUpdate'
        , opts = {}
        -- , config = true
        -- , config = function()
        --   -- require 'mason'.setup()
        --   require 'configs.lsp.mason'
        -- end
      },
      {
        'mason-org/mason-lspconfig.nvim'
        -- , enabled = false
        , opts = {
          ensure_installed = {
            'ansiblels'                         -- Ansible
            -- , 'ansible-lint'                    -- TODO Linters
            -- , 'ast_grep'                        -- Linter & Formatter based on AST
            -- , 'awk_ls'                          -- AWK
            -- , 'bacon_ls'                        -- Rust
            , 'bashls'                          -- bash
            , 'clangd'                          -- C++
            , 'cmake'                           -- CMake
            , 'neocmake'                        -- CMake
            , 'copilot'                         -- Copilot
            , 'cucumber_language_server'        -- Cucumber
            -- , 'cue'                             -- Cue
            , 'dagger'                          -- Cue
            , 'dockerls'                        -- Docker
            , 'docker_compose_language_service' -- Docker Compose
            , 'dotls'                           -- Dot
            , 'elmls'                           -- Elm
            -- , 'erg_language_server'             -- Erg
            , 'gh_actions_ls'                   -- yaml ( github actions )
            , 'gitlab_ci_ls'                    -- yaml.gitlab
            -- , 'gleam'                           -- Gleam
            , 'gopls'                           -- go
            -- , 'golangci_lint_langserver'        -- go
            , 'graphql'                         -- GraphQL
            , 'gradle_ls'                       -- gradle
            , 'groovyls'                        -- groovy
            , 'helm_ls'                         -- helm
            -- , 'hls'                          -- Haskell
            -- , 'jdtls'                        -- Java
            , 'jqls'                            -- jq-lsp
            , 'jsonls'                          -- json
            , 'jsonnet_ls'                      -- jsonnet
            , 'julials'                         -- Julia
            , 'just'                            -- just
            -- , 'kcl'                             -- KCL
            , 'kotlin_language_server'          -- Kotlin
            , 'lemminx'                         -- XML
            , 'lua_ls'                          -- lua
            , 'marksman'                        -- Markdown
            -- , 'nginx_language_server'        -- Nginx
            -- , 'nil_ls'                       -- Nix
            -- , 'nomad_lsp'                    -- Nomad
            , 'oxlint'                          -- javascript / typescript
            , 'pbls'                            -- Protocol Buffers
            -- , 'pylyzer'                         -- Python
            -- , 'pyright'                         -- Python
            , 'raku_navigator'                  -- Raku
            , 'rnix'                            -- Nix
            , 'ruff'                            -- Python
            -- , 'ruff_lsp'                        -- Python
            , 'rust_analyzer'                   -- Rust
            -- , 'salt_ls'                         -- Salt
            , 'taplo'                           -- Toml
            , 'terraformls'                     -- terraform
            , 'textlsp'                         -- textLSP
            , 'tflint'                          -- terraform
            , 'ts_ls'                           -- typescript
            , 'ty'                              -- Python
            , 'typos_lsp'                       -- typos
            -- , 'vale_ls'                         -- vale
            , 'vimls'                           -- Vim
            -- , 'visualforce_ls'               -- sfdx
            -- , 'vtsls'                        -- typescript
            , 'yamlls'                          -- yaml
            -- , 'zls'                          -- Zig
          }
          , automatic_enable = true
        }
        -- , config = true
        -- , config = function()
        --   require 'lsp.handlers'.setup()
        -- end
      },
      {
        'b0o/schemastore.nvim'
        , version = false
      },
      {
        'jay-babu/mason-null-ls.nvim'
      },
      {
        'nvimtools/none-ls.nvim'
        , config = function()
          require 'configs.lsp.null'
          require 'lsp.handlers'.setup()
        end
      }

    }
  },
  {
    'dgagn/diagflow.nvim'
    , event = 'LspAttach'
    , opts = {
      scope = 'line'
    }
  },
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
    , enabled = false
    , event = 'LspAttach'
    , keys = {
      { '<leader>tdi',
        function()
          if vim.b.lsp_lines_temp_disabled then
            vim.diagnostic.config({
              virtual_lines = vim.b.lsp_lines_temp_old_value
            })
          else
            ---@diagnostic disable-next-line: undefined-field
            vim.b.lsp_lines_temp_old_value = vim.diagnostic.config().virtual_lines
            ---@diagnostic disable-next-line: undefined-field
            require 'lsp_lines'.toggle()
          end
          vim.b.lsp_lines_temp_disabled = not vim.b.lsp_lines_temp_disabled
        end
      }
    }
    -- , keys = {
    --   { '<leader>tdi',
    --     function()
    --       ---@diagnostic disable-next-line: undefined-field
    --       local next = not vim.diagnostic.config().virtual_lines
    --       vim.diagnostic.config {
    --         virtual_text = not next,
    --         virtual_lines = next
    --       }
    --     end, desc = 'toggle lsp_lines'
    --   },
    --   { '<leader>tdo',
    --     function()
    --       vim.diagnostic.config {
    --         virtual_text = false,
    --         virtual_lines = false
    --       }
    --     end, desc = 'virtual diagnostics off'
    --   },
    -- }
    , config = function()
      vim.diagnostic.config {
        virtual_lines = {
          only_current_line = true
        }
      }
      require 'lsp_lines'.setup()

      local autocmd = vim.api.nvim_create_autocmd
      local augroup = vim.api.nvim_create_augroup(
        'lazy-buf-lsp-line-handlers',
        { clear = true }
      )

      autocmd( 'FileType', {
        pattern = 'lazy'
        , desc = 'disable plugin when opening `lazy` UI'
        , callback = function()
          ---@diagnostic disable-next-line: undefined-field
          if not vim.diagnostic.config().virtual_lines then return end
          ---@diagnostic disable-next-line: undefined-field
          vim.b.lsp_lines_temp_disabled_for_lazy_ft_value = vim.diagnostic.config().virtual_lines
          require 'lsp_lines'.toggle()
          vim.b.lsp_lines_temp_disabled_for_lazy_ft = true
        end
        , group = augroup
      })

      autocmd( 'BufLeave', {
        -- pattern = '*'
        desc = 'enable plugin when closing `lazy` UI'
        , callback = function()
          if vim.bo.filetype == 'lazy' and vim.b.lsp_lines_temp_disabled_for_lazy_ft then
            require 'lsp_lines'.toggle()
            vim.diagnostic.config {
              virtual_lines = vim.b.lsp_lines_temp_disabled_for_lazy_ft_value
            }
          end
        end
        , group = augroup
      })
    end
  },
  {
    'hedyhli/outline.nvim'
    , cmd = {
      'Outline',
      'OutlineOpen'
    }
    , keys = {
      { '<leader>to', '<cmd>Outline<cr>', desc = 'toggle outline' },
    }
    , dependencies = {
      'msr1k/outline-asciidoc-provider.nvim'
    }
    , opts = {
      providers = {
        priority = {
          'lsp',
          'coc',
          'markdown',
          'norg',
          'asciidoc'
        }
      }
    }

  },
  -- {
  --   'simrat39/symbols-outline.nvim'
  --   , cmd = {
  --     'SymbolsOutline',
  --     'SymbolsOutlineOpen'
  --   }
  --   , opts = {
  --     highlight_hovered_item = true,
  --     show_guides = true,
  --     auto_preview = false,
  --     position = 'right',
  --     relative_width = true,
  --     width = 25,
  --     auto_close = false,
  --     show_numbers = false,
  --     show_relative_numbers = false,
  --     show_symbol_details = true,
  --     preview_bg_highlight = 'Pmenu',
  --     autofold_depth = nil,
  --     auto_unfold_hover = true,
  --     fold_markers = { '', '' },
  --     wrap = false,
  --     keymaps = { -- These keymaps can be a string or a table for multiple keys
  --       close = { "<Esc>", 'q' },
  --       goto_location = "<cr>",
  --       focus_location = 'o',
  --       hover_symbol = "<c-space>",
  --       toggle_preview = 'K',
  --       rename_symbol = 'r',
  --       code_actions = 'a',
  --       fold = 'h',
  --       unfold = 'l',
  --       fold_all = 'W',
  --       unfold_all = 'E',
  --       fold_reset = 'R'
  --     },
  --     lsp_blacklist = {},
  --     symbol_blacklist = {},
  --     symbols = {
  --       File          = { icon = "󰈔", hl = "TSURI"},
  --       Module        = { icon = "󰆧", hl = "TSNamespace"},
  --       Namespace     = { icon = "󰅪", hl = "TSNamespace"},
  --       Package       = { icon = "󰏗", hl = "TSNamespace"},
  --       Class         = { icon = "𝓒", hl = "TSType"},
  --       Method        = { icon = "ƒ", hl = "TSMethod"},
  --       Property      = { icon = "", hl = "TSMethod"},
  --       Field         = { icon = "󰆨", hl = "TSField"},
  --       Constructor   = { icon = "", hl = "TSConstructor"},
  --       Enum          = { icon = "ℰ", hl = "TSType"},
  --       Interface     = { icon = "󰜰", hl = "TSType"},
  --       Function      = { icon = "", hl = "TSFunction"},
  --       Variable      = { icon = "", hl = "TSConstant"},
  --       Constant      = { icon = "", hl = "TSConstant"},
  --       String        = { icon = "𝓐", hl = "TSString"},
  --       Number        = { icon = "#", hl = "TSNumber"},
  --       Boolean       = { icon = "⊨", hl = "TSBoolean"},
  --       Array         = { icon = "󰅪", hl = "TSConstant"},
  --       Object        = { icon = "⦿", hl = "TSType"},
  --       Key           = { icon = "🔐", hl = "TSType"},
  --       Null          = { icon = "NULL", hl = "TSType"},
  --       EnumMember    = { icon = "", hl = "TSField"},
  --       Struct        = { icon = "𝓢", hl = "TSType"},
  --       Event         = { icon = "🗲", hl = "TSType"},
  --       Operator      = { icon = "+", hl = "TSOperator"},
  --       TypeParameter = { icon = "𝙏", hl = "TSParameter"},
  --     }
  --   }
  -- }
  -- {
  --   "mhanberg/output-panel.nvim",
  --   version = "*",
  --   event = "VeryLazy",
  --   config = function()
  --     require("output_panel").setup({
  --       max_buffer_size = 5000 -- default
  --     })
  --   end,
  --   cmd = { "OutputPanel" },
  --   keys = {
  --     {
  --       "<leader>o",
  --       vim.cmd.OutputPanel,
  --       mode = "n",
  --       desc = "Toggle the output panel",
  --     },
  --   }
  -- },
}
