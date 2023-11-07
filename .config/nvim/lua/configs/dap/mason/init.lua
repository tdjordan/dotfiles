local mason = require 'mason-nvim-dap'

local dap_adapters = {
  'bash'
}

mason.setup {
  ensure_installed = dap_adapters,
  automatic_installation = true,
  automatic_setup = true
}

mason.setup_handlers {}
