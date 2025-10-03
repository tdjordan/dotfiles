vim.g.cmp = vim.g.cmp or false
---  Auto Completion
---
return {
  {
    'onsails/lspkind-nvim'
    , opts = {
      -- DEPRECATED (use mode instead): enables text annotations
      --
      -- default: true
      -- with_text = true,

      -- defines how annotations are shown
      -- default: symbol
      -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
      mode = 'symbol_text',

      -- default symbol map
      -- can be either 'default' (requires nerd-fonts font) or
      -- 'codicons' for codicon preset (requires vscode-codicons font)
      --
      -- default: 'default'
      preset = 'codicons',

      -- override preset symbols
      --
      -- default: {}
      symbol_map = {
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = ""
      },
    }
  },
  {
    'folke/lazydev.nvim'
    , ft = 'lua'
    , opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      }
    }
  },
  {
    'saghen/blink.cmp',
    enabled = not vim.g.cmp,
    event = {
      'InsertEnter',
      'CmdlineEnter'
    },
    -- optional: provides snippets for the snippet source
    dependencies = {
      'rafamadriz/friendly-snippets',
      -- 'mikavilpas/blink-ripgrep.nvim',
      'folke/snacks.nvim'
    },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
  -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      -- keymap = { preset = 'default' },
      keymap = {
        -- ['<Tab>'] = { 'select_next', 'fallback' },
        -- ['<Tab>'] = {
        --   function( cmp )
        --     if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then return cmp.accept() end
        --   end,
        --   'show_and_insert',
        --   'select_next'
        -- },
        ['<Tab>'] = {
          function( cmp )
            -- vim.echo('hello')
            if cmp.snippet_active() then return cmp.accept()
            else return cmp.select_and_accept()
            end
          end,
          'snippet_forward',
          'fallback'
        },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
        -- ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<C-j'] = { 'select_next' },
        ['<C-k'] = { 'select_prev' },
        ['<C-p'] = { 'select_next' },
      },
      -- keymap = { preset = 'super-tab' },
      -- keymap = { preset = 'enter' },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        ghost_text = { enabled = false },
--
        -- documentation = { auto_show = false },
        documentation = { auto_show = true },
        -- ghost_text = { enabled = true }

        menu = {
          scrollbar = false,
          draw = {
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              -- { "label" },
              -- { "source_name" },
              -- { 'source_id' },
              { 'kind' },
            }
          }
        },

        list = {
          selection = {
            preselect = true,
            auto_insert = false
          }
        }
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            score_offset = 100,
          },
          -- -- 👇🏻👇🏻 add the ripgrep provider config below
          -- ripgrep = {
          --   module = "blink-ripgrep",
          --   name = "Ripgrep",
          --   -- the options below are optional, some default values are shown
          --   ---@module "blink-ripgrep"
          --   ---@type blink-ripgrep.Options
          --   opts = {
          --     -- the minimum length of the current word to start searching
          --     -- (if the word is shorter than this, the search will not start)
          --     prefix_min_len = 3,
          --
          --     -- Specifies how to find the root of the project where the ripgrep
          --     -- search will start from. Accepts the same options as the marker
          --     -- given to `:h vim.fs.root()` which offers many possibilities for
          --     -- configuration. If none can be found, defaults to Neovim's cwd.
          --     --
          --     -- Examples:
          --     -- - ".git" (default)
          --     -- - { ".git", "package.json", ".root" }
          --     project_root_marker = ".git",
          --
          --     -- When a result is found for a file whose filetype does not have a
          --     -- treesitter parser installed, fall back to regex based highlighting
          --     -- that is bundled in Neovim.
          --     fallback_to_regex_highlighting = true,
          --
          --     -- Keymaps to toggle features on/off. This can be used to alter
          --     -- the behavior of the plugin without restarting Neovim. Nothing
          --     -- is enabled by default. Requires folke/snacks.nvim.
          --     toggles = {
          --       -- The keymap to toggle the plugin on and off from blink
          --       -- completion results. Example: "<leader>tg" ("toggle grep")
          --       on_off = nil,
          --
          --       -- The keymap to toggle debug mode on/off. Example: "<leader>td" ("toggle debug")
          --       debug = nil,
          --     },
          --
          --     backend = {
          --       -- The backend to use for searching. Defaults to "ripgrep".
          --       -- Available options:
          --       -- - "ripgrep", always use ripgrep
          --       -- - "gitgrep", always use git grep
          --       -- - "gitgrep-or-ripgrep", use git grep if possible, otherwise
          --       --   use ripgrep
          --       use = "ripgrep",
          --
          --       -- Whether to set up custom highlight-groups for the icons used
          --       -- in the completion items. Defaults to `true`, which means this
          --       -- is enabled.
          --       customize_icon_highlight = true,
          --
          --       ripgrep = {
          --         -- For many options, see `rg --help` for an exact description of
          --         -- the values that ripgrep expects.
          --
          --         -- The number of lines to show around each match in the preview
          --         -- (documentation) window. For example, 5 means to show 5 lines
          --         -- before, then the match, and another 5 lines after the match.
          --         context_size = 5,
          --
          --         -- The maximum file size of a file that ripgrep should include
          --         -- in its search. Useful when your project contains large files
          --         -- that might cause performance issues.
          --         -- Examples:
          --         -- "1024" (bytes by default), "200K", "1M", "1G", which will
          --         -- exclude files larger than that size.
          --         max_filesize = "1M",
          --
          --         -- Enable fallback to neovim cwd if project_root_marker is not
          --         -- found. Default: `true`, which means to use the cwd.
          --         project_root_fallback = true,
          --
          --         -- The casing to use for the search in a format that ripgrep
          --         -- accepts. Defaults to "--ignore-case". See `rg --help` for
          --         -- all the available options ripgrep supports, but you can try
          --         -- "--case-sensitive" or "--smart-case".
          --         search_casing = "--ignore-case",
          --
          --         -- (advanced) Any additional options you want to give to
          --         -- ripgrep. See `rg -h` for a list of all available options.
          --         -- Might be helpful in adjusting performance in specific
          --         -- situations. If you have an idea for a default, please open
          --         -- an issue!
          --         --
          --         -- Not everything will work (obviously).
          --         additional_rg_options = {},
          --
          --         -- Absolute root paths where the rg command will not be
          --         -- executed. Usually you want to exclude paths using gitignore
          --         -- files or ripgrep specific ignore files, but this can be used
          --         -- to only ignore the paths in blink-ripgrep.nvim, maintaining
          --         -- the ability to use ripgrep for those paths on the command
          --         -- line. If you need to find out where the searches are
          --         -- executed, enable `debug` and look at `:messages`.
          --         ignore_paths = {},
          --
          --         -- Any additional paths to search in, in addition to the
          --         -- project root. This can be useful if you want to include
          --         -- dictionary files (/usr/share/dict/words), framework
          --         -- documentation, or any other reference material that is not
          --         -- available within the project root.
          --         additional_paths = {},
          --       },
          --     },
          --
          --     -- Show debug information in `:messages` that can help in
          --     -- diagnosing issues with the plugin.
          --     debug = false,
          --   },
          --   -- (optional) customize how the results are displayed. Many options
          --   -- are available - make sure your lua LSP is set up so you get
          --   -- autocompletion help
          --   transform_items = function(_, items)
          --     for _, item in ipairs(items) do
          --       -- example: append a description to easily distinguish rg results
          --       item.labelDetails = {
          --         description = "(rg)",
          --       }
          --     end
          --     return items
          --   end,
          -- },
        }
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" },

      cmdline = {
        enabled = true,
        keymap = {
          preset = 'cmdline',
          ['<cr>'] = { 'accept', 'fallback' }
        },
        completion = {
          menu = { auto_show = true },
          list = {
            selection = {
              preselect = false,
              auto_insert = false
            }
          },
        }
      }
    },
    opts_extend = { "sources.default" }
  },
  {
    'hrsh7th/nvim-cmp'
    -- , event = 'CursorHold'
    , enabled = vim.g.cmp
    , event = {
      'InsertEnter',
      'CmdlineEnter'
    }
    , dependencies = {
      'hrsh7th/cmp-nvim-lsp'
      , 'rafamadriz/friendly-snippets'
      , {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        bujild = 'make install_jsregexp'
      }
      , 'hrsh7th/cmp-buffer'
      , 'hrsh7th/cmp-nvim-lsp-signature-help'
      , 'hrsh7th/cmp-path'
      , 'hrsh7th/cmp-calc'
      , 'uga-rosa/cmp-dictionary'
      , 'quangnguyen30192/cmp-nvim-tags'
      , {
        'petertriho/cmp-git'
        , event = 'InsertEnter'
        , config = function()
          require 'configs.completion.cmp.git'
          -- table.insert( require 'cmp'.get_config().source, { name = 'git' } )
        end
      }
    }
    , config = function()
      -- vim.schedule(function()
      require 'configs.completion.cmp'
      -- end)
    end
  },
  {
    'hrsh7th/cmp-nvim-lua'
    -- , ft = 'lua'
    , enabled = vim.g.cmp
    , event = 'InsertEnter'
  },
  {
    'hrsh7th/cmp-cmdline'
    , enabled = vim.g.cmp
    , event = 'CmdlineEnter'
    , config = function()
      require 'configs.completion.cmp.cmdline'
    end
  },
  -- {
  --   'David-Kunz/cmp-npm'
  --   , lazy = true
  --   , config = function()
  --     require 'configs.completion.cmp.npm'
  --   end
  -- },
  -- {
  --   'andersevenrud/compe-tmux'
  --   , branch = 'cmp'
  -- },
  -- {
  --   'ray-x/cmp-treesitter'
  -- },
  -- {
  --   'hrsh7th/cmp-look'
  -- },
  -- {
  --   'hrsh7th/cmp-emoji'
  -- },
  -- {
  --   'hrsh7th/cmp-vsnip'
  -- },
  -- {
  --   'petertriho/cmp-git'
  --   , event = 'InsertEnter'
  --   , config = function()
  --     require 'configs.completion.cmp.git'
  --   end
  -- },
  {
    'Saecki/crates.nvim'
    , event = { 'BufReadPost Cargo.toml' }
    , dependencies = {
      'nvim-lua/plenary.nvim'
    }
    , opts = {
      src = {
        cmp = {
          enabled = true
        }
      }
    }
  },
  {
    'joshzcold/cmp-jenkinsfile'
    , enabled = vim.g.cmp
    , ft = 'Jenkinsfile'
    , event = { 'BufReadPost Jenkinsfile' }
    , dependencies = {
      'hrsh7th/nvim-cmp'
    }
    , config = function()
      require 'configs.completion.cmp.jenkinsfile'
    end
  }
}
