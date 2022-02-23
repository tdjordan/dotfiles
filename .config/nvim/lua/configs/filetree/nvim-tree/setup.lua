local g = vim.g
-- g.nvim_tree_indent_markers = 0
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
-- g.nvim_tree_root_folder_modifier = ':~'
-- g.nvim_tree_add_trailing = 0
g.nvim_tree_group_empty = 1
-- g.disable_window_picker = 0
-- g.nvim__tree_icon_padding = ' '
-- g.symlink_arrow = ' >> '
-- g.nvim_tree_respect_buf_cwd = 0
-- g.nvim_tree_create_inclosed_folder = 1
g.nvim_tree_window_picker_exclude = {
  filetype = {
    'notify',
    'packer',
    'qf'
  },
  buftype = {
    'terminal'
  }
}
g.nvim_tree_special_files = {
  ['init.lua'] = true,
  ['Cargo.tom'] = true,
  ['Makefile'] = true,
  ['README.md'] = true,
  ['readme.md'] = true,
}
g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 0
}
g.nvim_tree_icons = {
  default = '',
  symlink = '',
  -- git = {
  --   unstaged = "",
  --   staged = "✓",
  --   unmerged = "",
  --   renamed = "➜",
  --   untracked = "★"
  --   deleted = "",
  --   ignored = "◌"
  -- },
  -- folder = {
  --   arrow_open = ''
  --   arrow_closed = ''
  --   default = "",
  --   open = "",
  --   empty = "",
  --   empty_open = "",
  --   symlink = "",
  --   symlink_open = ""
  -- }
}
