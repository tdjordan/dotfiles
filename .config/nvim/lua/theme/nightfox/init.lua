require 'nightfox'.setup {
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath('cache') .. '/nightfox'
    -- , compile_file_suffix = "_compiled" -- Compiled file suffix
    -- , transparent = false               -- Disable setting background
    -- , terminal_colors = true            -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    -- , dim_inactive = false              -- Non focused panes set to alternative background
    -- , module_default = true             -- Default enable value for modules
    -- , colorblind = {
    --   enable = false,                   -- Enable colorblind support
    --   simulate_only = false,            -- Only show simulated colorblind colors and not diff shifted
    --   severity = {
    --     protan = 0,                     -- Severity [0,1] for protan (red)
    --     deutan = 0,                     -- Severity [0,1] for deutan (green)
    --     tritan = 0,                     -- Severity [0,1] for tritan (blue)
    --   },
    -- }

    , styles =                             -- Style to be applied to different syntax groups
      { comments = "italic"                -- Value is any valid attr-list value `:help attr-list`
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
    , inverse =                            -- Inverse highlight for different types
      { match_paren = true
      , visual = true
      -- , search = false
      }
    -- , modules = {                        -- List of various plugins and additional options
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
    -- , groups = {}
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
