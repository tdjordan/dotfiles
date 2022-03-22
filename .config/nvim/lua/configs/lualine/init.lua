local api = vim.api
local nls = require 'null-ls'

-- local theme_colors = require 'nightfox.colors'.load()

local colors = {
  bg = '#202328',
  fg = '#bbc2cf',
  yellow = '#ecbe7b',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  purple = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67',
  -- statusline = theme_colors.bg_statusline,
  -- scrollbar = theme_colors.normal
  statusline = '#202328',
  -- scrollbar = '#bbc2cf',
  scrollbar = '#008080',
}

local list_registered_providers_names = function( filetype )
  local s = require 'null-ls.sources'
  local available_sources = s.get_available( filetype )
  local registered = {}
  for _, source in ipairs( available_sources ) do
    for method in pairs( source.methods ) do
      registered[method] = registered[method] or {}
      table.insert( registered[method], source.name )
    end
  end
  return registered
end

local list_registered_formatters = function( filetype )
  local method = nls.methods.FORMATTING
  return list_registered_providers_names( filetype )[method] or {}
end

local list_registered_linters = function( filetype )
  local method = nls.methods.DIAGNOSTICS
  return list_registered_providers_names( filetype )[method] or {}
end

local unique_list = function( t )
  -- make unique keys
  local hash = {}
  for _, v in ipairs( t ) do
    if not ( v == "trail-space" ) then
      hash[v] = true
    end
  end

  -- transform keys back into values
  local res = {}
  for k,_ in pairs( hash ) do
    res[#res+1] = k
  end

  print("res  : " .. vim.inspect(res))

  return res
end

---  Build StatusLine Components
---
local components = {
  branch = {
    "b:gitsigns_head"
  },
  encoding = {
    "o:encoding"
  },
  lsp = {
    function(msg)
      msg = msg or ''
      local buf_clients = vim.lsp.buf_get_clients()
      if next(buf_clients) == nil then
        if type(msg) == "boolean" or #msg == 0 then
          return ''
        end
        return msg
      end
      local buf_ft = vim.bo.filetype
      local buf_client_names = {}

      -- add client
      for _, client in pairs(buf_clients) do
        if client.name ~= 'null-ls' then
          table.insert(buf_client_names, client.name)
        end
        -- vim.notify(client.name)
        -- return client.name
      end

      -- add formatter
      local supported_formatters = list_registered_formatters( buf_ft )
      -- print(vim.inspect(supported_formatters))
      -- vim.list_extend( buf_client_names, supported_formatters )

      -- add linter
      -- local linters = require "lvim.lsp.null-ls.linters"
      local supported_linters = list_registered_linters( buf_ft )
      -- print(vim.inspect(supported_linters))
      -- vim.list_extend(buf_client_names, supported_linters)
      vim.list_extend(supported_linters, supported_formatters)

      -- local x = vim.tbl_values(buf_client_names)
      -- print(vim.inspect(x))

      -- return table.concat(buf_client_names, ", ")
      local res = unique_list( supported_linters )
      vim.list_extend( buf_client_names, res )
      return table.concat(buf_client_names, ", ")
      -- return table.concat(res, ", ")
      -- return buf_client_names.name
      -- return '[' .. table.concat(buf_client_names, ", ") .. ']'
      -- return '[' .. table.concat(buf_client_names, ", ") .. ']'
    end,
    -- icon = ' ',
    -- color = { gui = "bold" },
    -- color = { fg = colors.yellow }
    -- color = { fg = colors.cyan }
    -- cond = conditions.hide_in_width,
    cond = function() return vim.fn.winwidth(0) > 80 end
  },
  mixedindent = {
    function()
      local space_indent = vim.fn.search([[\v^ +]], 'nw') > 0
      local tab_indent = vim.fn.search([[\v^\t+]], 'nw') > 0
      local mixed = (space_indent and tab_indent) or vim.fn.search([[\v^(\t+ | +\t)]], 'nw') > 0
      return mixed and 'Mixed Indent' or ''
    end
    -- , color = {
    --   fg = 'white',
    --   bg = colors.red,
    --   gui = 'bold'
    -- }
    , color = {
      fg = colors.red,
      bg = colors.bg,
    }
  },
  mode = {
    function()
      return ' '
    end
    , padding = { left = 0, right = 0 }
    , cond = nil
  },
  scrollbar = {
    function()
      local current_line = vim.fn.line "."
      local total_lines = vim.fn.line "$"
      local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
      local line_ratio = current_line / total_lines
      local index = math.ceil(line_ratio * #chars)
      return chars[index]
    end
    , padding = { left = 0, right = 0 }
    -- , color = { fg = colors.yellow, bg = colors.bg }
    -- , color = { fg = colors.yellow, bg = "StatusLine" }
    -- , color = {
    --   fg = colors.yellow,
    --   bg = function()
    --     -- return require 'nightfox.colors'.load().bg_statusline
    --     -- return require 'nightfox.colors'.load().blue
    --   end
    -- }
    -- , color = {
    --   fg = colors.scrollbar,
    --   bg = colors.statusline
    -- }
    -- , color = { fg = colors.yellow }
    -- , color = {
      -- fg = 'Normal',
      -- bg = 'String'
    -- }
    , cond = nil
  },
  treesitter = {
    function()
      local b = api.nvim_get_current_buf()
      if next(vim.treesitter.highlighter.active[b]) then
        return ''
      end
      return ''
    end
    , color = { fg = colors.green }
  }
}

require 'lualine'.setup {
  options = {
    theme = 'material-stealth'
    , component_separators = { '', '' }
    , section_separators = { '', '' }
    -- , section_separators = {'', ''}
    -- , extensions = {
    --   'nvim-tree'
    -- }
    -- , always_divide_middle = true
    -- , globalstatus = false
    , disabled_filetypes = {
      'NvimTree'
      , 'dashboard'
      , 'Outline'
    }
  }
  , sections = {
    lualine_a = {
      components.mixedindent,
      components.mode
    },
    -- lualine_b = {},
    lualine_c = {
      -- {
      --   'diagnostics'
      --   , sources = { 'nvim_lsp' }
      -- } ,
      {
        'filename'
        , path = 1 -- relative path
        , shorting_target = 40
      }
    },
    lualine_x = {
      -- components.encoding,
      components.lsp,
      components.treesitter,
      'filetype',
    },
    lualine_y = {
    },
    lualine_z = {
      -- components.scrollbar,
      components.mode
    }
  },
  inactive_sections = {
    lualine_c = {
      -- { 'diagnostics', source={'nvim_lsp'}},
      'filename'
    },
    lualine_x = {
      -- components.lsp,
      -- components.treesitter,
      { 'diagnostics', source={'nvim_lsp'}},
      'filetype',
    },
  }
}

-- require 'lualine'.setup {
--   options = {
--     -- theme = 'gruvbox_material'
--     theme = 'onedark'
--   }
-- }


-- local windline = require 'windline'

-- local basic = {}


-- basic.filename = {
--   text = function()
--     local name = vim.fn.expand('%:p:t')
--     if name == '' then name = '[No Name]' end
--     return name..' '
--   end
--   , hl_colors = { 'FilenameFg', 'FilenameBg' }
-- }

-- local default = {
--   filetype = { 'default' }
--   , active = {
--     basic.filename
--   }
--   , inactive = {
--     basic.filename
--   }
-- }

-- windline.setup({
--   colors_name = function(colors)
--     colors.FilenameFg = colors.white_light
--     colors.FilenameBg = colors.black_light
--     return colors
--   end
--   , statuslines = {
--     default
--   }
-- })


-- require('galaxyline').section.left[1]= {
--   FileSize = {
--     provider = 'FileSize',
--     condition = function()
--       if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
--         return true
--       end
--       return false
--       end,
--     icon = '   ',
--     -- highlight = {colors.green,colors.purple},
--     separator = '',
--     -- separator_highlight = {colors.purple,colors.darkblue},
--   }
-- }

-- local galaxyline = require 'galaxyline'

-- local function buffer_not_empty()
--   return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
-- end

-- local function printer(str)
--   return function() return str end
-- end

-- local space = printer( ' ' )

-- -- Defined in https://github.com/Iron-E/nvim-highlite
-- local _COLORS =
-- {
--  black = {'#202020', 0,   'black'},
--  gray  = {'#808080', 244, 'gray'},
--  gray_dark   = {'#353535', 236, 'darkgrey'},
--  gray_darker = {'#505050', 244, 'gray'},
--  gray_light  = {'#c0c0c0', 251, 'gray'},
--  white       = {'#ffffff', 15,  'white'},

--  tan = {'#f4c069', 180, 'darkyellow'},

--  red = {'#ee4a59', 196, 'red'},
--  red_dark  = {'#a80000', 124, 'darkred'},
--  red_light = {'#ff4090', 203, 'red'},

--  orange = {'#ff8900', 208, 'darkyellow'},
--  orange_light = {'#f0af00', 214, 'yellow'},

--  yellow = {'#f0df33', 220, 'yellow'},

--  green = {'#77ff00', 72, 'green'},
--  green_dark  = {'#35de60', 83, 'darkgreen'},
--  green_light = {'#a0ff70', 72, 'green'},

--  blue = {'#7090ff', 63, 'darkblue'},
--  cyan = {'#33efff', 87, 'cyan'},
--  ice  = {'#49a0f0', 63, 'cyan'},
--  teal = {'#00d0c0', 38, 'cyan'},
--  turqoise = {'#2bff99', 33, 'blue'},

--  magenta = {'#cc0099', 126, 'magenta'},
--  pink    = {'#ffa6ff', 162, 'magenta'},
--  purple  = {'#cf55f0', 129, 'magenta'},

--  magenta_dark = {'#bb0099', 126, 'darkmagenta'},
--  pink_light   = {'#ffb7b7', 38,  'white'},
--  purple_light = {'#af60af', 63,  'magenta'},
-- }

-- _COLORS.bar = {middle=_COLORS.gray_dark, side=_COLORS.black}
-- _COLORS.text = _COLORS.gray_light

-- local _HEX_COLORS = setmetatable(
--   {['bar'] = setmetatable({}, {['__index'] = function(_, key) return _COLORS.bar[key] and _COLORS.bar[key][1] or nil end })},
--   {['__index'] = function(_, key) local color = _COLORS[key] return color and color[1] or nil end}
-- )

-- galaxyline.left = {
--   {
--     FileName = {
--       provider = {space, 'FileName', 'FileSize'}
--       , condition = buffer_not_empty
--       , highlight = {
--         _HEX_COLORS.text, _HEX_COLORS.bar.side, 'bold'
--       }
--     }
--   }
-- }
