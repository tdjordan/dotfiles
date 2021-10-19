-- local remap   = vim.api.nvim_set_keymap
local npairs  = require 'nvim-autopairs'
local Rule    = require 'nvim-autopairs.rule'
local cond    = require 'nvim-autopairs.conds'
-- local endwise = require('nvim-autopairs.ts-rule').endwise

require 'nvim-autopairs.completion.cmp'.setup {
  map_cr = true         -- map <cr> on insert mode
  , map_complete = true -- it will autoinsert '(' after select function or method item
  , auto_select = false -- auto select first item
  , insert = false      -- use insert conrim behavior instead of replace
  , map_char = {        -- modifies the function or method delimiter by filetype
    all = '(',
    tex = '{'
  }
}

npairs.setup {
  disable_filetype = {
    'TelescopePrompt'
    , 'vim'
  }
  , check_ts = true
}

-- require 'nvim-treesitter.configs'.setup {
--   autopairs = {
--     enable = true
--   }
-- }

-- require 'nvim-treesitter.configs'.setup {
--   autotag = {
--     enable = true
--   }
-- }

npairs.add_rules {
  Rule(' ', ' ')
    :with_pair(function(opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),

  Rule('( ', ' )')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%)') ~= nil
    end)
    :use_key(')'),

  Rule('{ ', ' }')
    :with_pair(function() return false end)
    :with_move(function(opts)
      return opts.prev_char:match('.%}') ~= nil
    end)
    :use_key('}'),

  -- Rule('{', '}')
  --   :end_wise(function() return true end),

  -- Rule('[ ', ' ]')
    -- :with_pair(function() return false end)
    -- :with_move(function(opts)
    --   return opts.prev_char:match('.%]') ~= nil
    -- end)
    --
  Rule('', ' ]')
    :with_pair(cond.none())
    :with_move(function(opts) return opts.char == ']' end)
    :with_cr(cond.none())
    :with_del(cond.none())
    :use_key(']'),

  -- , Rule('( ', ' )')
  --   :with_pair(function() return false end)
  --   :with_move(function() return true end)
  --   :use_key(")")

  -- , endwise('then$', 'end', 'lua', 'if_statement')
  -- , endwise('then$', 'end', 'lua', nil)
  -- endwise('function.*%(.*%)$', 'end', 'lua', { 'function_definition', 'local_function', 'function' })
-- npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
}

npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
