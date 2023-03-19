---  Telescope
---
return {
  {
    'nvim-telescope/telescope-symbols.nvim'
    , keys = {
      {
        '<leader>pe', function()
          require 'telescope.builtin'.symbols {
            sources = { 'emoji', 'gitmoji' }
          }
        end, desc = '*moji'
      },
      {
        '<leader>fp', function()
          require 'telescope.builtin'.find_files {
            cwd = require 'lazy.core.config'.options.root
          }
        end, desc = 'plugin file'
      }
    }
  },
  {
    'nvim-telescope/telescope-fzy-native.nvim'
    , config = function()
      require 'telescope'.load_extension 'fzy_native'
    end
  },
  {
    'nvim-telescope/telescope-github.nvim'
    , config = function()
      require 'telescope'.load_extension 'gh'
    end
  },
  {
    'nvim-telescope/telescope.nvim'
    , cmd = 'Telescope'
    , dependencies = {
      'nvim-lua/plenary.nvim'
      , 'nvim-telescope/telescope-file-browser.nvim'
      , 'pwntester/octo.nvim'
      , 'nvim-telescope/telescope-fzy-native.nvim'
      , 'nvim-telescope/telescope-project.nvim'
      , 'nvim-telescope/telescope-symbols.nvim'
      , 'nvim-telescope/telescope-github.nvim'
    }
    , config = function()
      require 'telescope'.setup {
        defaults = {
          cache_picker = {
            num_pickers = 50
            -- , limit_entries = 1000
          },
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
          },
          --prompt_position = 'top',                                                    -- default: bottom
          --prompt_prefix = '>',
          selection_strategy = 'reset',
          --sorting_strategy = 'ascending',                                             -- default: descending
          --layout_strategy = 'horizontal',
          -- layout_config = {
          --   dropdown = {
          --     width = 0.75
          --   }
          -- },
          --file_sorter = require 'telescope.sorters'.get_fuzzy_file,
          --file_ignore_patterns = {},
          --generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
          -- path_display = 'smart',
          --shorten_path = true,
          --winblend = 0,
          --width = 0.75,
          --preview_cutoff = 120,
          --results_height = 1,
          --resutls_width = 0.8,
          --border = {},
          --borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
          color_devicons = true,
          --use_less = true,
          --scroll_strategy = 'cycle'
          mappings = {
            i = {
              ["jk"] = function() return 'jk' end,
              ["<c-j>"] = require 'telescope.actions'.move_selection_next,
              ["<c-k>"] = require 'telescope.actions'.move_selection_previous,
              --     ["<c-n>"] = actions.move_selection_next,
              --     ["<c-p>"] = actions.move_selection_previous,
              ["<c-Q>"] = require 'telescope.actions'.smart_send_to_qflist + require 'telescope.actions'.open_qflist,
              --     ["<esc>"] = actions.close,
            },
            --   n = {
            --     ["<c-j>"] = actions.move_selection_next,
            --     ["<c-k>"] = actions.move_selection_previous,
            --     ["<c-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            --     ["<esc>"] = actions.close,
            --   }
          }
        },
        pickers = {
          -- autocommands = {
          --   theme = 'dropdown'
          --   , layout_config = {
          --     width = 0.9
          --     , height = 0.7
          --   }
          -- },

          find_files = {
            theme = 'ivy'
            -- , mirror = true
            , layout_config = {
              height = 0.75
            }
          },

          -- find_files = {
          --   theme = 'cursor'
          -- },

          -- live_grep = {
          --   theme = 'ivy'
          --   -- , mirror = true
          --   , layout_config = {
          --     height = 0.75
          --   }
          -- },

          lsp_document_symbols = {
            theme = 'ivy'
            -- , mirror = true
            , layout_config = {
              height = 0.75
            }
          },

          man_pages = {
            theme = 'ivy'
            -- , mirror = true
            , layout_config = {
              height = 0.90
            }
          },

          jumplist = { theme = 'dropdown' },

          buffers = {
            theme = 'dropdown'
            , layout_strategy = 'bottom_pane'
          },

          -- builtin = {
          --   theme = 'ivy',
          --   -- previewer = false
          --   -- vertical = { width = 0.5 }
          -- },

          current_buffer_fuzzy_find = {
            theme = 'ivy'
            , previewer = false
            , layout_config = {
              height = 0.75
            }
          },

          -- git_branches = {
          --   theme = 'dropdown'
          -- , layout_config = {
          --   height = 200
          -- , vertical = {
          --   mirror = true
          -- }
          -- }
          -- , layout_strategy = 'bottom_pane'
          -- }
        },
        extensions = {
          file_browser = {
            theme = 'ivy'
            , hijack_netrw = true
            -- , mappings = {
            --   i = {},
            --   n = {}
            -- }
          },
          project = {
            base_dirs =
              { { '~/devRoot/_bf',    max_depth = 4 }
                , { '~/devRoot/neovim', max_depth = 4 }
              }
            -- , hidden_files = false
            , theme = 'ivy'
            -- , order_by = 'asc'
            -- , search_by = 'title'
            -- , sync_win_nvim_tree = false    -- default: false
          }
        }
      }

      -- local _ = require 'notify'
      -- require 'telescope'.load_extension('notify')
      -- vim.cmd [[packadd telescope-packer.nvim]]
      -- require 'telescope'.load_extension('packer')
      -- , config = function()
      --   require 'configs.telescope'
    end
  },
  {
    'lalitmee/browse.nvim'
    , dependencies = {
      'nvim-telescope/telescope.nvim'
    }
    , keys = {
      {
        '<leader>bs', function()
          require 'browse'.browse()
        end, desc = 'browse search'
      },
      {
        '<leader>bo', function()
          local bookmarks = require 'configs.bookmarks'
          require 'browse'.open_bookmarks { bookmarks = bookmarks }
        end, desc = 'browse bookmarks'
      },
      {
        '<leader>bi', function()
          require 'browse'.input_search {}
        end, desc = 'browse search input'
      },
      {
        '<leader>bdd', function()
          require 'browse.devdocs'.search {}
        end, desc = 'search devdocs'
      },
    }
    , opts = {
      provider = 'google'   -- google is default
    }
  },
}
