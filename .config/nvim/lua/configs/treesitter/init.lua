require 'nvim-treesitter.configs'.setup {
  -- ensure_installed = "all",
  ensure_installed = "maintained",
  highlight = {
    enable = true
  },
  refactor = {
    -- highlight_definitions = { enable = true },
    -- highlight_current_scope = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = 'grr'
      }
    },
    navigation = {
      enable  = true,
      keymaps = {
        goto_definition      = "gnd",
        list_definitions     = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage      = "<a-*>",
        goto_previous_usage  = "<a-*>",
      },
    },
  },
  playground = {
    enable          = true,
    disable         = {},
    updatetime      = 25,
    persist_queries = false
  },
  incremental_selection = {
    enable  = true,
    keymaps = {
      init_selection    = "gnn",
      node_incremental  = "grn",
      scope_incremental = "grc",
      node_decremental  = "grm"
    },
  },
  indentation = {
    enable = { true }
  },
  textobjects = {
    select = {
      enable  = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
  -- rainbow = {
  --   enable = true,
  --   extended_mode = true
  -- }
}


  -- indent = {
  --   enable = true
  -- },

local keymap = vim.api.nvim_set_keymap

keymap( 'n', '<leader>T', '<cmd>TSHighlightCapturesUnderCursor<cr>', { noremap = true, silent = true } )
