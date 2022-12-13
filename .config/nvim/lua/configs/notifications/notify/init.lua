require 'notify'.setup {
  -- For stages that change opacity this is treated as the highlight behind the window
  -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
  -- background_colour = "Normal",
  -- background_colour = "#000000",

  -- fps = 30,

  -- Icons for the different levels
  -- icons = {
    -- ERROR = "",
    -- WARN = "",
    -- INFO = "",
    -- DEBUG = "",
    -- TRACE = "✎",
  -- },

  -- level = 2,
  -- minimum_width = 50,
  -- render = 'default',

  -- Animation style (see below for details)
  -- stages = "fade_in_slide_out",
  stages = "slide",

  -- Default timeout for notifications
  -- timeout = 5000,
  -- top_down = true,
}

-- vim.notify = require 'notify'
