require 'tmux'.setup({
  -- enables default configuration here
  -- copy_sync = {
    -- enables copy sync and overwrites all register actions to
    -- sync registers *, +, unnamed, and 0 till 9 from tmux in advanced
    -- enable = false,

    -- TMUX >= 3.2: yanks ( and deletes ) will get redirected to the
    -- system clipboard by tmux
    -- redirect_to_clipboard = false,

    -- ofset controls where register sync starts
    --   eg: offset 2 lets registers 0 & 1 untouchec
    -- register_offset = 0,

    -- sync clipboard overwrites vim.g.clipboard to handle * and + registers.
    -- If you sync your system clipboard without tmux, disable this option!
    -- sync_clipboard = true,

    -- syncs deletes with tmux clipboard as well, it is advised to do so.
    -- neovim does not allow syncing registers 0 & 1 without overwriting the
    -- unnamed register. Thus, ddp would not be possible.
    -- sync_deletes = true,
  -- },
  navigation = {
    -- cycles to opposite pane while navigating into the border
    -- cycle_navigation = true,

    -- enables default keybindings <c-hjkl> for normal mode
    enable_default_keybindings = true,

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
})
