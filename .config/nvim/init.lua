---  performance
---
-- require 'profiler'

---  base
---
require 'settings'
require 'keymaps'

---  configs
init_config = function()
  require 'colorscheme'

  ---  plugin configs
  ---
  require 'configs'

  ---  lsp
  ---
  require 'lsp'
end

---  bootstrap plugins
---
require 'plugins'
-- local packer_installed = require 'plugins'.is_installed()

--if not paker_installed then
--  require 'plugins'.bootstrap_packer()
--  vim.cmd( 'autocmd User PackerComplete ++once lua init_config()' )
--else
--  init_config()
--end


