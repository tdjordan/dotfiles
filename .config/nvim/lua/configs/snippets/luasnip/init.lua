local ls = require 'luasnip'

local s = ls.snippet
local t = ls.text_node
local i = ls.i -- insert_mode
-- local d = ls.dynamic_mode
-- local c = ls.choice_mode
-- local sn = ls.snippet_form_nodes

local newline = function(text)
  return t { "", text }
end

-- ls.add_snippets (
--   'all', {
--     s('baha', {
--       t('wada wada')
--     })
--   }
-- )
--
-- ls.add_snippets (
--   'lua', {
--     lf = {
--       "local ", i(i), " = function(", i(2), ")", newline "  ", i(0), newline "end"
--     }
--   }
-- )

ls.snippets = {
  all = {
    s('baha', {
      t('wada wada')
    })
  },

  lua = {
    lf = {
      "local ", i(i), " = function(", i(2), ")", newline "  ", i(0), newline "end"
    }
  }
}
