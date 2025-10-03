-- local remap   = vim.keymap.set
local npairs  = require 'nvim-autopairs'
local Rule    = require 'nvim-autopairs.rule'
local cond    = require 'nvim-autopairs.conds'
local endwise = require 'nvim-autopairs.ts-rule'.endwise

-- local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
-- local cmp = require 'cmp'
-- cmp.event:on(
--   'confirm_done'
--   , cmp_autopairs.on_confirm_done()
-- )

npairs.setup {
  disable_filetype = {
    'TelescopePrompt'
    , 'vim'
  }
  -- , enable_bracket_in_quote = false
  -- , enable_abbr = true
  , check_ts = true
  -- , break_undo = true
  -- , ts_config = {
  --   lua = { 'string' }  -- do hot add a pair on string treesitter node
  --   , javascript = { 'template_string' }
  --   , java = false      -- do not check treesitter on java
  -- }
  -- , fast_wrap = {
  --   map             = '<M-e>',
  --   chars           = { '{', '[', '(', '"', "'" },
  --   pattern         = [=[[%'%"%>%]%)%}%,]]=],
  --   end_key         = '$',
  --   keys            = 'qwertyuiopzxcvbnmasdfghjkl',
  --   check_comma     = true,
  --   manual_position = true,
  --   highlight       = 'Search',
  --   highlight_grey  = 'Comment'
  -- },
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

npairs.add_rules {
  endwise('then$', 'end', 'cue', 'if_statement')
}
npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
