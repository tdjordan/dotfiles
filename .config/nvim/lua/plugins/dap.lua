---  debugger
---
return {
  {
    'jay-babu/mason-nvim-dap.nvim'
    , config = function()
      vim.schedule(function()
        require 'configs.dap.mason'
      end)
    end
  }
  , {
    'mfussenegger/nvim-dap'
    , dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-telescope/telescope-dap.nvim',
      'jbyuki/one-small-step-for-vimkind',
    }
    -- , init = function()
    --   require 'utility'.packer_lazy_load 'nvim-dap'
    -- end
    , config = function()
      vim.schedule(function()
        require 'configs.dap'
      end)
    end
  }
  , {
    'rcarriga/nvim-dap-ui'
    , dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio'
    }
    , config = function()
      require 'configs.dap.ui'
    end
  }
  , {
    'theHamsta/nvim-dap-virtual-text'
    , config = function()
      require 'configs.dap.virtual'
    end
  }
}
