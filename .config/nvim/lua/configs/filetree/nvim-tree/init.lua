require 'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,   -- default : false
  ignore_ft_on_setup  = {},
  update_to_buf_dir   = {       -- hijacks new directory buffers ( :e dir )
    enable = true,
    auto_open = true,
  },
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  lsp_diagnostics     = true,   -- show lsp diagnostics in signcolumn ( d: false )
  update_focused_file = {       -- focus file in tree on BufEnter
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  view = {
    width = 30,
    height = 30,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}
