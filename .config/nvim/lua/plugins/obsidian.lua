return {
  {
    'epwalsh/obsidian.nvim'
    , cond = function() return not vim.g.vscode end
    , version = '*'
    , ft = 'markdown'
    , cmd = {
      'ObsidianBacklinks'
      , 'ObsidianCheck'
      , 'ObsidianDailies'
      , 'ObsidianExtractNote'
      , 'ObsidianFollowLink'
      , 'ObsidianLink'
      , 'ObsidianLinks'
      , 'ObsidianNew'
      , 'ObsidianOpen'
      , 'ObsidianPasteImg'
      , 'ObsidianQuickSwitch'
      , 'ObsidianRename'
      , 'ObsidianSearch'
      , 'ObsidianTags'
      , 'ObsidianTemplate'
      , 'ObsidianToday'
      , 'ObsidianTomorrow'
      , 'ObsidianWorkspace'
      , 'ObsidianYesterday'
    }
    , dependencies = {
      'nvim-lua/plenary.nvim'
    }
    , keys = {
      {
        '<leader>ob', '<cmd>ObsidianBacklinks<cr>', desc = 'backlinks'
      }
      , {
        '<leader>oc', '<cmd>ObsidianCheck<cr>', desc = 'check links'
      }
      , {
        '<leader>od', '<cmd>ObsidianDailies<cr>', desc = 'daily notes'
      }
      , {
        '<leader>of', '<cmd>ObsidianFollowLink<cr>', desc = 'follow link'
      }
      , {
        '<leader>ol', '<cmd>ObsidianLinks<cr>', desc = 'links'
      }
      , {
        '<leader>on', '<cmd>ObsidianNew<cr>', desc = 'new note'
      }
      , {
        '<leader>oo', '<cmd>ObsidianOpen<cr>', desc = 'open in Obsidian'
      }
      , {
        '<leader>oq', '<cmd>ObsidianQuickSwitch<cr>', desc = 'quick switch'
      }
      , {
        '<leader>or', '<cmd>ObsidianRename<cr>', desc = 'rename note'
      }
      , {
        '<leader>os', '<cmd>ObsidianSearch<cr>', desc = 'search notes'
      }
      , {
        '<leader>ot', '<cmd>ObsidianToday<cr>', desc = 'today'
      }
      , {
        '<leader>oT', '<cmd>ObsidianTemplate<cr>', desc = 'insert template'
      }
      , {
        '<leader>oy', '<cmd>ObsidianYesterday<cr>', desc = 'yesterday'
      }
      , {
        '<leader>om', '<cmd>ObsidianTomorrow<cr>', desc = 'tomorrow'
      }
      , {
        '<leader>owp', '<cmd>ObsidianWorkspace personal<cr>', desc = 'workspace personal'
      }
      , {
        '<leader>oww', '<cmd>ObsidianWorkspace work<cr>', desc = 'workspace work'
      }
    }
    , opts = function()
      return require 'configs.obsidian'
    end
  }
}
