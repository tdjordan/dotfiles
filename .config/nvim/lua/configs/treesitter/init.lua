local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()

-- parser_config.http = {
--   install_info =
--     { url = 'https://github.com/NTBBloodbath/tree-sitter-http'
--     , files = { 'src/parser.c' }
--     , branch = 'main'
--   }
-- }

-- parser_config.norg_meta = {
--   install_info = {
--     url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
--     files = { "src/parser.c" },
--     branch = "main"
--   }
-- }

-- parser_config.norg_table = {
--   install_info = {
--     url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
--     files = { "src/parser.c" },
--     branch = "main"
--   }
-- }

parser_config.cue = {
  install_info = {
    url = "https://github.com/eonpatapon/tree-sitter-cue",
    files = { "src/parser.c", "src/scanner.c" },
    branch = "main"
  }
}

require 'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  -- sync_install = false,     -- true if wanting synchronous installs
  ignore_install = {
    'haskell',
    'vala'
  },
  highlight =
    { enable = true
    -- , disable = {
    --   'org'
    -- }
    -- , additional_vim_regex_highlighting = {
    --   'org'
    -- }
    -- , custom_captures = {
    --   ---  cue
    --   ["operator.default"] = "Statement",
    --   ["operator.regexp"] = "Statement",
    --   ["operator.unify"] = "Statement",
    --   ["operator.disjunct"] = "Label",
    --   ["definition"] = "Bold"
    -- }
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
        ['aC'] = '@class.outer',
        ['iC'] = '@class.inner',
        -- ['ac'] = '@call.outer',
        -- ['ic'] = '@call.inner',
        -- ['ac'] = '@comment.outer',
        ['ac'] = '@conditional.outer',
        ['ic'] = '@conditional.inner',
        ['oc'] = '@conditional.outer',
        ['al'] = '@loop.outer',
        ['il'] = '@loop.inner',
        ['ol'] = '@loop.outer',
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
  },
  -- pairs = {
  --   enable = true,
  --   disable = {},
  --   highlight_pair_events = {}, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
  --   highlight_self = false, -- whether to highlight also the part of the pair under cursor (or only the partner)
  --   goto_right_end = false, -- whether to go to the end of the right partner or the beginning
  --   fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
  --   keymaps = {
  --     goto_partner = "<leader>%",
  --     delete_balanced = "X",
  --   },
  --   delete_balanced = {
  --     only_on_first_char  = false, -- whether to trigger balanced delete when on first character of a pair
  --     fallback_cmd_normal = nil,   -- fallback command when no pair found, can be nil
  --     longest_partner     = false, -- whether to delete the longest or the shortest pair when multiple found.
  --                                  -- E.g. whether to delete the angle bracket or whole tag in  <pair> </pair>
  --   }
  -- }
}

-- local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
-- parser_config.java.used_by = 'Jenkinsfile'
-- local ft_to_parser = require 'nvim-treesitter.parsers'.filetype_to_parsername
-- ft_to_parser.Jenkinsfile = 'groovy'
-- ft_to_parser.Jenkinsfile = 'java'

-- local keymap = vim.keymap.set

-- keymap( 'n', '<leader>T', '<cmd>TSHighlightCapturesUnderCursor<cr>', { noremap = true, silent = true } )

-- require 'nvim-treesitter.install'.update()
