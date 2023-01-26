local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()

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

-- parser_config.just = {
--   install_info = {
--     url = "https://github.com/IndianBoy42/tree-sitter-just",
--     files = { "src/parser.c", "src/scanner.cc" },
--     branch = "main",
--   }
-- }

require 'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  -- sync_install = false,     -- true if wanting synchronous installs
  -- auto_install = true,      -- true to install missing parsers on BufEnter
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
      init_selection    = 'gnn',  -- set to false to disable one of the mappings
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
        ['af'] = { query = '@function.outer', desc = 'a function' },
        ['if'] = { query = '@function.inner', desc = 'inner function' },
        ['aC'] = { query = '@class.outer', desc = 'a Class' },
        ['iC'] = { query = '@class.inner', desc = 'inner Class' },
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        -- ["iC"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        -- ['ac'] = '@call.outer',
        -- ['ic'] = '@call.inner',
        -- ['ac'] = '@comment.outer',
        ['ac'] = { query = '@conditional.outer', desc = 'a conditional'},
        -- ['ic'] = '@conditional.inner',
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        -- ["ic"] = { query = "@conditional.inner", desc = "Select inner part of a conditional region" },
        -- ["ic"] = { query = "@conditional.inner", desc = "inner conditional" },
        ["ic"] = { query = '@conditional.inner', desc = 'inner conditional' },
        -- ['oc'] = '@conditional.outer',
        ['al'] = { query = '@loop.outer', desc = 'a loop' },
        ['il'] = { query = '@loop.inner', desc = 'inner loop' },
        -- ['ol'] = '@loop.outer',
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V',  -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true or false
      include_surrounding_whitespace = true,
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
      set_jumps = true,   -- sets jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        -- [']]'] = { query = '@class.outer', desc = 'Next class start' }
        --
        -- You can use regex matching and/or pass a list in a "query" key to group multiple queries.
        ["]o"] = "@loop.*",
        -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
        --
        -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
        -- ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        -- [']['] = '@class.outer'
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        -- ['[['] = '@class.outer'
        ['[o'] = '@loop.*',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        -- ['[]'] = '@class.outer'
      },
      -- Below will go to either the start or the end, whichever is closer.
      -- Use if you want more granular movements
      -- Make it even more gradual by adding multiple queries and regex.
      goto_next = {
        ["]c"] = "@conditional.outer",
      },
      goto_previous = {
        ["[c"] = "@conditional.outer",
      }
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      floating_previw_opts = {},
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
