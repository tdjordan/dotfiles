-- local remap   = vim.api.nvim_set_keymap
local npairs  = require 'nvim-autopairs'
local Rule    = require 'nvim-autopairs.rule'
local cond    = require 'nvim-autopairs.conds'
-- local endwise = require('nvim-autopairs.ts-rule').endwise

local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local cmp = require 'cmp'
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done( { map_char = { text = '' } } ) )

npairs.setup {
  disable_filetype = {
    'TelescopePrompt'
    , 'vim'
  }
  , check_ts = true
  -- , ts_config = {
  --   lua = { 'string' }  -- do hot add a pair on string treesitter node
  --   , javascript = { 'template_sring' }
  --   , java = false      -- do not check treesitter on java
  -- }
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
