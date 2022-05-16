require 'nightfox'.setup {
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath('cache') .. '/nightfox'
    , compile_file_suffix = '_compiled'
    -- , transparent = false
    -- , terminal_colors = true
    -- , dim_inactive = false
    , styles =
      { comments = 'italic'
      -- , conditionals = 'NONE'
      -- , constants = 'NONE'
      , functions = 'italic'
      , keywords = 'italic'
      -- , numbers = 'NONE'
      -- , operators = 'NONE'
      -- , strings = 'NONE'
      -- , types = 'NONE'
      , variables = 'italic'
      }
    , inverse =
      { match_paren = true
      , visual = true
      -- , search = false
      }
    -- , modules = {
    --   -- ...
    -- }
    -- , palettes = {
    --   duskfox = {
    --     bg1 = "#000000",
    --     bg0 = "#1d1d2b"
    --   }
    -- }
    -- , specs = {
    --   duskfox = {
    --     inactive = "#000000",
    --   }
    -- }
  }
}

    ---  Replace these with ( palettes & groups )
    -- , colors =
    --   { red = '#ff0000'
    --     , bg_alt = '#000000'
    --   }
    -- , hlgroup =
    --   { TSPunctDelimiter = { fg = "${red}" }
    --   , LspCodeLens = { bg = '#000000', style = 'italic' }
    -- }
