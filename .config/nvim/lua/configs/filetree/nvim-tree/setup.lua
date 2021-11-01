local g = vim.g
-- g.nvim_tree_update_cwd = 1
-- g.nvim_tree_quit_on_open = 0
g.nvim_tree_git_hl = 1
g.nvim_tree_group_empty = 1
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
  --   default = "",
  --   arrow_open = ''
  --   arrow_closed = ''
  --   open = "",
  --   empty = "",
  --   empty_open = "",
  --   symlink = "",
  --   symlink_open = ""
  -- }
      -- \ 'folder': {
      -- \   'arrow_open':   "",
      -- \   'arrow_closed': "",
      -- \   'default':      "",
      -- \   'open':         "",
      -- \   'empty':        "",
      -- \   'empty_open':   "",
      -- \   'symlink':      "",
      -- \   'symlink_open': "",
      -- \  },
      -- \  'lsp': {
      -- \    'hint': "",
      -- \    'info': "",
      -- \    'warning': "",
      -- \    'error': "",
      -- \  }
}
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
-- g.nvim_tree_special_files = {
--   ['init.lua'] = true,
--   ['Cargo.tom'] = true,
--   Makefile = true,
--   ['README.md'] = true,
--   ['readme.md'] = true,
-- }
