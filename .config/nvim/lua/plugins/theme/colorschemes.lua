return {
  {
    "catppuccin/nvim"
    -- , keys = '<leader>pc'
    , keys = {
      { "<leader>pc", function() require 'telescope.builtin'.colorscheme() end, desc = 'a colorscheme' }
    }
    , dependencies = {
      'folke/tokyonight.nvim'
      , 'EdenEast/nightfox.nvim'
      , 'LunarVim/onedarker.nvim'
      , 'LunarVim/horizon.nvim'
      , 'rebelot/kanagawa.nvim'
      , 'rose-pine/neovim'
    }
    , name = "catppuccin"
  }
  , {
    'folke/tokyonight.nvim'
    -- , keys = '<leader>pc'
    , config = function()
      require 'theme.tokyonight'
    end
  }
  , {
    'EdenEast/nightfox.nvim'
    -- , keys = '<leader>pc'
    , config = function()
      require 'theme.nightfox'
    end
  }
  , {
    'LunarVim/onedarker.nvim'
    -- , keys = '<leader>pc'
    , config = function()
      require 'theme.onedarker'
    end
  }
  -- , {
  --   'LunarVim/horizon.nvim'
  --   -- , keys = '<leader>pc'
  -- }
  -- , {
  --   'rebelot/kanagawa.nvim'
  --   -- , keys = '<leader>pc'
  -- }

  , {
    'rose-pine/neovim'
    -- , keys = '<leader>pc'
    , config = function()
      require 'theme.rose-pine'
    end
  }





}
