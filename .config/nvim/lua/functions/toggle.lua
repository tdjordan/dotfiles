-- local cmd = vim.cmd

local toggle = function(plugin_name, not_loaded, loaded)
  if packer_plugins[plugin_name] and not packer_plugins[plugin_name].loaded then
    require 'packer'.loader(plugin_name)
    not_loaded()
  else
    loaded()
  end
end

return {
  indent_blankline = function()
    toggle(
      'indent-blankline.nvim',
      function() vim.schedule_wrap(function() vim.cmd[[IndentBlanklineToggle]] end) end,
      function() vim.cmd[[IndentBlanklineToggle]] end
    )
  end,

  nvim_tree = function()
    toggle(
      'nvim-tree.lua',
      function() require 'nvim-tree'.open() end,
      function() require 'nvim-tree'.toggle() end
    )
  end
}
