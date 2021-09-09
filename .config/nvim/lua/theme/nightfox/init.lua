local nightfox = require 'nightfox'

nightfox.setup({
  fox = 'nordfox'
  , styles =
    { comments = 'italic'
    , keywords = 'italic'
    , functions = 'italic'
  }
  , inverse =
    { match_paren = true
    , visual = true
    -- , search = true
  }
  , colors =
    { red = '#ff0000'
    , bg_alt = '#000000'
  }
  , hlgroup =
    { TSPunctDelimiter = { fg = "${red}" }
    , LspCodeLens = { bg = '#000000', style = 'italic' }
  }
})

nightfox.load()
