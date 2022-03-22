require 'nvim-tree'.setup {
  -- disable_netrw          = false,
  -- hijack_netrw           = true,
  -- open_on_setup          = false,   -- default : false
  -- ignore_buffer_on_setup = false,
  -- ignore_ft_on_setup     = {},
  auto_close             = true,
  -- auto_reload_on_write   = true,
  -- open_on_tab            = false,
  -- sort_by                = 'name', -- how files are sorted ( name | modification_time )
  -- hijack_cursor          = false,
  -- update_cwd             = false,
  -- hijack_unamed_buffer_when_opening = true
  -- hijack_directories     = {       -- hijacks new directory buffers ( :e dir )
  --   enable = true,
  --   auto_open = true,
  -- },
  diagnostics         = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {       -- focus file in tree on BufEnter
    enable      = true,
    -- update_cwd  = false,
    -- ignore_list = {}
  },
  -- system_open = {
  --   cmd  = nil,
  --   args = {}
  -- },
  -- filters = {
  --   dotfiles = false,
  --   args = {}
  -- },
  -- git = {
  --   enable = true,
  --   ignore = true,
  --   timeout =500,
  -- },
  -- view = {
  --   width = 30,
  --   height = 30,
  --   hide_root_folder = false,
  --   side = 'left',
  --   mappings = {
  --     custom_only = false,
  --     list = {}
  --   },
  --   number = false,
  --   relativenubmer = false,
  --   signcolumn = 'yes'
  -- },
  -- trash = {
  --   cmd = 'trash',
  --   require_confirm = true
  -- },
  actions = {
    change_dir = {
      enable = false,
      global = false
    },
    -- open_file = {
    --   quit_on_open = false,
    --   resize_window = false,
    --   window_picker = {
    --     enable = true,
    --     chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ12345678990',
    --     exclude = {
    --       filetype = {
    --         'notify',
    --         'packer',
    --         'qf',
    --         'diff',
    --         'fugitive',
    --         'fugitiveblame'
    --       },
    --       buftype = {
    --         'nofile',
    --         'terminal',
    --         'help'
    --       }
    --     }
    --   }
    -- }
  },
  -- log = {
  --   enable = false,
  --   truncate = false,
  --   types = {
  --     all = false,
  --     config = false,
  --     git = false
  --   }
  -- }
}
