---  require 'material.colors'.main
---
local m = {
  green  = "#C3E88D",
  purple = "#C792EA",
  red    = "#F07178",
  yellow = "#FFCB6B",
}

---  require 'material.colors'.editor
---
local e = {
  accent    = "#FF9800",
  -- bg        = "#212121",
  bg_o      = "#212121",
  bg        = "#181616",
  bg_alt    = "#1A1A1A",
  disabled  = "#474747",
  highlight = "#3F3F3F",
  title     = "#EEFFFF",
}

---  require 'material.colors'.syntax
---
local s = {
  comments = "#515151",
}

local bg = function()
  return {
    fg = s.comments,
    -- bg = e.bg_alt
    -- bg = e.bg_o
    bg = e.bg
  }
end

return {
  normal = {
    a = { fg = e.accent, bg = e.highlight },
    b = { fg = e.title, bg = e.bg_alt },
    -- c = { fg = s.comments, bg = e.bg },
    -- c = { fg = s.comments, bg = e.bg_o },
    c = function() return bg() end,
  },

  insert = {
    a = { fg = m.green, bg = e.highlight },
    b = { fg = e.title, bg = e.bg_alt },
  },

  visual = {
    a = { fg = m.purple, bg = e.highlight },
    b = { fg = e.title, bg = e.bg_alt },
  },

  replace = {
    a = { fg = m.red, bg = e.highlight },
    b = { fg = e.title, bg = e.bg_alt },
  },

  command = {
    a = { fg = m.yellow, bg = e.highlight },
    b = { fg = e.title, bg = e.bg_alt },
  },

  inactive = {
    a = { fg = e.disabled, bg = e.bg },
    b = { fg = e.disabled, bg = e.bg },
    -- c = { fg = e.disabled, bg = e.bg }
    -- c = { fg = e.disabled, bg = e.bg_o }
    c = function() return bg() end,
  }
}
