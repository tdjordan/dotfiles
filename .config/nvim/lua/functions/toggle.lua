local cmd = vim.cmd

local indent_blankline = function()
  -- require 'indent_blankline'
  -- local packer = require 'packer'
  if packer_plugins["indent-blankline.nvim"] and not packer_plugins["indent-blankline.nvim"].loaded then
    require 'packer'.loader('indent-blankline.nvim')
    vim.schedule_wrap(function()
      cmd [[ IndentBlanklineToggle ]]
    end)
  else
    cmd [[ IndentBlanklineToggle ]]
  end
end

return {
  indent_blankline = indent_blankline
}
