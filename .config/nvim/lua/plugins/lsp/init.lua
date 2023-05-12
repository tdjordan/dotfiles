return {
  ---  Language Protocol Server - LSP
  ---
  {
    'williamboman/mason.nvim'
    , build = ':MasonUpdate'
    , dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'whoissethdaniel/mason-tool-installer.nvim',
    }
    , config = function()
      require 'configs.lsp.mason'
    end
  },
  {
    'whoissethdaniel/mason-tool-installer.nvim'
    , opts = {
      ensure_installed = {
        'erg'
        -- , 'helm-ls'
      }
    }
  },
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
    , event = 'CursorHold'
    , config = function()
      require 'configs.lsp.lines'
    end
  },
  {
    'jose-elias-alvarez/null-ls.nvim'
    , dependencies = {
      'williamboman/mason.nvim',
      'jay-babu/mason-null-ls.nvim'
    }
    , event = { 'BufReadPost', 'BufNewFile' }
    , config = function()
      require 'configs.lsp.null'
    end
  },

  {
    'neovim/nvim-lspconfig'
    , dependencies = {
      'williamboman/mason-lspconfig.nvim',
      {
        'b0o/schemastore.nvim'
        , version = false
      }
    }
  },
  {
    'simrat39/symbols-outline.nvim'
    , cmd = {
      'SymbolsOutline',
      'SymbolsOutlineOpen'
    }
    , opts = {
      highlight_hovered_item = true,
      show_guides = true,
      auto_preview = false,
      position = 'right',
      relative_width = true,
      width = 25,
      auto_close = false,
      show_numbers = false,
      show_relative_numbers = false,
      show_symbol_details = true,
      preview_bg_highlight = 'Pmenu',
      autofold_depth = nil,
      auto_unfold_hover = true,
      fold_markers = { '', '' },
      wrap = false,
      keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = { "<Esc>", 'q' },
        goto_location = "<cr>",
        focus_location = 'o',
        hover_symbol = "<c-space>",
        toggle_preview = 'K',
        rename_symbol = 'r',
        code_actions = 'a',
        fold = 'h',
        unfold = 'l',
        fold_all = 'W',
        unfold_all = 'E',
        fold_reset = 'R'
      },
      lsp_blacklist = {},
      symbol_blacklist = {},
      symbols = {
        File          = { icon = "", hl = "TSURI"},
        Module        = { icon = "", hl = "TSNamespace"},
        Namespace     = { icon = "", hl = "TSNamespace"},
        Package       = { icon = "", hl = "TSNamespace"},
        Class         = { icon = "𝓒", hl = "TSType"},
        Method        = { icon = "ƒ", hl = "TSMethod"},
        Property      = { icon = "", hl = "TSMethod"},
        Field         = { icon = "", hl = "TSField"},
        Constructor   = { icon = "", hl = "TSConstructor"},
        Enum          = { icon = "ℰ", hl = "TSType"},
        Interface     = { icon = "ﰮ", hl = "TSType"},
        Function      = { icon = "", hl = "TSFunction"},
        Variable      = { icon = "", hl = "TSConstant"},
        Constant      = { icon = "", hl = "TSConstant"},
        String        = { icon = "𝓐", hl = "TSString"},
        Number        = { icon = "#", hl = "TSNumber"},
        Boolean       = { icon = "⊨", hl = "TSBoolean"},
        Array         = { icon = "", hl = "TSConstant"},
        Object        = { icon = "⦿", hl = "TSType"},
        Key           = { icon = "🔐", hl = "TSType"},
        Null          = { icon = "NULL", hl = "TSType"},
        EnumMember    = { icon = "", hl = "TSField"},
        Struct        = { icon = "𝓢", hl = "TSType"},
        Event         = { icon = "🗲", hl = "TSType"},
        Operator      = { icon = "+", hl = "TSOperator"},
        TypeParameter = { icon = "𝙏", hl = "TSParameter"},
      }
    }
  }
}
