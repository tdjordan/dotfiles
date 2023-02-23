local fn  = vim.fn

---  bootstrap lazy.nvim
---
local init = function()
  local install_path = fn.stdpath('data') .. '/lazy/lazy.nvim'

  vim.notify('Cloning lazy.nvim ....', 'info')
  fn.delete(install_path, 'rf')
  fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    install_path
  }
end

return {
  init = init
}
