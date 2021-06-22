local remap   = vim.api.nvim_set_keymap
local npairs  = require 'nvim-autopairs'
local Rule    = require 'nvim-autopairs.rule'
-- local endwise = require('nvim-autopairs.ts-rule').endwise

-- -- skip it, if you use another global object
_G.MUtils= {}

vim.g.completion_confirm_key = ""

MUtils.completion_confirm = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info()['selected'] ~= -1 then
      return vim.fn['compe#confirm'](npairs.esc("<cr>"))
    else
      return npairs.esc("<cr>")
    end
  else
    return npairs.autopairs_cr()
  end
end

remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})

npairs.setup({
  disable_filetype = {
    'TelescopePrompt'
    , 'vim'
  }
})

require 'nvim-treesitter.configs'.setup {
  autopairs = {
    enable = true
  }
}

npairs.add_rules {
  Rule(' ', ' ')
    :with_pair(function(opts)
      local pair = opts.line:sub(opts.col, opts.col + 1)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end)

  -- , Rule('( ', ' )')
  --   :with_pair(function() return false end)
  --   :with_move(function() return true end)
  --   :use_key(")")

  -- , endwise('then$', 'end', 'lua', 'if_statement')
  -- , endwise('then$', 'end', 'lua', nil)
}
