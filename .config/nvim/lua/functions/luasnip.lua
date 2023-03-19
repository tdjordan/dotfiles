local ls = require 'luasnip'

local next = function()
  if ls.expand_or_locally_jumpable() then
    ls.expand_or_jump()
  end
end

local jump_back = function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end

return {
  next = next
  , jump_back = jump_back
}
