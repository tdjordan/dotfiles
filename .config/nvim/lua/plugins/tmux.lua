---  tmux
---
return {
  {
    'willothy/flatten.nvim'
    , lazy = false
    , opts = {
      nest_if_no_args = false
      , window = {
        open = "alternate"
      }
    }
  },
  -- {
  --   'tmux-plugins/vim-tmux'
  -- },
  {
    'aserowy/tmux.nvim'
    , keys = {
      {
        '<c-h>', function()
          require 'tmux'.move_left()
        end, desc = 'move focus left'
      },
      {
        '<c-j>', function()
          require 'tmux'.move_bottom()
        end, desc = 'move focus down'
      },
      {
        '<c-k>', function()
          require 'tmux'.move_top()
        end, desc = 'move focus up'
      },
      {
        '<c-l>', function()
          require 'tmux'.move_right()
        end, desc = 'move focus right'
      },
    }
    , opts = {
      -- enables default configuration here
      copy_sync = {
        -- enables copy sync. by default, all registers are synchronized.
        -- to control which registers are synced, see the `sync_*` options.
        enable = false,

        -- ignore specific tmux buffers e.g. buffer0 = true to ignore the
        -- first buffer or named_buffer_name = true to ignore a named tmux
        -- buffer with name named_buffer_name :)
        -- ignore_buffers = { empty = false },

        -- TMUX >= 3.2: yanks ( and deletes ) will get redirected to the
        -- system clipboard by tmux
        -- redirect_to_clipboard = false,

        -- ofset controls where register sync starts
        --   eg: offset 2 lets registers 0 & 1 untouchec
        -- register_offset = 0,

        -- sync clipboard overwrites vim.g.clipboard to handle * and + registers.
        -- If you sync your system clipboard without tmux, disable this option!
        -- sync_clipboard = true,

        -- synchronizes registers *, +, unnamed, and 0 till 9 with tmux buffers.
        -- sync_registers = true,

        -- syncs deletes with tmux clipboard as well, it is advised to do so.
        -- neovim does not allow syncing registers 0 & 1 without overwriting the
        -- unnamed register. Thus, ddp would not be possible.
        -- sync_deletes = true,

        -- syncs the unnamed register with the first buffer entry from tmux.
        -- sync_unnamed = true,
      },
      navigation = {
        -- cycles to opposite pane while navigating into the border
        -- cycle_navigation = true,

        -- enables default keybindings <c-hjkl> for normal mode
        enable_default_keybindings = false,

        -- prevents unzoom tmux when navigating beyohnd vim border
        persist_zoom = true
      },
      -- resize = {
      -- enables default keybindings <a-hjkl> for normal mode
      -- enable_default_keybindings = false,

      -- sets resize steps for x axis
      -- resize_step_x = 1,

      -- sets resize steps for y axis
      -- resize_step_y = 1
      -- }
    }
  }
}
