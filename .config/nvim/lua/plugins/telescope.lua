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
          -- prompt_position = 'top',                                                    -- default: bottom
          -- prompt_prefix = '>',
          selection_strategy = 'reset',
          -- sorting_strategy = 'ascending',                                             -- default: descending
          -- layout_strategy = 'horizontal',
          -- layout_config = {
          --   dropdown = {
          --     width = 0.75
          --   }
          -- },
          -- file_sorter = require 'telescope.sorters'.get_fuzzy_file,
          -- file_ignore_patterns = {},
          -- generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
          -- path_display = 'smart',
          -- shorten_path = true,
          -- winblend = 0,
          -- width = 0.75,
          -- preview_cutoff = 120,
          -- results_height = 1,
          -- results_width = 0.8,
          -- border = {},
          -- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
          color_devicons = true,
          -- use_less = true,
          -- scroll_strategy = 'cycle'
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
            -- n = {
            --   ["<c-j>"] = actions.move_selection_next,
            --   ["<c-k>"] = actions.move_selection_previous,
            --   ["<c-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            --   ["<esc>"] = actions.close,
            -- }
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
            , prompt_prefix = '    '
            -- , prompt_prefix = '🔍  '
            -- , prompt_prefix = '🔍'
            -- , mirror = true
            , layout_config = {
              height = 0.75
            }
          },

          colorscheme = {
            enable_preview = true
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
          --     height = 200
          --   , vertical = {
          --     mirror = true
          --   }
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
              {
                { '~/_devRoot/_bf',    max_depth = 4 }
                , { '~/_devRoot/neovim', max_depth = 4 }
                , { '~/_devRoot/_ab',    max_depth = 4 }
                , { '~/.config/nvim',    max_depth = 4 }
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
      -- end
    end
  },
  {
    'lalitmee/browse.nvim'
    , cmd = 'Browse'
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
        '<leader>bb', function()
          require 'browse'.open_browser_bookmarks {}
        end, desc = 'browser bookmarks'
      },
      {
        '<leader>ba', function()
          local bm = require 'browse.bookmark_manager'
          bm.clear_cache()
          -- local bookmarks = require 'browse.file_bookmarks'.load_from_file('~/.bookmarks_local.yaml')
          -- vim.print( bookmarks )
          require 'browse'.open_manual_bookmarks { bookmark_files = '~/.bookmarks_local.yaml' }
          -- require 'browse'.open_manual_bookmarks { bookmarks = bookmarks }
          -- require 'browse'.open_manual_bookmarks { bookmarks = bookmarks }
        end, desc = 'local bookmarks'
      },
      {
        '<leader>bL', function()
          local bookmarks = require 'configs.bookmarks'
          require 'browse'.open_manual_bookmarks { bookmarks = bookmarks }
        end, desc = 'local bookmarks'
      },
      {
        '<leader>bl', function()
          require 'browse'.open_manual_bookmarks { bookmark_files = '~/.bookmarks_local.yaml' }
        end, desc = 'local bookmarks'
      },
      {
        '<leader>bi', function()
          require 'browse'.input_search()
        end, desc = 'search web for ...'
      },
      {
        '<leader>bm', function()
          require 'browse'.open_manual_bookmarks {}
        end, desc = 'manual bookmarks'
      },
      {
        '<leader>bo', function()
          require 'browse'.browse {}
        end, desc = 'open bookmarks'
      },
      -- {
      --   '<leader>bdd', function()
      --     require 'browse.devdocs'.search {}
      --   end, desc = 'search devdocs'
      -- },
    }
    , opts = {
      provider = 'google',  -- google is default
      bookmark_files = {
        '~/.config/bookmarks.yaml',
        '~/.bookmarks_local.yaml',
      },
      browser_bookmarks = {
        enabled = true,
        browsers = {
          chrome = true,
          firefox = false,
          safari = false,
          edge = false,
        },
      }
    }
  },
}
