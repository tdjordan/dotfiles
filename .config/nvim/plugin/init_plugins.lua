local fn  = vim.fn
local cmd = vim.cmd
local make_command = vim.api.nvim_create_user_command

local packer_installed, _ = pcall(cmd, [[packadd packer.nvim]])
local packer_compiled_fn  = fn.stdpath('config')..'/lua/packer_compiled.lua'
local packer_compiled     = fn.filereadable(packer_compiled_fn) == 1

_ = (not packer_installed or not packer_compiled) and require 'bootstrap'
-- if not packer_installed or not packer_compiled then
--   require 'bootstrap'
-- end

local ok, _ = pcall( require, 'impatient' )
if ok then
  vim.notify "impatient loaded"
end
-- require 'impatient'.enable_profile()
local packer_compiled_post_boot = fn.filereadable(packer_compiled_fn) == 1
_ = packer_compiled_post_boot and require 'packer_compiled'
-- if packer_compiled_post_boot then
--   require 'packer_compiled'
-- end

make_command( "PackerSync" , function()
    require 'plugins'.init_packer()
    require 'packer'.sync()
  end
  , {}
)

make_command( "PackerCompile" , function()
    require 'plugins'.init_packer()
    require 'packer'.compile()
  end
  , {}
)

make_command( "PackerClean" , function()
    require 'plugins'.init_packer()
    require 'packer'.clean()
  end
  , {}
)

make_command( "PackerProfile" , function()
    require 'plugins'.init_packer()
    require 'packer'.profile_output()
  end
  , {}
)

make_command( "PackerStatus" , function()
    require 'plugins'.init_packer()
    require 'packer'.status()
  end
  , {}
)

-- cmd [[ silent! command PackerSync    lua require('plugins').init_packer() require('packer').sync()           ]]
-- cmd [[ silent! command PackerCompile lua require('plugins').init_packer() require('packer').compile()        ]]
-- cmd [[ silent! command PackerUpdate  lua require('plugins').init_packer() require('packer').update()         ]]
-- cmd [[ silent! command PackerInstall lua require('plugins').init_packer() require('packer').install()        ]]
-- cmd [[ silent! command PackerClean   lua require('plugins').init_packer() require('packer').clean()          ]]
-- cmd [[ silent! command PackerProfile lua require('plugins').init_packer() require('packer').profile_output() ]]
-- cmd [[ silent! command PackerStatus  lua require('plugins').init_packer() require('packer').status()         ]]
