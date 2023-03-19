return {
  {
    'nvim-tree/nvim-tree.lua'
    , keys = {
      {
        '<leader>e', function()
          require 'nvim-tree.api'.tree.toggle()
        end, desc = 'explorer'
      }
    }
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
    , config = function()
      require 'configs.indentation.blankline'
    end
  },

}
