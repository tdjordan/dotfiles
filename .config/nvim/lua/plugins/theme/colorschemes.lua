return {
  {
    'nvim-zh/colorful-winsep.nvim'
    , event = { 'WinLeave' }
    ,opts = {
      --   no_exec_files = {
      --     'packer',
      --     'TelescopePrompt',
      --     'mason',
      --     'CompetiTest',
      --     'neo-tree',
      --     'NvimTree'
      --   },
    --   anchor = {
    --     right = { height = 1, x = -1, y = -1 },
    --     left = { height = 1, x = -1, y = 0 },
    --     bottom = { width = 0, x = -1, y = 0 },
    --     up = { width = 0, x = 1, y = 0 },
    --   }
    }
    -- , config = true
    , config = function( _, opts )
      require 'colorful-winsep'.setup( opts )
    end
  },
  {
    'catppuccin/nvim'
    , keys = {
      {
        '<leader>pc', function()
          require 'telescope.builtin'.colorscheme()
        end,
        desc = 'a colorscheme'
      }
    }
    , dependencies = {
      'folke/tokyonight.nvim'
      , 'EdenEast/nightfox.nvim'
      , 'LunarVim/onedarker.nvim'
      , 'LunarVim/horizon.nvim'
      -- , 'rebelot/kanagawa.nvim'
      , 'sainnhe/everforest'
      , { 'rose-pine/neovim', name = 'rose-pine' }
      , 'AlexvZyl/nordic.nvim'
      , 'cpea2506/one_monokai.nvim'
    }
    , opts = {
      highlight_overrides = {
        all = function(colors)
          -- local prompt  = colors.overlay0
          -- local prompt  = colors.surface1
          local prompt  = colors.mantle
          local results = colors.base
          -- local results = colors.surface0
          local preview = colors.crust

          return {
            ---  Borderless Telescope
            ---
            TelescopeTitle         = { fg = prompt,  bold = true  },
            TelescopePromptNormal  = { bg = prompt                },
            TelescopePromptBorder  = { fg = prompt,  bg = prompt  },
            TelescopeResultsNormal = { bg = results               },
            TelescopeResultsBorder = { fg = results, bg = results },
            TelescopeResultsTitle  = { bg = results, fg = results },
            TelescopePreviewNormal = { bg = preview               },
            TelescopePreviewBorder = { bg = preview, fg = preview },
            TelescopePreviewTitle  = { bg = preview, fg = preview },
            TelescopeSelection     = { bg = colors.crust          },
            -- TelescopeBorder = { fg = colors.none },
            -- TelescopeSelectionCaret = { fg = colors.blue },

            ---  SignColumn
            ---
            -- SignColumn = { bg = prompt },
          }
        end
      },
      integrations = {
        -- aerial = false,
        alpha = false,
        -- barber = false,
        -- barbecue = {
        --   dim_dirname    = true, -- directory name is dimmed by default
        --   bold_basename  = true,
        --   dim_context    = false,
        --   alt_background = false,
        -- },
        -- beacon   = false,
        -- coc_nvim = false,
        -- cmp       = true,
        dashboard = false,
        -- dap = {
        --   enabled   = true,
        --   enable_ui = true
        -- },
        -- dropbar = {
        --   enabled    = false,
        --   color_mode = false
        -- },
        -- fern       = false
        -- fidget     = false
        flash = false,
        -- gitgutter  = false,
        -- gitsigns   = true,
        -- harpoon    = false,
        -- hop        = false,
        -- illuminate = {
        --   enabled = true,
        --   lsp     = false
        -- },
        -- indent_blankline = {
        --   enabled               = true,
        --   colored_indent_levels = false
        -- },
        -- leap        = false,
        -- lightspeed  = false,
        lsp_trouble = true,
        -- lspsaga     = false,
        -- markdown    = true,
        mason       = true,
        -- mini        = false,
        -- native_lsp  = {
        --   enabled = true,
        --   virtual_text = {
        --     errors      = { 'italic' },
        --     hints       = { 'italic' },
        --     warnings    = { 'italic' },
        --     information = { 'italic' },
        --   },
        --   underlines = {
        --     errors      = { 'underline' },
        --     hints       = { 'underline' },
        --     warnings    = { 'underline' },
        --     information = { 'underline' },
        --   },
        --   inlay_hints = {
        --     background = true,
        --   },
        -- },
        navic = {
          enabled   = true,
          custom_bg = 'NONE'
        },
        neotree            = true,
        -- neogit            = false,
        -- neotest           = false,
        notify             = true,
        notifier           = true,
        -- nvimtree          = true,
        octo               = true,
        -- oveseer           = false,
        -- pounce            = false,
        rainbow_delimiters = false,
        -- sandwich          = false,
        -- semantic_tokens   = true,
        symbols_outline    = true,
        -- telekasten        = false,
        telescope = {
          enabled = true,
          style   = 'nvchad'
        },
        -- treesitter         = true,
        treesitter_context = true,
        -- vim_sneak          = false,
        -- vimwiki            = false,
        which_key          = true
      }
    }
    , name = 'catppuccin'
  }
  , {
    'folke/tokyonight.nvim'
    , config = function()
      require 'theme.tokyonight'
    end
  }
  , {
    'EdenEast/nightfox.nvim'
    , config = function()
      require 'theme.nightfox'
    end
  }
  ,  {
    'sainnhe/everforest'
  }
  , {
    'LunarVim/onedarker.nvim'
    , config = function()
      require 'theme.onedarker'
    end
  }
  -- , {
  --   'LunarVim/horizon.nvim'
  -- }
  , {
    'rebelot/kanagawa.nvim'
    , lazy = false
    , priority = 1000
    , opts = {
      compile = false,             -- enable compiling the colorscheme
      undercurl = true,            -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true},
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,         -- do not set background color
      dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
      terminalColors = true,       -- define vim.g.terminal_color_{0,17}
      colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      -- overrides = function(colors) -- add/modify highlights
      --   return {}
      -- end,
      overrides = function(colors)
        local theme = colors.theme
        return {
          ---  Borderless Telescope
          ---
          TelescopeTitle         = { fg = theme.ui.special, bold = true          },
          TelescopePromptNormal  = { bg = theme.ui.bg_p1                         },
          TelescopePromptBorder  = { fg = theme.ui.bg_p1,   bg = theme.ui.bg_p1  },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim,  bg = theme.ui.bg_m1  },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1,   bg = theme.ui.bg_m1  },
          TelescopeResultsTitle  = { bg = theme.ui.bg_m1,   fg = theme.ui.bg_m1  },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim                        },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim,  fg = theme.ui.bg_dim },
          TelescopePreviewTitle  = { bg = theme.ui.bg_dim,  fg = theme.ui.bg_dim },
          TelescopeSelection     = { bg = theme.ui.bg_p2                         },

          ---  Dark Completion Popup Menu
          ---
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },

          ---  SignColumn
          ---
          SignColumn = { bg = theme.ui.bg },

          ---  WinSeparator
          ---
          WinSeparator = { fg = theme.ui.bg },

          ---  Navic Support
          ---
          NavicIconsFile = { link = "Directory" },
          NavicIconsModule = { link = "TSInclude" },
          NavicIconsNamespace = { link = "TSInclude" },
          NavicIconsPackage = { link = "TSInclude" },
          NavicIconsClass = { link = "Structure" },
          NavicIconsMethod = { link = "Function" },
          NavicIconsProperty = { link = "TSProperty" },
          NavicIconsField = { link = "TSField" },
          NavicIconsConstructor = { link = "@constructor" },
          NavicIconsEnum = { link = "Identifier" },
          NavicIconsInterface = { link = "Type" },
          NavicIconsFunction = { link = "Function" },
          NavicIconsVariable = { link = "@variable" },
          NavicIconsConstant = { link = "Constant" },
          NavicIconsString = { link = "String" },
          NavicIconsNumber = { link = "Number" },
          NavicIconsBoolean = { link = "Boolean" },
          NavicIconsArray = { link = "Type" },
          NavicIconsObject = { link = "Type" },
          NavicIconsKey = { link = "Keyword" },
          NavicIconsNull = { link = "Type" },
          NavicIconsEnumMember = { link = "TSField" },
          NavicIconsStruct = { link = "Structure" },
          NavicIconsEvent = { link = "Structure" },
          NavicIconsOperator = { link = "Operator" },
          NavicIconsTypeParameter = { link = "Identifier" },
          NavicText = { fg = theme.ui.fg },
          NavicSeparator = { fg = theme.ui.fg },
        }
      end,
      theme = "wave",              -- Load "wave" theme when 'background' option is not set
      background = {               -- map the value of 'background' option to a theme
        dark = "dragon",           -- try "dragon" !
        light = "lotus"
      },
    }
    , config = function(_, opts)
      require 'kanagawa'.setup(opts)
      vim.cmd.colorscheme { 'kanagawa' }
    end
  }
  , {
    'rose-pine/neovim'
    , name = 'rose-pine'
    , config = function()
      require 'theme.rose-pine'
    end
  }
  , {
    'AlexvZyl/nordic.nvim'
    -- , opts = {
    --   theme = 'onedark',
    -- }
  }
  , {
    'cpea2506/one_monokai.nvim'
  }
  , {
    'marko-cerovac/material.nvim'
    -- , lazy = false
    -- , event = { 'BufEnter', 'BufReadPre', 'BufNewFile' }
    -- , priority = 1000
    , config = function()
      vim.g.material_style = 'darker'

      local material = require 'material'
      local colors   = require 'material.colors'

      -- local theme = {
      --   ui = {
      --     special = '#7a8382',
      --     bg_p1   = '#282727',
      --     bg_m1   = '#1D1C19',
      --     bg_dim  = '#12120f',
      --     fg_dim  = '#C8C093',
      --   }
      -- }

      -- local theme = {
      --   ui = {
      --     -- special = '#7a8382',
      --     -- special = colors.editor.line_numbers,
      --     -- special = colors.syntax.comments,
      --     special = nil,
      --     -- bg_p1   = '#282727',
      --     bg_p1   = colors.main.black,
      --     -- bg_m1   = '#1D1C19',
      --     bg_m1   = colors.editor.bg,
      --     -- bg_dim  = '#12120f',
      --     bg_dim  = colors.editor.bg_alt,
      --     -- fg_dim  = '#C8C093',
      --     fg_dim  = colors.editor.fg_dark,
      --   }
      -- }

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
          --
          -- Available plugins:
          'dap',
          -- 'dashboard',
            -- 'eyelinger',
            -- 'fidget',
            -- 'flash',
          'gitsigns',
            -- 'harpoon',
          -- 'hop',
            -- 'illuminate',
          'indent-blankline',
          -- 'lspsaga',
          -- 'mini',
          -- 'neogit',
            -- 'neotest',
            -- 'neo-tree',
          'neorg',
            -- 'noice',
          'nvim-cmp',
          'nvim-navic',
          'nvim-tree',
          'nvim-web-devicons',
            -- 'rainbow-delimiters',
          -- 'sneak',
          'telescope',
          'trouble',
          'which-key',
        }
        , disable =
          { colored_cursor = true       -- no colored cursor
            , borders      = true       -- no boders between vertical splits
            , background   = false      -- set background
            , term_colors  = false      -- set terminal colors
            , eob_lines    = true       -- no eob lines
          }
        , high_visibility =
          { lighter = true              -- set high contrast text for lighter style
            , darker  = false             -- no  high contrast text for darker  style
          }
        -- , lualine_style = 'stealth'     -- lualine style ( 'stealth' or 'default' )
        , async_loading = true          -- faster startup ( on by default )
        , custom_colors = nil           -- override default colors
        , custom_highlights = {         -- override default highlights
          LineNr       = { fg = colors.editor.line_numbers, bg = colors.editor.contrast },
          CursorLineNr = { fg = colors.editor.accent,       bg = colors.editor.contrast },
          SignColumn   = { fg = colors.editor.fg,           bg = colors.editor.contrast },
          Pmenu        = { fg = colors.editor.fg,           bg = colors.editor.contrast },
          -- WinSeperator = { fg = '#0d0c0c' },

          -- --  Borderless Telescope
          -- --
          -- -- TelescopeTitle = { fg = colors.editor.fg_dark, bold = true },
          -- -- TelescopeTitle = { fg = '#c8c093', bg = '#0d0c0c', bold = true },
          -- TelescopeTitle = { fg = '#7a8382', bg = '#0d0c0c', bold = true },
          -- TelescopePromptNormal  = { bg = '#0d0c0c' },
          -- TelescopePromptBorder  = { fg = '#0d0c0c', bg = '#0d0c0c' },
          -- -- TelescopePromptBorder  = { fg = colors.editor.bg, bg = colors.editor.bg },
          -- -- TelescopePromptBorder  = { fg = '#282727', bg = '#282727' },
          --
          -- -- TelescopeResultsTitle  = { fg = colors.editor.bg },
          -- TelescopeResultsTitle  = { fg = '#12120f' },
          -- -- TelescopeResultsNormal = { bg = colors.editor.bg },
          -- TelescopeResultsNormal = { bg = '#12120f' },
          -- -- TelescopeResultsBorder = { fg = colors.editor.bg, bg = colors.editor.bg },
          -- TelescopeResultsBorder = { fg = '#12120f', bg = '#12120f' },
          --
          -- -- TelescopePreviewTitle  = { fg = colors.editor.contrast, bg = colors.editor.contrast },
          -- TelescopePreviewTitle  = { fg = colors.editor.contrast },
          -- -- TelescopePreviewNormal = { fg = colors.editor.contrast, bg = colors.editor.black },
          -- TelescopePreviewBorder = { fg = colors.editor.contrast, bg = colors.editor.contrast },
          -- -- TelescopePreview       = { bg = colors.editor.black },

          --  Borderless Telescope
          --
          -- TelescopeTitle = { fg = colors.editor.fg_dark}, --, bold = true },
          -- -- TelescopePromptBorder  = { fg = '#0d0c0c', bg = '#0d0c0c' },
          -- TelescopePromptNormal = { bg = '#282727' },
          -- TelescopePromptBorder  = { fg = '#282727', bg = '#282727' },
          -- -- TelescopePromptBorder = { fg = colors.editor.contrast, bg = colors.editor.contrast },
          -- TelescopePreviewBorder = { fg = colors.editor.contrast, bg = colors.editor.contrast },
          -- TelescopeResultsBorder = { fg = colors.editor.contrast, bg = colors.editor.contrast },
          -- TelescopePreviewTitle = { fg = colors.editor.contrast, bg = colors.editor.contrast },
          -- TelescopeResultsTitle = { fg = colors.editor.contrast, bg = colors.editor.contrast },

          -- ---  Borderless Telescope
          -- ---
          -- TelescopeTitle = { fg = theme.ui.special, bold = true },
          -- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          -- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          -- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          -- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          -- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

          -- --  Borderless Telescope
          -- --
          -- TelescopeTitle = { fg = theme.ui.special, bold = true },
          -- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          -- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          -- TelescopePreviewTitle = { fg = theme.ui.bg_dim, bg = theme.ui.bg_dim },
          -- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
          -- TelescopeResultsTitle = { fg = colors.editor.contrast, bg = colors.editor.contrast },
          -- TelescopeResultsBorder = { fg = colors.editor.contrast, bg = colors.editor.contrast },

          -- --  Borderless Telescope
          -- --
          -- TelescopeTitle = { fg = theme.ui.special, bold = true },
          -- TelescopePromptBorder = { fg = colors.editor.contrast, bg = colors.editor.contrast },
          -- TelescopePreviewTitle = { fg = colors.editor.contrast, bg = colors.editor.contrast },
          -- TelescopeResultsTitle = { fg = colors.editor.contrast, bg = colors.editor.contrast },

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
      -- vim.cmd.colorscheme { 'material' }
    end
  }
  ,{
    'xfyuan/nightforest.nvim'
    , lazy = true
    -- , keys = '<leader>pc'
    -- , keys = {
    --   { '<leader>pc' }
    -- }
    , config = function()
      require 'nightforest'.setup {}
    end
  }
}
