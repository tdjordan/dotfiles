----------
---
---  Plugins
---
----------

-- local g       = vim.g
-- local cmd     = vim.cmd
-- local fn      = vim.fn
-- local input   = fn.input
-- local system  = fn.system
-- local execute = vim.api.nvim_command

local M = {}

---  Install all the plugins
---
M.init_packer = function ()
  local packer = require 'packer'

  packer.startup({
    function(use)
      ---  Packer itself
      ---
      use {
        'wbthomason/packer.nvim'
        , opt = true
        , cmd = 'PackerSync'
      }

      ---  Lua Information
      ---
      use {
        'nanotee/nvim-lua-guide'
        , opt = true
      }

      ---  Language Protocol Server - LSP
      ---
      use {
        'neovim/nvim-lspconfig'
        , after = 'nvim-treesitter'
        , config = function()
          require 'lsp'
        end
      }

      ---  LSP Extenstions
      ---
      -- use {
      --   'glepnir/lspsaga.nvim'
      --   , config = function()
      --     local ku = require 'keymap.utility'
      --     ku.nnoremap( '<leader>gh', '<cmd>Lspsaga lsp_finder<cr>' )
      --     ku.nnoremap( '<leader>ca', '<cmd>Lspsaga code_action<cr>' )

      --     require 'lspsaga'.init_lsp_saga {
      --         error_sign              = '❌'
      --       , warn_sign               = '⚠️'
      --       , hint_sign               = '💡'
      --       , infor_sign              = 'ℹ️'
      --       , dianostic_header_icon   = ' 🚒 '
      --       , definition_preview_icon = '📖 '
      --       , code_action_icon        = '💡'
      --       , finder_definition_icon  = '📖 '
      --       , finder_reference_icon   = '🔖 '
      --       , finder_action_keys = {
      --           open        = '<cr>'
      --         , split       = 's'
      --         , vsplit      = 'v'
      --         , quit        = '<esc>'
      --         , scroll_down = '<c-f>'
      --         , scroll_up   = '<c-b>'
      --       }
      --       , code_action_keys = {
      --           quit = '<esc>'
      --         , exec = '<cr>'
      --       }
      --     }
      --   end
      -- }

      ---  Inlay Hints for rust-analyzer
      ---
      -- use {
      --   'nvim-lua/lsp_extensions.nvim'
      --   , after = 'nvim-lspconfig'
      -- }

      ---  Is this now just built in?
      ---
      -- use   'tjdevries/nlua.nvim'

      ---  Auto Completion
      ---
      use {
        'hrsh7th/nvim-compe'
        , event = 'InsertEnter'
        , config = function()
          require 'configs.compe'
        end
      }

      ---  Telescope
      ---
      use {
        'nvim-lua/plenary.nvim'
        , opt = true
        , module_pattern = 'plenary.*'
      }
      use {
        'nvim-lua/popup.nvim'
        , module_pattern = 'popup.*'
      }
      use {
        'nvim-telescope/telescope.nvim'
        , cmd = 'Telescope'
        , module_pattern = 'telescope.*'
        , after = 'popup.nvim'
        , config = function()
          require 'configs.telescope'
        end
      }

      ---  TODO : Add keymapping
      use {
        'nvim-telescope/telescope-packer.nvim'
        , after = 'telescope.nvim'
      }

      use {
        'nvim-telescope/telescope-fzy-native.nvim'
        , after = 'telescope.nvim'
        , config = function()
          require 'telescope'.load_extension('fzy_native')
        end
      }

      use {
        'nvim-telescope/telescope-project.nvim'
        , after = 'telescope.nvim'
        , config = function()
          require 'telescope'.setup {
            extensions = {
              project = {
                base_dirs = {
                  { '~/devRoot/_bf', max_depth = 4 }
                  , { '~/devRoot/neovim', max_depth = 4 }
                }
              }
            }
          }
        end
      }

      ---  TODO : Add keymapping
      use {
        'camgraff/telescope-tmux.nvim'
        , after = 'telescope.nvim'
        , cmd = 'Telescope tmux'
      }

      ---  TODO : Add keymapping
      use {
        'nvim-telescope/telescope-symbols.nvim'
        , after = 'telescope.nvim'
      }

      ---  tree sitter
      ---
      use {
        'nvim-treesitter/nvim-treesitter'
        , run = ':TSUpdate'
        , opt = true
        -- , event = 'BufReadPost'
        , event = 'CursorHold'
        , config = function()
          require 'configs.treesitter'
        end
      }

      use {
        'nvim-treesitter/playground'
        , cmd =
          { "TSPlaygroundToggle"
          , "TSHighlightCapturesUnderCursor"
        }
      }
      -- use { 'nvim-treesitter/completion-treesitter' }
      -- use {
      --   'nvim-treesitter/nvim-treesitter-refactor'
        -- , evnet = 'CursorMoved'
        -- , after = 'nvim-treesitter'
        -- , module = 'nvim-treesitter-refactor'
        -- , config = function()
        --   require 'nvim-treesitter.configs'.setup {
        --     refactor = {
        --       navigation = {
        --         enable  = true,
        --         keymaps = {
        --           goto_definition      = "gnd",
        --           list_definitions     = "gnD",
        --           list_definitions_toc = "gO",
        --           goto_next_usage      = "<a-*>",
        --           goto_previous_usage  = "<a-*>",
        --         }
        --       }
        --     },
        --   }
        -- end
      -- }
      -- use {
      --   'nvim-treesitter/nvim-treesitter-textobjects'
      --   , after = 'nvim-treesitter'
      -- }
      -- use { 'romgrk/nvim-treesitter-context' }
      -- use {
      --   'p00f/nvim-ts-rainbow'
      --   , disable = true
      --   , after = 'nvim-treesitter'
      --   , config = function()
      --     require 'nvim-treesitter.configs'.setup {
      --       rainbow = {
      --         enable = true
      --         , extended_mode = true
      --         , max_file_lines = 1000
      --       }
      --     }
      --   end
      -- }

      ---  quick fix
      ---
      -- TODO
      use {
        'kevinhwang91/nvim-bqf'
        , event = 'InsertEnter'
      }

      ---  rest explorations
      ---
      use {
        'NTBBloodbath/rest.nvim'
        -- , after = 'plenary.nvim'
        -- , cmd = {
        --   'RestNvim'
        --   , 'RestNvimPreview'
        -- }
        , ft = 'http'
        , module_pattern = 'rest-nvim.*'
        , config = function()
          require 'rest-nvim'.setup()
        end
      }

      ---  history
      ---
      -- use { 'mbbill/undotree' }

      ---  terminals
      ---
      -- use { 'voldikss/vim-floaterm' }
      -- use { 'norcalli/nvim-terminal.lua' }

      ---  tmux
      ---
      -- use { 'tmux-plugins/vim-tmux' }

      ---  debugger
      ---
      -- use { 'puremourning/vimspector' }
      -- use { 'critiqjo/lldb.nvim' }
      use {
        'mfussenegger/nvim-dap'
      }
      use {
        'nvim-telescope/telescope-dap.nvim'
        , after = {
          'telescope.nvim'
          , 'nvim-dap'
        }
      }

      ---  matchup
      ---
      -- use { 'andymass/vim-matchup' }
      -- use { 'jkramer/vim-checkbox' }

      ---  snippets
      ---
      -- use { 'Shougo/neosnippet' }
      -- use { 'Shougo/neosnippet-snippets' }
      -- use { 'honza/vim-snippets' }
      -- use { 'SirVer/ultisnips' }
      -- use { 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }

      use {
        'folke/which-key.nvim'
        , event = 'CursorHold'
        , config = function()
            require 'configs.keys'
        end
        -- , event = 'ColorScheme'
        -- , opt = true
        -- , after = 'nvim-treesitter'
        -- , setup = function()
        --   require 'configs.keys'
        -- end
        -- , keys = ' '
        -- , as = 'wk'
        -- , module = 'which-key'
        -- , config = function()
        --   require 'configs.keys'.register_keys()
        -- end
        -- , config = function()
        --   local wk = require 'which-key'
        --   local keys = require 'configs.keys'
        --   wk.register(keys.normal_mappings, keys.normal_mode)
        -- end
      }

      ---  search
      ---
      -- use { 'rking/ag.vim' }
      -- use {
      --   'junegunn/fzf',
      --   run = 'fzf#install()'
      -- }
      -- use { 'junegunn/fzf.vim' }
      -- use { 'stsewd/fzf-checkout.vim' }
      -- use { 'junegunn/fzf',
      --  \ { 'dir': '~/.fzf', 'do': './install --all' }
      -- use { 'lotabout/skim' } --, { 'dir': '~/.skim', 'do': './install -all' }
      -- use { 'wsdjeg/FlyGrep.vim' }
      -- use {
      --   'vijaymarupudi/nvim-fzf'
        -- , config = function()
        --   local fzf = require('fzf')

        --   coroutine.wrap(function()
        --     local result = fzf.fzf({'choice 1', 'choice 2'})
        --     if result then
        --       print(result[1])
        --     end
        --   end)()


        -- end
      -- }

      ---  themes
      ---
      -- use { 'flazz/vim-colorschemes' }
      -- use { 'morhetz/gruvbox' }
      -- use { 'gruvbox-community/gruvbox' }

      -- TODO

      -- use {
      --   'sainnhe/gruvbox-material'
      --   , event = 'ColorSchemePre'
      -- }

      -- use {
      --   'RRethy/nvim-base16'
      --   , event = 'ColorSchemePre'
      -- }

      use {
        'sainnhe/everforest'
        , event = 'CursorMoved'
      }

      use {
        'eddyekofo94/gruvbox-material.nvim'
        -- , opt = true
        , config = function ()
          vim.opt.background = 'dark'
          -- vim.cmd [[ syntax on ]]
          -- vim.cmd [[ filetype on ]]
          -- vim.cmd [[ filetype plugin indent on ]]
          require 'gruvbox-material'.set()
          -- vim.cmd [[ hi String gui=NONE  ]]
        end
        -- , after = 'nvim-treesitter'
        -- , event = {
        --   'ColorSchemePre'
        --   , 'BufReadPost'
        -- }
        -- , requires = 'nvim-treesitter'
        -- , module = 'gruvbox-material'
      }

      use {
        'eddyekofo94/gruvbox-flat.nvim'
        , event = 'CursorMoved'
      }

      use {
        'monsonjeremy/onedark.nvim'
        , event = 'CursorMoved'
      }

      -- use {
      --   'ii14/onedark.nvim'
      --   , event = 'CursorMoved'
      -- }

      use {
        'NTBBloodbath/doom-one.nvim'
        , event = 'CursorMoved'
        , setup = function()
          -- vim.g.doom_one_enable_treesitter      = true -- default: true
          vim.g.doom_one_terminal_colors        = true -- default: false
          vim.g.doom_one_italic_comments        = true -- default: false
          -- vim.g.doom_one_transparent_background = true -- default: false
          vim.g.doom_one_cursor_coloring        = true -- default: false
          vim.g.doom_one_telescope_highlights   = true -- default: false
        end
      }

      use {
        'folke/tokyonight.nvim'
        , event = 'CursorMoved'
        , setup = function()
          vim.g.tokyonight_style = "night"
          vim.g.tokyonight_terminal_colors = true
          vim.g.tokyonight_dark_sidebar = false
          vim.g.tokyonight_italic_comments = true
          vim.g.tokyonight_italic_keywords = true
          -- vim.g.tokyonight_italic_functions = true
          -- vim.g.tokyonight_italic_variables = true
          -- vim.g.tokyonight_sidebars = { 'terminal' }
          -- vim.g.tokyongiht_dark_float = true
        end
      }

      ---
      ---  theme : Lush Colorschemes
      ---
      use {
        'rktjmp/lush.nvim'
        , module_pattern = 'lush.*'
      }

      use {
        'savq/melange'
        -- , event = {
        --   'ColorschemePre'
        --   , 'BufReadPost'
        -- }
        , event = 'CursorMoved'
      }

      -- TODO
      -- use {
      --   'metalelf0/jellybeans-nvim'
      --   , event = 'ColorSchemePre'
      -- }

      -- use {
      --   'kunzaatko/nord.nvim'
      --   , event = 'ColorSchemePre'
      --   , setup = function()
      --     vim.g.italic = 1
      --     vim.g.nord_italic_comments = 1
      --   end
      -- }

      -- TODO
      -- use { 'ful1e5/onedark.nvim' }

      -- use {
      --   'vigoux/oak'
      --   , event = 'ColorSchemePre'
      -- }

      use {
        'ayu-theme/ayu-vim'
        , event = 'CursorMoved'
        , setup = function()
          vim.g.ayucolor = 'dark'
          -- vim.g.ayucolor = 'mirage'
        end
      }

      -- use {
      --   'yong1le/darkplus.nvim'
      --   , event = 'CursorMoved'
      -- }

      -- TODO
      use {
        'marko-cerovac/material.nvim'
        , event = 'CursorMoved'
        , module = 'material'
        , setup = function()
          -- vim.g.material_style = 'deep ocean'
          vim.g.material_style = 'darker'
          vim.g.material_italic_comments = true
          vim.g.material_italic_keywords = true
          -- vim.g.material_italic_functions = true
          -- vim.g.material_italic_variables = true
          -- vim.g.material_borders = true
          -- vim.g.material_contrast = true
        end
      }

      -- use {
      --   'maaslalani/nordbuddy',
      --   requires = {
      --     'tjdevries/colorbuddy.vim'
      --   }
      -- }
      -- use {
      --   'tjdevries/gruvbuddy.nvim',
      --   requires = {
      --     'tjdevries/colorbuddy.vim'
      --   }
      -- }
      -- use { 'vim-airline/vim-airline' }
      -- use { 'vim-airline/vim-airline-themes' }
      -- use { 'itchyny/lightline.vim' }
      ---
      --- theme : status lines
      ---
      -- use {
      --   'glepnir/galaxyline.nvim'
      --   , branch = 'main'
      --   , config = function()
      --     require 'my_statusline'
      --   end
      -- }
      -- use {
      --   'windwp/windline.nvim'
      -- }

      use {
        'hoob3rt/lualine.nvim'
        , event = 'BufReadPost'
        , module = 'lualine'
        , config = function()
          require 'lualine'.setup {
            options = {
              theme = 'onedark'
              -- theme = 'gruvbox_material'
              -- theme = 'tokyonight'
              -- theme = 'material'
              -- theme = 'melange'
              -- theme = '<amatch>'
              -- , section_separators = {'', ''},
              -- , extenstions = {
              --   'nvim-tree'
              -- }
              , disabled_filetypes = {
                'NvimTree'
              }
            }
          }
        end
        -- , setup = function()
        --   require 'configs.lauline'
        -- end
        -- , config = function()
        --   require 'configs.lauline'
        -- end
      }

      -- use {
      --   'famiu/feline.nvim'
      --   , config = function()
      --     require 'feline'.setup()
      --   end
      -- }
      ---
      --- theme : other
      --- #ffff00
      use {
        'norcalli/nvim-colorizer.lua'
        , event = 'CursorHold'
        , setup = function()
        end
        , config = function()
          require 'colorizer'.setup()
        end
      }
      -- use { 'fatih/molokai' }

      --- :h nvim_tree_hightlight
      ---
      use {
        'kyazdani42/nvim-web-devicons'
        , event = 'CursorHold'
      }
      use {
        'kyazdani42/nvim-tree.lua'
        , cmd =
          { 'NvimTreeClipboard'
          , 'NvimTreeClose'
          , 'NvimTreeFindFile'
          , 'NvimTreeOpen'
          , 'NvimTreeRefresh'
          , 'NvimTreeToggle'
        }
        , setup = function()
          vim.g.nvim_tree_update_cwd = 1
          vim.g.nvim_tree_quit_on_open = 1
          vim.g.nvim_tree_git_hl = 1
          vim.g.nvim_tree_lsp_diagnostics = 1
          vim.g.nvim_tree_show_icons = {
            folders = 1,
            files = 1,
          }
          vim.g.nvim_tree_icons = {
            default = '',
            -- symlink = '',
            -- git = {
              -- unstaged = "",
      --         staged = "✓",
      --         unmerged = "",
      --         renamed = "➜",
      --         untracked = ""
            -- },
            -- folder = {
            --   default = "",
              -- open = "",
      --         empty = "",
      --         empty_open = "",
      --         symlink = ""
            -- }
          }
        end
      }
      -- use { 'hardcoreplayers/spaceline.vim' }
      -- use { 'glepnir/spaceline.vim' }
      -- use { 'ryanoasis/vim-devicons' }
      -- use { 'ryanoasis/nerd-fonts' }

      ---  language navigation
      ---
      -- use { 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
      -- use { 'liuchengxu/vista.vim', { 'on' : 'Vista!!' }

      ---  editor configs
      ---
      -- use { 'editorconfig/editorconfig-vim' }

      ---  convience
      ---
      -- use { 'benekastah/neomake' }
      -- use { 'preservim/nerdcommenter' }
      use {
        'b3nj5m1n/kommentary'
        , event = 'CursorHold'
        , setup = function()
          -- do not load the default komentary mappings
          vim.g.kommentary_create_default_mappings = false
        end
        , config = function()
          require 'configs.kommentary'
        end
      }

      ---  file trees
      -- use { 'justinmk/vim-dirvish' }

      ---  version control systems
      ---
      -- use { 'Xuyuanp/nerdtree-git-plugin' }
      -- use { 'tpope/vim-fugitive' }
      -- use { 'jlfwong/vim-mercenary' }
      -- use {
      --   'ludovicchabant/vim-lawrencium',
      --   cmd = 'Hg'
      -- }
      -- use { 'gregsexton/gitv' }
      -- use { 'airblade/vim-gitgutter' }
      -- use { 'mhinz/vim-signify' }

      use {
        'lewis6991/gitsigns.nvim'
        , after = 'plenary.nvim'
        , config = function()
          require 'gitsigns'.setup()
        end
      }

      ---  guides
      ---
      -- use { 'Yggdroot/indentLine' }
      -- use { 'nathanaelkane/vim-indent-guides' }
      use {
        'lukas-reineke/indent-blankline.nvim'
        , cmd = 'IndentBlanklineToggle'
        , setup = function()
          vim.g.indent_blankline_buftype_exclude  = {
            'terminal'
          }

          vim.g.indent_blankline_filetype_exclude = {
            'help'
            , 'packer'
            , 'man'
          }

          -- vim.g.indent_blankline_char = '┆'

          vim.g.indent_blankline_use_treesitter                 = true
          vim.g.indent_blankline_show_trailing_blankline_indent = false
          vim.g.indent_blankline_show_first_indent_level        = false
          vim.g.indent_blankline_show_current_context           = true

          vim.g.indent_blankline_char = '¦'
          vim.g.indent_blankline_context_patterns = {
            'class'
            , 'return'
            , 'function'
            , 'method'
            , '^if'
            , '^while'
            , 'jsx_element'
            , '^for'
            , '^object'
            , '^table'
            , 'block'
            , 'arguments'
            , 'if_statement'
            , 'else_clause'
            , 'jsx_element'
            , 'jsx_self_closing_element'
            , 'try_statement'
            , 'catch_clause'
            , 'import_statement'
            , 'operation_type'
          }
        end
      }

      ---  performance
      ---
      use {
        'tweekmonster/startuptime.vim'
        , cmd = 'StartupTime'
      }
      -- use   'norcalli/profiler.nvim'

      ---  braces
      ---
      -- use { '9mm/vim-closer' }
      -- use { 'jiangmiao/auto-pairs' }
      use {
        'windwp/nvim-autopairs'
        , event = 'InsertEnter'
        , config = function()
          require 'configs.autopairs'
        end
      }

      ---  language syntax
      ---
      -- use { 'scrooloose/syntastic' }
      -- use { 'w0rp/ale' }
      -- use { 'gisphm/vim-gradle' }
      -- use { 'udalov/kotlin-vim' }
      use {
        'sheerun/vim-polyglot'
        , event = 'CursorHold'
      }
      -- use { 'prurigro/vim-polyglot-darkcloud' }
      -- use { 'dleonard0/pony-vim-syntax' }
      -- use { 'saltstack/salt-vim' }
      -- use { 'fatih/vim-go' }
      -- use { 'garyburd/go-explorer' }
      -- use { 'pearofducks/ansible-vim' }
      -- let g:ansible_extra_keywords_highlight = 1
      -- use { 'glench/vim-jinja2-syntax' }
      -- use { 'PProvost/vim-ps1' }
      -- use { 'lambdatoast/elm.vim' }
      -- use { 'ElmCast/elm-vim' }
      -- use { 'google/vim-jsonnet' }
      -- use { 'zinit-zsh/zinit-vim-syntax' }
      -- use { 'numirias/semshi', {'do': ':UpdateRemoteuseins'}

      ---  annoyances
      ---
      use {
        'ntpeters/vim-better-whitespace'
        , event = 'CursorHold'
        , setup = function()
          vim.g.strip_whitespace_on_save      = true
          vim.g.strip_whitespace_confirm      = false
          vim.g.strip_whitelines_at_eof       = true
          vim.g.show_spaces_that_precede_tabs = true
          vim.g.better_whitespace_filetypes_blacklist = {
            'diff'
            , 'gitcommit'
            , 'unite'
            , 'qf'
            , 'help'
            , 'packer'
            , 'man'
          }
        end
      }

      ---  automation ?
      ---
      -- use { 'tpope/vim-surround' }
      -- use { 'terryma/vim-multiple-cursors' }
      -- use { 'jszakmeister/vim-togglecursor' }
      -- use { 'matze/vim-move' }
      ---  Utility - Alignment
      use {
        'junegunn/vim-easy-align'
        , cmd = 'EasyAlign'
      }
      --use { 'godlygeek/tabular' }

      ---  preview panels
      ---
      -- use { 'atweiden/vim-uzbl' }
      -- use { 'xu-cheng/brew.vim' }

      ---  service hooks
      ---
      -- use { 'mrtazz/simplenote.vim' }


      -- use {'lervag/vimtex', opt=true }

      ---  Zettelkasten
      ---
      -- use {
      --   'megalithic/zk.nvim'
      --   , after = 'nvim-telescope'
      -- }

      use {
        'vhyrro/neorg'
        , after = 'plenary.nvim'
        , config = function()
          require 'neorg'.setup {
            load = {
              ['core.defaults'] = {}
            }
            , logger = {
              use_console = true
            }
          }
        end
      }

      -- use {
      --   'vhyrro/neorg'
      --   , requires = 'nvim-lua/plenary.nvim'
      --   , config = function()
      --     require 'neorg'.setup {
      --       load = {
      --         ['core.defaults'] = {}
      --         , ['core.norg.concealer'] = {}
      --         , ['core.norg.dirman'] = {
      --           config = {
      --             workspaces = {
      --               my_workspace = '~/neorg'
      --             }
      --           }
      --         }
      --       }
      --     }
      --   end
      -- }

    end
    , config = {
      profile = {
        enable = true
      }
    }
  })
end

return M
