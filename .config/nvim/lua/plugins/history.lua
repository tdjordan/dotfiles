return {
  {
    'dlyongemallo/diffview-plus.nvim'
    , cmd = {
      'DiffviewClose',
      'DiffviewDiffFiles',
      'DiffviewFileHistory',
      'DiffviewFocusFiles',
      'DiffviewLog',
      'DiffviewOpen',
      'DiffviewRefresh',
      'DiffviewToggleFiles',
      'DiffviewToggle',
    }
    , keys = {
      { "<leader>g.",  "<cmd>DiffviewFileHistory %<cr>", desc = 'git diff this file'    },
      { "<leader>gd.", "<cmd>DiffviewFileHistory %<cr>", desc = 'git diff this file'    },
      { "<leader>gdc", "<cmd>DiffviewClose<cr>",         desc = 'git diff close'        },
      { "<leader>gdf", "<cmd>DiffviewDiffFiles<cr>",     desc = 'git diff files'        },
      { "<leader>gff", "<cmd>DiffviewFocusFiles<cr>",    desc = 'git diff focus  files' },
      { "<leader>gx",  "<cmd>DiffviewClose<cr>",         desc = 'git diff close'        },
      { "<leader>gdh", "<cmd>DiffviewFileHistory<cr>",   desc = 'git diff file history' },
      { "<leader>gdi", "<cmd>DiffviewOpen<cr>",          desc = 'git diff index'        },
      { "<leader>gdr", "<cmd>DiffviewRefresh<cr>",       desc = 'git diff refresh view' },
      { "<leader>gtf", "<cmd>DiffviewToggleFiles<cr>",   desc = 'git diff toggle files' },
    }
    , config = function()
      require 'configs.diffview'
    end
  },
  {
    "esmuellert/codediff.nvim"
    , cmd = "CodeDiff"
  }
}
