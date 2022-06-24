-- local packer_installed, _ = pcall(vim.cmd, [[packadd packer.nvim]])
-- local telescope_loaded, _ = pcall(vim.cmd, [[packadd telescope.nvim]])
--
-- if telescope_loaded then
--   print('telescope loaded')
-- else
--   print('telescope not loaded')
-- end
--
-- if packer_installed then
--   print('packer loaded')
--   require 'telescope'.load_extension('packer')
-- else
--   print('packer not loaded')
-- end

vim.cmd [[ packadd packer.nvim ]]
require 'telescope'.load_extension 'packer'
-- require 'packer'
-- require 'telescope'.setup {
--   extensions = {
--     packer = {
--       theme = 'ivy'
--       -- , layout_config = {
--       --   height = .5
--       -- }
--     }
--   }
-- }
