local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()

parser_config.http = {
  install_info =
    { url = 'https://github.com/NTBBloodbath/tree-sitter-http'
    , files = { 'src/parser.c' }
    , branch = 'main'
  }
}

-- require 'configs.treesitter.parsers.org'

require 'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  ignore_install = { 'haskell', 'vala' },
  highlight =
    { enable = true
    , disable = {
      'org'
    }
    , additional_vim_regex_highlighting = {
      'org'
    }
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
    -- navigation = {
    --   enable  = true,
    --   keymaps = {
    --     goto_definition      = 'gnd',
    --     list_definitions     = 'gnD',
    --     list_definitions_toc = 'gO',
    --     goto_next_usage      = '<a-*>',
    --     goto_previous_usage  = '<a-*>',
    --   },
    -- },
  },
  playground = {
    enable          = true,
    disable         = {},
    updatetime      = 25,
    persist_queries = false,
    keybindings     =
      { toggle_query_editor       = 'o'
      , toggle_hl_groups          = 'i'
      , toggle_injected_languages = 't'
      , toggle_anonymous_nodes    = 'a'
      , toggle_language_display   = 'I'
      , focus_language            = 'f'
      , unfocus_language          = 'F'
      , update                    = 'R'
      , goto_node                 = '<cr>'
      , show_help                 = '?'
    }
  },
  query_linter = {
    enable = true
    , use_viratual_text = true
    , lint_events =
      { 'BufWrite'
      , 'CursorHold'
    }
  },
  incremental_selection = {
    enable  = true,
    keymaps = {
      init_selection    = 'gnn',
      node_incremental  = 'grn',
      scope_incremental = 'grc',
      node_decremental  = 'grm'
    },
  },
  textobjects = {
    select = {
      enable  = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true;
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    -- swap = {
    --   enable = true,
    --   swap_next = {
    --     ['<leader>a'] = '@parameter.inner'
    --   },
    --   swap_previous = {
    --     ['<leader>A'] = '@parameter.inner'
    --   }
    -- },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']m'] = '@function.outer',
        -- [']]'] = '@class.outer'
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        -- [']['] = '@class.outer'
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        -- ['[['] = '@class.outer'
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        -- ['[]'] = '@class.outer'
      },
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {
        ['df'] = '@function.outer',
        ['dF'] = '@class.outer'
      }
    }
  },
  -- rainbow = {
  --   enable = true,
  --   extended_mode = true
  -- }
  autopairs = {
    enable = true
  },
  indent = {
    enable = true
  }
}

-- local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
-- parser_config.java.used_by = 'Jenkinsfile'
-- local ft_to_parser = require 'nvim-treesitter.parsers'.filetype_to_parsername
-- ft_to_parser.Jenkinsfile = 'groovy'
-- ft_to_parser.Jenkinsfile = 'java'

-- local keymap = vim.api.nvim_set_keymap

-- keymap( 'n', '<leader>T', '<cmd>TSHighlightCapturesUnderCursor<cr>', { noremap = true, silent = true } )
