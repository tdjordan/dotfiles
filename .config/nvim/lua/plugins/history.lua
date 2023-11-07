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
      { "<leader>g.",  "<cmd>DiffviewFileHistory %<cr>", desc = 'git diff this file'    },
      { "<leader>gd.", "<cmd>DiffviewFileHistory %<cr>", desc = 'git diff this file'    },
      { "<leader>gdc", "<cmd>DiffviewClose<cr>",         desc = 'git diff close'        },
      { "<leader>gx",  "<cmd>DiffviewClose<cr>",         desc = 'git diff close'        },
      { "<leader>gdh", "<cmd>DiffviewFileHistory<cr>",   desc = 'git diff file history' },
      { "<leader>gdi", "<cmd>DiffviewOpen<cr>",          desc = 'git diff index'        }
    }
    , config = function()
      require 'configs.diffview'
    end
  }
}
