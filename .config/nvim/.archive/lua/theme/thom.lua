local lush = require 'lush'
local hsl  = lush.hsl

-- local bf = 'bold'
local it = 'italic'
-- local un = 'underline'

-- https://www.colorcodehex.com/3c3836.html
local base = {
    hsl282828 = hsl(  0,  0, 16 )     -- hsl('#282828')
  , hsl3c3836 = hsl( 20,  5, 22 )     -- hsl('#3c3836')
  , hsld8a657 = hsl( 37, 62, 59 )     -- hsl('#d8a657')
  , hsla9b665 = hsl( 70, 36, 55 )     -- hsl('#a9b665')
  , hslea6962 = hsl(  3, 76, 65 )     -- hsl('#ea6962')
}

local palette = {
  dark = {
      black            = hsl(   0,  0,  0 ) -- hsl('#000000')
    , bg               = base.hsl282828     -- hsl('#282828')
    , bg0              = hsl( 184, 29, 10 ) -- hsl('#1d2021')
    , bg1              = base.hsl282828     -- hsl('#282828')
    , bg2              = base.hsl282828     -- hsl('#282828')
    , bg3              = base.hsl3c3836     -- hsl('#3c3836')
    , bg4              = base.hsl3c3836     -- hsl('#3c3836')
    , bg5              = hsl(  22,  7, 29 ) -- hsl('#504945')
    , bg_statusline1   = base.hsl282828     -- hsl('#282828')
    , bg_statusline2   = hsl(  20,  3, 19 ) -- hsl('#32302f')
    , bg_statusline3   = hsl(  22,  7, 29 ) -- hsl('#504945')
    , bg_diff_green    = hsl(  69, 35, 26 ) -- hsl('#32361a')
    , bg_visual_green  = hsl( 125, 10, 22 ) -- hsl('#333e34')
    , bg_diff_red      = hsl(   2, 33, 18 ) -- hsl('#3c1f1e')
    , bg_visual_red    = hsl(   3, 34, 27 ) -- hsl('#442e2d')
    , bg_diff_blue     = hsl( 190, 62, 14 ) -- hsl('#0d3138')
    , bg_visual_blue   = hsl( 180, 12, 21 ) -- hsl('#2e3b3b')
    , bg_visual_yellow = hsl(  38, 27, 22 ) -- hsl('#473c29')
    , bg_current_word  = hsl(  20,  3, 19 ) -- hsl('#32302f')
    , fg               = hsl('#ebdbb2')
    , fg0              = hsl(  38, 41, 71 ) -- hsl('#d4be98')
    , fg1              = hsl(  38, 47, 75 ) -- hsl('#ddc7a1')
    , red              = base.hslea6962     -- hsl('#ea6962')
    , orange           = hsl(  24, 76, 61 ) -- hsl('#e78a4e')
    , yellow           = base.hsld8a657     -- hsl('#d8a657')
    , green            = base.hsla9b665     -- hsl('#a9b665')
    , aqua             = hsl( 112, 25, 61 ) -- hsl('#89b482')
    , blue             = hsl( 167, 23, 59 ) -- hsl('#7daea3')
    , purple           = hsl( 344, 47, 68 ) -- hsl('#d3869b')
    , bg_red           = base.hslea6962     -- hsl('#ea6962')
    , bg_green         = base.hsla9b665     -- hsl('#a9b665')
    , bg_yellow        = base.hsld8a657     -- hsl('#d8a657')
    , grey0            = hsl(  28, 11, 44 ) -- hsl('#7c6f64')
    , grey1            = hsl(  30, 12, 51 ) -- hsl('#928374')
    , grey2            = hsl(  35, 17, 59 ) -- hsl('#a89984')
  }
}

local p = palette.dark

return lush( function()
  return {
    -- Normal         { bg = p.black.lighten(7), fg = p.fg  }
    -- Normal         { bg = p.bg.darken(7), fg = p.fg                }
    Normal         { bg = p.bg.darken(49), fg = p.fg                }
    -- Normal         { bg = p.bg.darken(9), fg = p.fg                }
    -- Normal         { bg = p.bg0.lighten(9), fg = p.fg0 }
    , Whitespace   { fg = p.grey0                        }  -- listchars
    -- , Whitespace   { fg = Normal.fg.darken( 40 )         }  -- listchars
    , Comment      { fg = p.grey2, gui = it              }
    -- , Comment      { Whitespace, gui = it                }
    , Terminal     { fg = Normal.fg                      }
    , EndOfBuffer  { Normal, bg = Normal.bg.lighten(2)           }
    , SignColumn   { Normal                              }
    , Toolbarline  { Normal                              }
    , IncSearch    { bg = p.bg0, fg = p.bg_red           }
    , Search       { IncSearch, fg = p.bg_green          }
    , CursorLine   { bg = Normal.bg.lighten(2)           }  -- gui = un
    , CursorColumn { Normal                              }
    , LineNr       { fg = p.grey0 }
    , CursorLineNr { fg = p.grey2 }
    , WarningMsg   { fg = p.yellow --[[, gui = bf]] }
    , Pmenu        { bg = p.bg3, fg = p.fg1 }
    , PmenuSbar    { fg = Pmenu.fg }

    ---  Indent Blankline
    ---
    -- , IndentBlanklineChar               { }
    -- , IndentBlanklineSpaceChar          { }
    -- , IndentBlanklineSpaceCharBlankline { }
    -- , IndentBlanklineContextChar        { }

    ---  Tree Sitter
    ---
    , TSField   { Normal }
  }
end)

-- cmd ([[
--  augroup! lushify-theme-file
--    au!
--    au  BufferReadPost init.lua lua require('lush').ify()
--  augroup  END
-- ]])
