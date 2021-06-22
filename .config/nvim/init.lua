---  performance
---
-- require 'profiler'

-- vim.defer_fn(vim.schedule_wrap(function()
  ---  base
  ---
  require 'settings'
  require 'keymaps'

  ---  bootstrap plugins
  ---
  require 'plugins'

  -- vim.defer_fn(function()
  --   vim.cmd [[
  --     PackerLoad gruvbox-material
  --     silent! bufdo e
  --   ]]
  -- end, 15)
-- end), 0)
