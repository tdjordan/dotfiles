-- if packer_plugins['doom-one.nvim'] and not packer_plugins['doom-one.nvim'].loaded then
--   require 'packer'.loader('doom-one.nvim')
-- end

require 'doom-one'.setup {
  cursor_coloring = true,
  terminal_colors = true,
  italic_comments = true,
  enable_treesitter = true,
  transparent_background = false,
  pumblend = {
    enable = false,
    transparent_amount = 20,
  },
  plugins_integrations = {
    -- neorg = true,
    barber = true,
    bufferline = false,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    neogit = true,
    nvim_tree = true,
    startify = true,
    whichkey = true,
    indent_blankline = true,
    vim_illuminate = true,
    lspsaga = false,
  },
}
