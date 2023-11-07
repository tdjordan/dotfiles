local navic = require 'nvim-navic'

navic.setup {
  -- icons = {
  --   File          = "󰈙 ",
  --   Module        = " ",
  --   Namespace     = "󰌗 ",
  --   Package       = " ",
  --   Class         = "󰌗 ",
  --   Method        = "󰆧 ",
  --   Property      = " ",
  --   Field         = " ",
  --   Constructor   = " ",
  --   Enum          = "󰕘",
  --   Interface     = "󰕘",
  --   Function      = "󰊕 ",
  --   Variable      = "󰆧 ",
  --   Constant      = "󰏿 ",
  --   String        = " ",
  --   Number        = "󰎠 ",
  --   Boolean       = "◩ ",
  --   Array         = "󰅪 ",
  --   Object        = "󰅩 ",
  --   Key           = "󰌋 ",
  --   Null          = "󰟢 ",
  --   EnumMember    = " ",
  --   Struct        = "󰌗 ",
  --   Event         = " ",
  --   Operator      = "󰆕 ",
  --   TypeParameter = "󰊄 ",
  -- },
  -- highlight = true,     -- default : false
  -- separator = " > ",
  -- depth_limit = 0,
  -- depth_limit_indicator = "..",
  -- safe_output = true
}

-- vim.o.statusline = "%t %{%v:lua.require'nvim-navic'.get_location()%}"
-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
-- vim.o.winbar = ''
