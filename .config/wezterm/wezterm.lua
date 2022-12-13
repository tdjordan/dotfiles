local wt = require 'wezterm'

wt.on( 'show-font-size', function( window, _ )
  wt.log_error( window:effective_config().font_size )
end)

-- wt.on( 'format-tab-title', function( tab, tabs, panes, config, hover, max_width )
--   if tab.is_active then
--     return {
--       { Background = { Color = 'blue' } },
--       { Text = ' ' .. tab.active_pane.title .. ' ' }
--     }
--   end
--   return tab.active_pane.title
-- end)

-- local SOLID_LEFT_ARROW  = utf8.char( 0xe0b2 )
-- local SOLID_RIGHT_ARROW = utf8.char( 0xe0b0 )
-- local SOLID_LEFT_ARROW  = '<'
-- local SOLID_RIGHT_ARROW = '>'
-- local SOLID_LEFT_ARROW  = '/'
-- local SOLID_RIGHT_ARROW = '/'
-- local SOLID_LEFT_ARROW  = ' '
-- local SOLID_RIGHT_ARROW = ' '

-- wt.on( 'format-tab-title', function( tab, tabs, panes, config, hover, max_width )
--   -- local edge_background = '#0b0022'
--   -- local background = '#1b1032'
--   -- local foreground = '#808080'
--   local background = '#444'
--   local foreground = '#999'
--
--   if tab.is_active then
--     -- background = '#2b2042'
--     -- foreground = '#c0c0c0'
--     background = 'black'
--     foreground = 'white'
--   elseif hover then
--     background = '#3b3852'
--     foreground = '#909090'
--   end
--
--   -- local edge_foreground = background
--
--   -- local title = wt.truncate_right( tab.active_pane.title, max_width - 2 )
--   -- local title = tab.active_pane.title
--   local title = tab.tab_index + 1 .. ' ' .. tab.active_pane.title
--
--   return {
--     { Background = { Color = background } },
--     { Foreground = { Color = foreground } },
--     { Text = SOLID_LEFT_ARROW },
--     -- { Background = { Color = background } },
--     -- { Foreground = { Color = foreground } },
--     { Text = title },
--     -- { Background = { Color = background } },
--     -- { Foreground = { Color = foreground } },
--     { Text = SOLID_RIGHT_ARROW },
--   }
-- end)

return {
  adjust_window_size_when_changing_font_size = false
  , audible_bell = 'Disabled'
  , bold_brightens_ansi_colors = true
  -- , cell_width = .2
  , hide_tab_bar_if_only_one_tab = true
  -- , color_scheme = 'Batman'
  -- , color_scheme = 'Medallion'
  , color_scheme = 'Gruvbox Dark'
  -- , color_scheme = 'Brogrammer'
  -- , color_scheme = 'Builtin Pastel Dark'
  -- , color_scheme = 'Abernathy'

  , font = wt.font_with_fallback {
    {
      family = 'FiraCode Nerd Font Mono',
      -- weight = 'Medium',
      -- weight = 'Thin',
      -- weight = 'ExtraLight',
      -- weight = 'Book',
      harfbuzz_features = { 'ss05', 'ss03', 'ss04', 'ss06' }
    }
  }
  , font_rules = {
    {
      intensity = 'Bold',
      font = wt.font(
        'VictorMono Nerd Font',
        {
          italic = false,
          weight = 'Medium'
        }
      )
    },
    {
      italic = true,
      font = wt.font(
        'VictorMono Nerd Font',
        {
          -- italic = true,
          style = 'Italic'
          -- style = 'Oblique'
        }
      )
    },
    {
      intensity = 'Bold',
      italic = true,
      font = wt.font(
        'VictorMono Nerd Font',
        {
          italic = true,
          weight = 'Bold'
        }
      )
    }
  }

  , font_size = 17.0
  -- , freetype_load_target = 'Mono'
  -- , line_height = 1.1
  , enable_tab_bar = true
  , tab_bar_at_bottom = true
  , window_decorations = 'RESIZE'
  -- , window_decorations = 'NONE'
  , window_padding = {
    left = 0
    , right = 0
    , top = 0
    , bottom = 0
  }
  -- , enable_scroll_bar = false
  , use_fancy_tab_bar = false
  , term = 'wezterm'
  , keys = {
    { key = 'E', mods = 'CTRL', action = wt.action { EmitEvent = 'show-font-size' }}
  }
}
