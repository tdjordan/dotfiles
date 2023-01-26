local rose_pine = require 'rose-pine'
local palette   = require 'rose-pine.palette'

rose_pine.setup {
	--- @usage 'main' | 'moon'
	dark_variant             = 'main',
	bold_vert_split          = false,
	dim_nc_background        = false,
	disable_background       = false,
	disable_float_background = false,
	disable_italics          = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		-- background  = 'base',
		background  = 'overlay',
		panel       = 'surface',
		border      = 'highlight_med',
		comment     = 'muted',
		link        = 'iris',
		punctuation = 'subtle',

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
	highlight_groups = {
	-- 	ColorColumn = { bg = 'rose' },
 --    LineNr       = { bg = 'base' },
 --    -- CursorLineNr = { fg = colors.editor.accent,       bg = colors.editor.contrast },
 --    SignColumn   = { bg = 'base' },
 --    -- Pmenu        = { fg = colors.editor.fg,           bg = colors.editor.contrast },

    -- Borderless Telescope
    --
    TelescopeResultsBorder = { fg = palette.surface, bg = palette.surface },
    TelescopePreviewBorder = { fg = palette.surface, bg = palette.surface },
    TelescopePromptBorder  = { fg = palette.surface, bg = palette.surface },
    -- TelescopePreviewTitle = { fg = colors.editor.contrast, bg = colors.editor.contrast },
    -- TelescopeResultsTitle = { fg = colors.editor.contrast, bg = colors.editor.contrast },
    TelescopePromptNormal = { fg = palette.overlay, bg = palette.overlay },
    -- TelescopePromptBorder  = { fg = palette.surface, bg = palette.surface },
	}
}

-- set colorscheme after options
-- vim.cmd('colorscheme rose-pine')
