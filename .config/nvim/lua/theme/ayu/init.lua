local colors = require 'ayu.colors'

require 'ayu'.setup {
  mirage = false,
  overrides = {
  --   -- TSFunction = { style = 'italic' },
  --   TSProperty = { style = 'italic' },
  --   TSKeyword = { style = 'italic' },
  --   -- TSKeywordFunction = { fg = colors.func, style = 'italic' },
  --   TSComment = { style = 'italic' }

    -- Boarderless Telescope
    --
    TelescopePromptBorder = { fg = colors.editor.contrast, bg = colors.editor.contrast },
    TelescopePreviewTitle = { fg = colors.editor.contrast, bg = colors.editor.contrast },
    TelescopeResultsTitle = { fg = colors.editor.contrast, bg = colors.editor.contrast },
  }
}

-- sks

-- local x = function()
-- end
