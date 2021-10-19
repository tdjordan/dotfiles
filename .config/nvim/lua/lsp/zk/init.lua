local common = require 'lsp.common'

--  zk configuration
--
--      https://github.com/megalithic/zk.nvim
--        https://github.com/mickael-menu/zk/blob/main/docs/editors-integration.md
--
local configs = require 'lspconfig/configs'

configs.zk = {
  default_config = {
    cmd = { 'zk', 'lsp' }
    , filetypes = { 'markdown', 'md', 'markdown.pandoc' }
    -- , get_language_id = function() return 'markdown' end
    , root_dir = function() return vim.loop.cwd() end
    , settings = {}
  }
}

require 'lspconfig'.zk.setup {

-- }

-- require 'zk'.setup {
  on_attach = common.on_attach
  , capabilities = common.capabilities
  , flags = common.flags
  , debug = false
  , log = true
  , default_keymaps = true
  , default_notebook_path = vim.env.ZK_NOTEBOOK_DIR or ""
  -- , fuzzy_finder = 'telescope'
  , fuzzy_finder = 'fzf'
  , link_format = 'markdown'
}

-- require 'telescope'.load_extension('zk_list')
