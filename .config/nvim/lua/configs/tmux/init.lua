require 'tmux'.setup({
  -- enables default configuration here
  copy_sync = {
    -- enables copy sync and overwrites all register actions to
    -- sync registers *, +, unnamed, and 0 till 9 from tmux in advanced
    enable = false
  }
  , navigation = {
    -- enables default keybindings <c-hjkl> for normal mode
    enable_default_keybindings = true

    -- cycles to opposite pane while navigating into the border
    -- , cycle_navigation = true
  }
  , resize = {
    -- enables default keybindings <a-hjkl> for normal mode
    enable_default_keybindings = false
  }
})
