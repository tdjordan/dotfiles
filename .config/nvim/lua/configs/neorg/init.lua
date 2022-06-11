-- require 'neorg'.setup {
--   load = {
--     ['core.defaults'] = {}
--   }
--   , logger = {
--     use_console = true
--   }
-- }

require 'neorg'.setup {
  load =
    { [ 'core.defaults'       ] = {}
    , [ 'core.norg.concealer' ] = {
        config = {
          folds = false
        }
      }
    , [ 'core.norg.dirman'    ] = {
      config = {
        workspaces = {
          -- my_workspace = '~/neorg',
          work = "~/notes/work",
          home = "~/notes/home",
          test = "~/.notes/test"
        }
      }
    }
    , [ 'core.norg.journal' ] = {}
    , [ 'core.norg.completion' ] = {
      config = {
        engine = 'nvim-cmp' }
    }
    -- , [ 'core.norg.qol.toc' ] = {}
    -- , [ 'core.integrations.nvim-cmp' ] = {}
    , [ 'core.integrations.telescope' ] = {}
    -- , [ 'external.context' ] = {}
    , [ 'core.gtd.base' ] = { config = { workspace = 'test' } }
    , [ 'core.keybinds' ] = {
      config = {
        -- default_keybinds = true
        -- neorg_leader = "<leader>o"
        neorg_leader = '<leader>o'
        , hook = function( keybinds )
          keybinds.map_event_to_mode( "norg", {
            n = { -- Bind keys in normal mode
            --
            --   -- Keys for managing TODO items and setting their states
            --   { 'gtd',       'core.norg.qol.todo_items.todo.task_done'    },
            --   { 'gtu',       'core.norg.qol.todo_items.todo.task_undone'  },
            --   { 'gtp',       'core.norg.qol.todo_items.todo.task_pending' },
            --   { '<c-8>',     'core.norg.qol.todo_items.todo.task_cycle'   },
            --
              -- { '<c-l>',     'core.integrations.telescope.find_linkable' },
              { '.',         'core.norg.qol.todo_items.todo.task_cycle'  },
              { 'fl',        'core.integrations.telescope.find_linkable' },
            --
              { '<c-s>',     'core.integrations.telescope.find_linkable' }
            },

            i = { -- Bind keys in insert mode
              { '<c-l>',     'core.integrations.telescope.insert_link'   }
            }
          })
        end,
      }
    }
  }
  -- , hook = function()
    -- This sets the leader for all Neorg keybinds. It is separate from the regular <Leader>,
    -- And allows you to shove every Neorg keybind under one "umbrella".
    -- local neorg_leader = "<leader>" -- You may also want to set this to <Leader>o for "organization"
    -- local neorg_leader = ";" -- You may also want to set this to <Leader>o for "organization"

    -- Require the user callbacks module, which allows us to tap into the core of Neorg
    -- local neorg_callbacks = require 'neorg.callbacks'

    -- Listen for the enable_keybinds event, which signals a "ready" state meaning we can bind keys.
    -- This hook will be called several times, e.g. whenever the Neorg Mode changes or an event that
    -- needs to reevaluate all the bound keys is invoked
    -- neorg_callbacks.on_event( "core.keybinds.events.enable_keybinds", function(_, keybinds)
    --   -- Map all the below keybinds only when the "norg" mode is active
    --   keybinds.map_event_to_mode( "norg", {
    --     -- n = { -- Bind keys in normal mode
    --     --
    --     --   -- Keys for managing TODO items and setting their states
    --     --   { 'gtd',       'core.norg.qol.todo_items.todo.task_done'    },
    --     --   { 'gtu',       'core.norg.qol.todo_items.todo.task_undone'  },
    --     --   { 'gtp',       'core.norg.qol.todo_items.todo.task_pending' },
    --     --   { '<c-8>',     'core.norg.qol.todo_items.todo.task_cycle'   },
    --     --
    --     --   { '<c-s>',     'core.integrations.telescope.find_linkable'  }
    --     --
    --     -- },
    --
    --     i = { -- Bind keys in insert mode
    --
    --       { '<c-l>',     'core.integrations.telescope.insert_link'    }
    --
    --     },
    --   }, { silent = true, noremap = true })
    -- end)
  -- end
}
