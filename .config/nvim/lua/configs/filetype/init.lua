-- local packer = require 'packer'
-- require 'filetype'.setup {
--   overrides = {
--     extensions = {
--       flux = 'flux'
--       , sls = 'sls'
--     },
--     function_extensions = {
--       http = function()
--         packer.loader('rest.nvim')
--       end
--       , gradle = function()
--         packer.loader('vim-gradle')
--       end
--       -- , org = function()
--       --   packer.loader('orgmode.nvim')
--       -- end
--       -- groovy = function()
--       --   packer.loader('Jenkinsfile-vim-syntax')
--       -- end
--     },
--     function_literal = {
--       Jenkinsfile = function()
--         packer.loader('Jenkinsfile-vim-syntax')
--       end
--     }
--   }
-- }
