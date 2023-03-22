-- local dap = require 'dap'

-- dap.defaults.fallback.external_terminal = {
--   command = '/usr/local/bin/alacritty',
--   args = { '-e' }
-- }

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
