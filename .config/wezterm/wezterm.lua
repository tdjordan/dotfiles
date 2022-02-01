local wt = require 'wezterm'

local font_with_fallback = function( name, params )
  local names = {
    name
    , 'Noto Color Emoji'
    , 'JetBrains Mono'
  }
  return wt.font_with_fallback( names, params )
end

return {
  color_scheme = 'Batman'
  , font_rules = {
    ---  normal
    ---
    {
      italic = false
      -- , intensity = 'Bold'
      , font = wt.font_with_fallback {
        -- 'Source Code Pro',
        -- 'SauceCodePro Nerd Font Mono',
        -- 'NotoMono Nerd Font Mono',
        'FiraCode Nerd Font',
        'NotoMono Nerd Font',
        -- 'JetBrains Mono',
        -- 'VictorMono Nerd Font Mono',
        'Hack Nerd Font Mono'
        -- 'Symbols Nerd Font Mono'
      -- , font = wt.font {
      --   family = 'FiraCode Nerd Font',
        -- family = 'VictorMono Nerd Font Mono',
        -- weight = 'Regular',
        -- stretch = 'Normal',
        -- italic = false
      }
    },

    ---  normal
    ---
    {
      italic = false
      , intensity = 'Bold'
      , font = wt.font_with_fallback {
        -- 'Hack Nerd Font Mono',
        'VictorMono Nerd Font Mono',
        -- 'Symbols Nerd Font Mono'
        -- family = 'VictorMono Nerd Font Mono',
        -- weight = 'Bold',
        -- stretch = 'Normal',
        -- italic = false
      }
    },

    ---  bold
    ---
    -- {
    --   italic = false
    --   , intensity = 'Bold'
    --   , font = font_with_fallback 'VictorMono Nerd Font Mono'
    -- },

    ---  italic
    ---
    -- {
    --   italic = true
    --   , font = wt.font(
    --       {
    --         family = 'VictorMono Nerd Font Mono',
    --         italic = true
    --       },
    --       { family = 'Noto Color Emoji', italic = true },
    --       { family = 'JetBrains Mono'  , italic = true }
    --     )
    -- },
    -- {
    --   italic = true,
    --   font = wt.font( 'VictorMono Nerd Font Mono', { italic = true } )
    -- },
    -- {
    --   italic = true,
    --   font = wt.font {
    --     family = 'VictorMono Nerd Font Mono',
    --     italic = true
    --   }
    -- },

    ---  bold italic
    ---
    -- {
    --   italic = true
    --   , intensity = 'Bold'
    --   , font = font_with_fallback(
    --     'VictorMono Nerd Font Mono',
    --     { italic = true }
    --   )
    -- }
  }
  -- , font = wt.font {
  --   family = 'VictorMono Nerd Font Mono',
  --   stretch = 'Expanded',
  --   italic = true
  -- }
  -- , font = wt.font {
  --   family = 'FiraCode Nerd Font',
  --   stretch = 'Expanded',
  --   -- italic = true
  -- }
  -- , font = wt.font( 'FiraCode Nerd Font', { weight = 'Regular' } )
  -- , font = wt.font 'JetBrains Mono'
  -- , font = wt.font 'VictorMono Nerd Font'
  , font_size = 18.0
  -- , enable_tab_bar = false
  , window_decorations = 'RESIZE'
}
