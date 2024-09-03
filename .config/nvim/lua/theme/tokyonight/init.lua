require 'tokyonight'.setup {
  style           = 'storm',        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style     = 'day',          -- The theme is used when the background is set to light
  transparent     = false,          -- Enable this to disable setting the background color
  terminal_colors = true,           -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {                        -- Style to be applied to different syntax groups
                                    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments  = { italic = true },
    keywords  = { italic = true },
    functions = { italic = true },
    variables = {},
                                    -- Background styles. Can be 'dark', 'transparent' or 'normal'
    sidebars  = 'dark',             -- style for sidebars, see below
    floats    = 'dark',             -- style for floating windows
  },
  sidebars = {                      -- Set a darker background on sidebar-like windows. For example: `['qf', 'vista_kind', 'terminal', 'packer']`
    'qf',
    'help',
    'terminal',
    'packer',
    -- 'vista_kind',
  },
  day_brightness           = 0.3,   -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false,             -- dims inactive windows
  lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold

  -- - You can override specific color groups to use other groups or a hex color
  -- - function will be called with a ColorScheme table
  -- -@param colors ColorScheme
  -- on_colors = function(colors) end,

  -- - You can override specific highlights to use other groups or a hex color
  -- - function will be called with a Highlights and ColorScheme table
  -- -@param highlights Highlights
  -- -@param colors ColorScheme
  on_highlights = function(highlights, colors)
    highlights.LineNr = {
      bg = colors.bg_dark,
      fg = colors.fg_gutter,
    }
    highlights.CursorLineNr = {
      bg = colors.bg_dark,
      fg = colors.dark5,
    }
    highlights.SignColumn = {
      bg = colors.bg_dark,
      fg = colors.fg_gutter,
    }

    -- nvim-tree
    --
    highlights.NvimTreeNormal = {
      bg = colors.bg,
      fg = colors.fg_sidebar,
    }
    highlights.NvimTreeNormalNC = {
      bg = colors.bg,
      fg = colors.fg_sidebar,
    }

    -- Borderless Telescope
    --
    local prompt = '#2d3149'
    highlights.TelescopeNormal = {
      bg = colors.bg_dark,
      fg = colors.fg_dark,
    }
    highlights.TelescopeBorder = {
      bg = colors.bg_dark,
      fg = colors.bg_dark,
    }
    highlights.TelescopePromptNormal = {
      bg = prompt,
    }
    highlights.TelescopePromptBorder = {
      bg = prompt,
      fg = prompt,
    }
    highlights.TelescopePromptTitle = {
      bg = prompt,
      fg = prompt,
    }
    highlights.TelescopePreviewTitle = {
      bg = colors.bg_dark,
      fg = colors.bg_dark,
    }
    highlights.TelescopeResultsTitle = {
      bg = colors.bg_dark,
      fg = colors.bg_dark,
    }
    highlights.TelescopePreviewBorder = {
      bg = colors.bg_dark,
      fg = colors.bg_dark,
    }
    highlights.TelescopeResultsBorder = {
      bg = colors.bg_dark,
      fg = colors.bg_dark,
    }
  end,

  cache = true,                     -- When set to true, the theme will be cached for better performance

  ---@type table<string, boolean|{enabled:boolean}>
  plugins = {
    -- enable all plugins when not using lazy.nvim
    -- set to false to manually enable/disable plugins
    all = package.loaded.lazy == nil,
    -- uses your plugin manager to automatically enable needed plugins
    -- currently only lazy.nvim is supported
    auto = true,
    -- add any plugins here that you want to enable
    -- for all possible plugins, see:
    --   * https://github.com/folke/tokyonight.nvim/tree/main/lua/tokyonight/groups
    -- telescope = true,
  },
}
