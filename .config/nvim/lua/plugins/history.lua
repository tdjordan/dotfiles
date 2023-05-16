return {
  {
    'sindrets/diffview.nvim'
    , cmd = {
      'DiffviewClose',
      'DiffviewFileHistory',
      'DiffviewFocusFiles',
      'DiffviewLog',
      'DiffviewOpen',
      'DiffviewRefresh',
      'DiffviewToggleFiles',
    }
    , keys = {
      { "<leader>gd.", "<cmd>DiffviewOpen<cr>",        desc = "git diff this file"    },
      { "<leader>gdc", "<cmd>DiffviewClose<cr>",       desc = "git diff close"        },
      { "<leader>gdh", "<cmd>DiffviewFileHistory<cr>", desc = "git diff file history" }
    }
    , config = function()
      require 'configs.diffview'
    end
  }
}
