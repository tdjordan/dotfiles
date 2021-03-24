--  efm-langserver configuration
--
--      brew install efm-langserver
--
local util = require 'lspconfig/util'

local sh = {
  lintCommand = 'shellcheck -f gcc -x',
  lintSource  = 'shellcheck',
  lintFormats = {
    '%f:%l:%c: %trror: %m',
    '%f:%l:%c: %tarning: %m',
    '%f:%l:%c: %tote: %m',
  }
}

local languages = {
  sh = { sh }
}

require 'lspconfig'.efm.setup {
  root_dir  = util.root_pattern( ".git", vim.fn.getcwd() ),

  filetypes = vim.tbl_keys( languages ),
  settings  = {
    rootMarkers = { '.git/', vim.fn.getcwd() },
    languages   = languages
  },

  init_options = {
    --documentLinting   = true,
    documentFormating = true,
    codeAction        = true
  },
}
