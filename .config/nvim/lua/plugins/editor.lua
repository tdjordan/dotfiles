return {
  ---  keymap management
  ---
  {
    'folke/which-key.nvim'
    , lazy = false
    , init = function()
      vim.opt.timeout = true
      vim.opt.timeoutlen = 300
    end
    , config = function()
      vim.schedule(function()
        require 'configs.keys'
      end)
    end
  },
  ---  Files
  ---
  {
    'nvim-tree/nvim-tree.lua'
    , keys = {
      {
        '<leader>e', function()
          require 'nvim-tree.api'.tree.toggle()
        end, desc = 'explorer'
      }
    }
    , init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end
    , config = function()
      require 'configs.filetree.nvim-tree'
    end
  },
  {
    'nvim-neo-tree/neo-tree.nvim'
    , dependencies = {
      'MunifTanjim/nui.nvim'
    }
    , cmd = 'Neotree'
    , config = function()
      require 'configs.filetree.neo-tree'
    end
  },
  {
    'mrbjarksen/neo-tree-diagnostics.nvim'
    , enabled = false
    , dependencies = {
      'nvim-neo-tree/neo-tree.nvim'
    }
    -- , cmd = 'Neotree'
  },

  ---  guides
  ---
  {
    'lukas-reineke/indent-blankline.nvim'
    , name = 'ibl'
    , cmd = {
      'IBLToggle',
      'IBLEnable',
      'IBLEnableScope',
      'IBLToggleScope'
    }
    , opts = {
      enabled = true
      , scope = {
        enabled = true
        , char = '¦'
        , show_start = true
        , show_end = true
        , injected_languages = true
        , highlight = 'IblScope'
        , priority = 1024
        , include = {
          node_type = {}
        }
        , exclude = {
          language = {}
          , node_type = {
            ['*'] = {
              'source_file',
              'program'
            },
            lua = {
              'chunk'
            },
            python = {
              'module'
            }
          }
        }
      }
    }
    -- , config = function()
    --   require 'ibl'.setup {}
    -- --   require 'configs.indentation.blankline'
    -- end
  }
}
