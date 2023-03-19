---  keymap management
---
return {
  {
    'folke/which-key.nvim'
    , lazy = false
    , config = function()
      vim.schedule(function()
        require 'configs.keys'
      end)
    end
  }
}
