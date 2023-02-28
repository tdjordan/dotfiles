return {
  'marko-cerovac/material.nvim'
  , lazy = false
  , priority = 1000
  -- , keys = {
  --   { "<leader>pc", function() require 'telescope.builtin'.colorscheme() end, desc = 'a colorscheme' }
  -- }
  , config = function()
    vim.g.material_style = 'darker'

    local material = require 'material'
    local colors   = require 'material.colors'

    material.setup {
      contrast =
        { terminal            = false -- no  contrast for the built-in terminal
          , sidebars            = false -- no  contrast for sidebars
          , floating_windows    = true  -- set contrast for floating windows
          -- , line_numbers        = true  -- set dark background for line numbers
          -- , sign_column         = true  -- set dark background for sign column
          , cursor_line         = true  -- set dark background for cursor line
          , non_current_windows = false -- set dark background for non-current windows
          -- , popup_menu          = false -- set light background for popup menu
          , filetypes           =
            { 'terminal'                -- set dark background for terminal
              , 'packer'                  -- set dark background for packer
              , 'qf'                      -- set dark background for quick fix
              -- , 'dapui_breakpionts'
            }
        }
      , styles =
        { comments  = { italic = true  }
          , strings   = { italic = false }
          , keywords  = { italic = true  }
          , functions = { italic = true  }
          , variables = { italic = false }
          , operators = { italic = true  }
          , types     = { italic = true  }
        }
      , plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        "dap",
        -- "dashboard",
        "gitsigns",
        -- "hop",
        "indent-blankline",
        -- "lspsaga",
        -- "mini",
        -- "neogit",
        "nvim-cmp",
        "nvim-navic",
        "nvim-tree",
        "nvim-web-devicons",
        -- "sneak",
        "telescope",
        "trouble",
        "which-key",
      }
      , disable =
        { colored_cursor = true       -- no colored cursor
          , borders        = true       -- no boders between vertical splits
          , background     = false      -- set background
          , term_colors    = false      -- set terminal colors
          , eob_lines      = true       -- no eob lines
        }
      , high_visibility =
        { lighter = true              -- set high contrast text for lighter style
          , darker  = false             -- no  high contrast text for darker  style
        }
      , lualine_style = 'stealth'     -- lualine style ( 'stealth' or 'default' )
      , async_loading = true          -- faster startup ( on by default )
      , custom_colors = nil           -- override default colors
      , custom_highlights = {         -- override default highlights
        LineNr       = { fg = colors.editor.line_numbers, bg = colors.editor.contrast },
        CursorLineNr = { fg = colors.editor.accent,       bg = colors.editor.contrast },
        SignColumn   = { fg = colors.editor.fg,           bg = colors.editor.contrast },
        Pmenu        = { fg = colors.editor.fg,           bg = colors.editor.contrast },

        --  Borderless Telescope
        --
        TelescopePromptBorder = { fg = colors.editor.contrast, bg = colors.editor.contrast },
        TelescopePreviewTitle = { fg = colors.editor.contrast, bg = colors.editor.contrast },
        TelescopeResultsTitle = { fg = colors.editor.contrast, bg = colors.editor.contrast },

        --  Incline
        --
        -- InclineNormal =   { fg = "#FC56B1"             , bg = colors.editor.contrast },
        -- InclineNormalNC = { fg = colors.editor.fg      , bg = colors.editor.contrast },
        -- InclineNormal =   { fg = colors.main.darkpurple , bg = colors.editor.contrast },
        InclineNormal =   { fg = colors.main.darkpurple , bg = colors.main.black      },
        InclineNormalNC = { fg = colors.main.darkpurple , bg = colors.editor.bg       },
      }
    }
    vim.cmd [[colorscheme material]]
  end
}
