local rose_pine = require 'rose-pine'
local palette   = require 'rose-pine.palette'

rose_pine.setup {
  --- @usage 'auto'|'main'|'moon'|'dawn'
  variant = 'auto',
  --- @usage 'main'|'moon'|'dawn'
  dark_variant             = 'main',
  bold_vert_split          = false,
  dim_nc_background        = false,
  disable_background       = false,
  disable_float_background = false,
  disable_italics          = false,

  --- @usage string hex value or named color from rosepinetheme.com/palette
  groups = {
    -- background  = 'base',
    background    = 'overlay',
    background_nc = '_experimental_nc',
    panel         = 'surface',
    panel_nc      = 'base',
    border        = 'highlight_med',
    comment       = 'muted',
    link          = 'pine',
    punctuation   = 'subtle',

    error = 'love',
    hint  = 'iris',
    info  = 'foam',
    warn  = 'gold',

    headings = {
      h1 = 'iris',
      h2 = 'foam',
      h3 = 'rose',
      h4 = 'gold',
      h5 = 'pine',
      h6 = 'foam',
    }
    -- or set all headings at once
    -- headings = 'subtle'
  },

  -- Change specific vim highlight groups
  -- https://github.com/rose-poine/neovim/wiki/Recipes
  highlight_groups = {
    ColorColumn = { bg = 'rose' },

    -- Blend colours against the "base" background
    -- CursorLine = { bg = 'foam', blend = 10 },
    -- StatusLine = { fg = 'love', bg = 'love', blend = 10 },

    -- LineNr       = { bg = 'base' },
    -- CursorLineNr = { fg = 'gold', bg = 'base' },
    -- -- CursorLineNr = { fg = colors.editor.accent,       bg = colors.editor.contrast },
    -- SignColumn   = { bg = 'base' },
    -- -- Pmenu        = { fg = colors.editor.fg,           bg = colors.editor.contrast },
    --
    -- Borderless Telescope
    --
    TelescopeResultsBorder = { fg = palette.overlay, bg = palette.overlay },
    TelescopeResultsNormal = { bg = palette.overlay },
    TelescopeResultsTitle = { fg = palette.overlay, bg = palette.overlay },

    TelescopePreviewBorder = { fg = palette.base, bg = palette.base },
    TelescopePreviewNormal = { bg = palette.base },
    TelescopePreviewTitle = { fg = palette.base, bg = palette.base },

    TelescopePromptBorder  = { fg = palette.pine, bg = palette.pine },
    TelescopePromptNormal = { fg = palette.rose, bg = palette.pine, },

    TelescopeSelection = { fg = palette.base, bg = palette.text }
  }
}

-- set colorscheme after options
-- vim.cmd.colorscheme { 'rose-pine' }
