require 'nvim-tree'.setup {
  -- auto_reload_on_write              = true,
  -- disable_netrw                     = false,
  -- hijack_cursor                     = true,
  -- hijack_netrw                      = true,
  -- hijack_unnamed_buffer_when_opening = false,
  -- ignore_buffer_on_setup            = false,
  -- open_on_setup                     = false,      -- default : false
  -- open_on_setup_file                = false,
  -- sort_by                           = 'name',     -- how files are sorted ( name | modification_time | case_sensitive )
  -- root_dirs                         = {},
  -- prefer_startup_root               = false,
  -- sync_root_with_cwd                = false,
  -- reload_on_bufenter                = false,
  -- respect_buf_cwd                   = false,
  -- on_attach                         = 'disabled', -- function(bufnr). If nil, will use the deprecated mapping strategy
  -- select_prompts                    = false,
  -- view = {
  --   centralize_selection         = false,
  --   width                        = 30,
  --   height                       = 30,
  --   hide_root_folder             = false,
  --   side                         = 'left',
  --   preserve_window_propportions = false,
  --   number                       = false,
  --   relativenubmer               = false,
  --   signcolumn                   = 'yes',
  --   float = {
  --     enable = false,
  --     quit_on_focus_loss = true,
  --     open_win_config = {
  --       relative = 'editor',
  --       border   = 'rounded',
  --       width    = 30,
  --       height   = 30,
  --       row      = 1,
  --       col      = 1
  --     }
  --   }
  -- },
  renderer = {
    -- add_trailing = false,
    group_empty = true,
    highlight_git = true,
    -- full_name = false,
    ---  highlight_opened_files
    -- 0 --> "none"
    -- 1 --> "icon"
    -- 2 --> "name"
    -- 3 --> "all"
    highlight_opened_files = "all",
    root_folder_label = ":~:s?$?/..?",
    indent_width = 2,
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "└ ",
        edge   = "│ ",
        item   = "│ ",
        bottom = "─",
        none   = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = 'before',
      padding = ' ',
      -- g.nvim_tree_symlink_arrow = ' >> '
      symlink_arrow = " ➛ ",
      show = {
        file         = true,
        folder       = true,
        folder_arrow = false,
        git          = true
      },
      glyphs = {
        default = '', -- ,
        symlink = '',
        folder = {
          -- arrow_closed = '',
          arrow_closed = '',
          -- arrow_open = '',
          arrow_open = '',
          -- default = "",
          default = '',
          -- open = "",
          open = '',
          -- empty = "",
          empty = '',
          -- empty_open = "",
          empty_open = '',
          -- symlink = "",
          symlink = '',
          -- symlink_open = ""
          symlink_open = '',
        },
        git = {
          --   unstaged = "",
          unstaged = '✗',
          --   staged = "✓",
          staged = '✓',
          --   unmerged = "",
          unmerged = '',
          --   renamed = "➜",
          renamed = '➜',
          --   untracked = "★"
          untracked = '★',
          --   deleted = "",
          deleted = '',
          --   ignored = "◌"
          ignored = '◌',
        },
      }
    },
    special_files = {
      'init.lua',
      'Cargo.tom',
      'Makefile',
      'README.md',
      'readme.md',
    }
  },
  -- hijack_directories     = {       -- hijacks new directory buffers ( :e dir )
  --   enable = true,
  --   auto_open = true
  -- },
  update_focused_file = {       -- focus file in tree on BufEnter
    enable      = true,
    -- debounce_delay = 15,
    -- update_root = false,
    -- ignore_list = {}
  },
  -- ignore_ft_on_setup     = {},
  -- system_open = {
  --   cmd  = '',
  --   args = {}
  -- },
  diagnostics         = {
    enable = true,
    show_on_dirs = false,
    show_on_open_dirs = true,
    -- debounce_delay = 50,
    icons = {
      hint = "󰌶",    -- hint = "",
      info = "",    -- info = "",
      warning = "", -- warning = "",
      error = "󰅚",   -- error = "",
    }
  },
  -- filters = {
  --   dotfiles = false,
  --   git_clean = false,
  --   no_buffer = false,
  --   custom = {},
  --   exclude = {}
  -- },
  -- filesystem_watchers = {
  --   enable = false,
  --   debounce_delay = 50,
  --   ignore_dirs = {}
  -- },
  -- git = {
  --   enable = true,
  --   ignore = true,
  --   show_on_dirs = true,
  --   show_on_open_dirs = true,
  --   timeout = 400,
  -- },
  actions = {
    -- use_system_clipboard = true,
    change_dir = {
      enable = false,
      -- global = false,
      -- restrict_above_cwd = false
    },
    -- expand_all = {
    --   max_folder_discovery = 300,
    -- },
    -- open_file = {
    --   quit_on_open = false,
    --   resize_window = true,
    --   window_picker = {
    --     enable = true,
    --     picker = 'default'
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
    -- },
    -- remove_file = {
    --   close_window = true
    -- }
  },
  -- trash = {
  --   cmd = 'trash',
  --   require_confirm = true
  -- },
  -- live_filter = {
  --   prefix = "[FILTER]: ",
  --   always_show_folders = true
  -- },
  -- tab = {
  --   sync = {
  --     open = false,
  --     close = false,
  --     ignorfe = {}
  --   }
  -- },
  -- log = {
  --   enable = false,
  --   truncate = false,
  --   types = {
  --     all = false,
  --     config = false,
  --     copy_paste = false,
  --     dev = false,
  --     diagnostics = false,
  --     git = false,
  --     profile = false,
  --     watcher = false
  --   }
  -- }
}

---  Close neovim when the last window is only the filetree
---
local api = vim.api
api.nvim_create_autocmd( 'BufEnter', {
  group = api.nvim_create_augroup( 'CloseNvimTreeIfLastBuf', { clear = true } ),
  nested = true,
  callback = function()
    if #api.nvim_list_wins() == 1 and api.nvim_buf_get_name(0):match('NvimTree_') ~= nil then
      vim.cmd [[quit]]
    end
  end
})
