return {
  {
    'zbirenbaum/copilot.lua'
    , cmd = 'Copilot'
    , dependencies = {
      'copilotlsp-nvim/copilot-lsp'
    }
    , opts = {
      suggestion = { enabled = false }
      , panel = { enabled = false }
    }
  },
  {
    'giuxtaposition/blink-cmp-copilot'
  },
  {
    'folke/sidekick.nvim'
    , opts = {
      cli = {
        mux = {
          backend = "tmux",
          enabled = true
        }
      }
    }
    , keys = {
      {
        '<tab>', function()
          if not require 'sidekick'.nes_jump_or_apply() then
            return '<tab>' -- fallback to normal tab
          end
        end, desc = 'Toggle Sidekick CLI'
      },
      {
        '<leader>aa', function()
          require 'sidekick.cli'.toggle()
        end, desc = 'Toggle Sidekick CLI'
      },
      {
        '<leader>as', function()
          require 'sidekick.cli'.select()
        end, desc = 'Select CLI'
      },
      {
        '<leader>ad', function()
          require 'sidekick.cli'.close()
        end, desc = 'Detach CLI Session'
      },
      {
        '<leader>at', function()
          require 'sidekick.cli'.send({ msg = "{this}" })
        end, desc = 'Send Line'
      },
      {
        '<leader>af', function()
          require 'sidekick.cl'.send({ msg = "{file}" })
        end, desc = 'Send File'
      },
      {
        '<leader>av', function()
          require 'sidekick.cli'.send({ msg = "{selection}" })
        end, desc = 'Send Visual Selection',
        mode = { 'x' }
      },
      {
        '<leader>ap', function()
          require 'sidekick.cli'.prompt()
        end, desc = 'Select Prompt'
      },
      {
        '<leader>ac', function()
          require 'sidekick.cli'.toggle({ name = 'chatgpt', focus = true })
        end, desc = 'Toggle Sidekick ChatGPT'
      },
      {
        '<leader>ao', function()
          require 'sidekick.cli'.toggle({ name = 'opencode', focus = true })
        end, desc = 'Toggle Sidekick OpenCode'
      }
    }
  },
  {
    'joeblubaugh/nvim-beads'
    , lazy = false
  }
}
