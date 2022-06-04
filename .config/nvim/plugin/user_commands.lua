local make_command = vim.api.nvim_create_user_command

make_command( 'PackerSync' , function()
    require 'plugins'.init_packer()
    require 'packer'.sync()
  end
  , {}
)

make_command( 'PackerCompile' , function()
    require 'plugins'.init_packer()
    require 'packer'.compile()
  end
  , {}
)

make_command( 'PackerClean' , function()
    require 'plugins'.init_packer()
    require 'packer'.clean()
  end
  , {}
)

make_command( 'PackerProfile' , function()
    require 'plugins'.init_packer()
    require 'packer'.profile_output()
  end
  , {}
)

make_command( 'PackerStatus' , function()
    require 'plugins'.init_packer()
    require 'packer'.status()
  end
  , {}
)
