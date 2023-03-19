-- vim.cmd.colorscheme { 'onedarker' }

local colors = require 'material.colors'

local cmp_highlights = {
  CmpItemAbbrMatch      = { fg = colors.paleblue, style = 'bold' } ,
  CmpItemKindText       = { fg = colors.red                      } ,
  CmpItemKindMethod     = { fg = colors.blue                     } ,
  CmpItemKindFunction   = { fg = colors.blue                     } ,
  CmpItemKindContructor = { fg = colors.purple                   } ,
  CmpItemKindField      = { fg = colors.cyan                     } ,
  CmpItemKindVariable   = { fg = colors.yellow                   } ,
  CmpItemKindClass      = { fg = colors.yellow                   } ,
  CmpItemKindInterface  = { fg = colors.yellow                   } ,
  CmpItemKindConstant   = { fg = colors.yellow                   } ,
  CmpItemKindModule     = { fg = colors.red                      } ,
  CmpItemKindProperty   = { fg = colors.purple                   } ,
  CmpItemKindKeyword    = { fg = colors.cyan                     } ,
  CmpItemKindFile       = { fg = colors.title                    } ,
  CmpItemKindFolder     = { fg = colors.title                    } ,
  CmpItemKindSnippet    = { fg = colors.green                    } ,
}

local highlight = function( group, color )
  local style = color.style and 'gui=' .. color.style or 'gui=NONE'
  local fg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
  local bg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
  local sp = color.sp and 'guisp=' .. color.sp or ''

  local hi = 'highlight ' .. group .. ' ' .. style .. ' ' .. fg .. ' ' .. bg .. ' ' .. sp

  -- print( hi )
  vim.cmd( hi )
  if color.link then
    vim.cmd( 'highlight! link ' .. group .. ' ' .. color.link )
  end
end

for group, hl_colors in pairs ( cmp_highlights ) do
  -- print( vim.inspect( hl_colors ) )
  highlight( group, hl_colors )
end
