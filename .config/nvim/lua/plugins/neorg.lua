return {
  -- {
  --   'nvim-neorg/neorg'
  --   -- , build = ':Neorg sync-parsers'
  --   , cmd = 'Neorg'
  --   , ft = 'norg'
  --   , dependencies = {
  --     'luarocks.nvim'
  --   }
  --   , keys = {
  --     {
  --       '<leader>oj', function()
  --         -- vim.cmd 'Neorg journal today'
  --         vim.cmd.Neorg { 'journal', 'today' }
  --       end, desc = 'journal today'
  --     },
  --     {
  --       '<leader>owh', function()
  --         -- vim.cmd 'Neorg workspace home'
  --         vim.cmd.Neorg { 'workspace', 'home' }
  --       end, desc = 'home'
  --     },
  --     {
  --       '<leader>oww', function()
  --         -- vim.cmd 'Neorg workspace work'
  --         vim.cmd.Neorg { 'workspace', 'work' }
  --       end, desc = 'work'
  --     },
  --     {
  --       '<leader>oo', function()
  --         vim.cmd.Neorg {}
  --       end, desc = 'neorg cmd'
  --     }
  --   }
  --   , dependencies = {
  --     { 'nvim-lua/plenary.nvim' },
  --     { 'nvim-neorg/neorg-telescope' }
  --   }
  --   , opts = {
  --     load =
  --       { [ 'core.defaults'       ] = {}
  --       , [ 'core.concealer' ] = {
  --         config = {
  --           folds = false
  --         }
  --       }
  --       , [ 'core.dirman'    ] = {
  --         config = {
  --           workspaces = {
  --             -- my_workspace = '~/neorg',
  --             work = "~/.notes/work",
  --             home = "~/.notes/home",
  --             test = "~/.notes/test"
  --           }
  --         }
  --       }
  --       , [ 'core.journal' ] = {}
  --       , [ 'core.completion' ] = {
  --         config = {
  --           engine = 'nvim-cmp' }
  --       }
  --       -- , [ 'core.qol.toc' ] = {}
  --       -- , [ 'core.integrations.nvim-cmp' ] = {}
  --       , [ 'core.integrations.telescope' ] = {}
  --       , [ 'core.export' ] = {}
  --       -- , [ 'external.context' ] = {}
  --       , [ 'core.keybinds' ] = {
  --         config = {
  --           -- default_keybinds = true
  --           -- neorg_leader = "<leader>o"
  --           neorg_leader = '<leader>o'
  --           , hook = function( keybinds )
  --             keybinds.map_event_to_mode( "norg", {
  --               n = { -- Bind keys in normal mode
  --                 --
  --                 --   -- Keys for managing TODO items and setting their states
  --                 --   { 'gtd',       'core.norg.qol.todo_items.todo.task_done'    },
  --                 --   { 'gtu',       'core.norg.qol.todo_items.todo.task_undone'  },
  --                 --   { 'gtp',       'core.norg.qol.todo_items.todo.task_pending' },
  --                 --   { '<c-8>',     'core.norg.qol.todo_items.todo.task_cycle'   },
  --                 --
  --                 -- { '<c-l>',     'core.integrations.telescope.find_linkable' },
  --                 { '.',         'core.norg.qol.todo_items.todo.task_cycle'  },
  --                 { 'fl',        'core.integrations.telescope.find_linkable' },
  --                 --
  --                 { '<c-s>',     'core.integrations.telescope.find_linkable' }
  --               },
  --
  --               i = { -- Bind keys in insert mode
  --                 { '<c-l>',     'core.integrations.telescope.insert_link'   }
  --               }
  --             })
  --           end,
  --         }
  --       }
  --     }
  --   }
  --   -- , config = function()
  --   --   -- require 'packer'.loader('neorg-telescope')
  --   --   require 'configs.neorg'
  --   -- end
  -- }
}
