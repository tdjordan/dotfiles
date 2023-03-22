local set = vim.opt
local g = vim.g

if g.started_by_firenvim then
  set.laststatus = 0

  -- g.firenvim_config = {
  --   'globalSettings': {}
  -- }
else
  set.laststatus = 3
end
