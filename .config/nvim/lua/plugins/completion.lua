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
    , config = function(_, opts)
      require 'lspkind'.init(opts)
    end
  },
  {
    'hrsh7th/nvim-cmp'
    -- , event = 'CursorHold'
    , event = 'InsertEnter'
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
    , event = 'InsertEnter'
  },
  {
    'hrsh7th/cmp-cmdline'
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
    , event = { 'BufReadPost Jenkinsfile' }
    , config = function()
      require 'configs.completion.cmp.jenkinsfile'
    end
  }
}
