local local_colors = {
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
  statusline = '#202328',
  scrollbar = '#008080',
}

local colors = require 'material.colors'

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
  local nls = require 'null-ls'
  local method = nls.methods.FORMATTING
  return list_registered_providers_names( filetype )[method] or {}
end

local list_registered_linters = function( filetype )
  local nls = require 'null-ls'
  local method = nls.methods.DIAGNOSTICS
  return list_registered_providers_names( filetype )[method] or {}
end

local hidden_providers =
  { 'codespell'
  , 'trail-space'
  , 'editorconfig_checker'
}

local unique_list = function( t )
  -- make unique keys
  local hash = {}
  for _, v in ipairs( t ) do
    hash[v] = true
  end

  -- hide assumed providers
  for _, p in ipairs( hidden_providers ) do
    hash[p] = nil
  end

  -- transform keys back into values
  local res = {}
  for k,_ in pairs( hash ) do
    res[#res+1] = k
  end

  -- print("res  : " .. vim.inspect(res))

  return res
end

local winbar_filename = function()
  local bo = vim.bo
  if bo.modified then
    return '● '
      .. vim.fn.expand('%:p:.')
  end
  if vim.fn.expand('%:t') == '' then
    return ''
  end
  return vim.fn.expand('%:p:.')
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
      end

      -- add formatter
      local supported_formatters = list_registered_formatters( buf_ft )

      -- add linter
      local supported_linters = list_registered_linters( buf_ft )
      vim.list_extend(supported_linters, supported_formatters)

      local res = unique_list( supported_linters )
      vim.list_extend( buf_client_names, res )
      return table.concat(buf_client_names, ", ")
    end,
    cond = function() return vim.fn.winwidth(0) > 80 end
  },
  mixedindent = {
    function()
      local space_indent = vim.fn.search([[\v^ +]], 'nw') > 0
      local tab_indent = vim.fn.search([[\v^\t+]], 'nw') > 0
      local mixed = (space_indent and tab_indent) or vim.fn.search([[\v^(\t+ | +\t)]], 'nw') > 0
      return mixed and 'Mixed Indent' or ''
    end
    , color = {
      fg = local_colors.red,
      bg = local_colors.bg,
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
    , cond = nil
  },
  treesitter = {
    function()
      local b = vim.api.nvim_get_current_buf()
      if next(vim.treesitter.highlighter.active[b]) then
        return ''
      end
      return ''
    end
    , color = { fg = local_colors.green }
  },
  winbar_filename = {
    function()
      return winbar_filename()
    end
    , color = { fg = colors.main.darkpurple, bg = colors.editor.contrast }
  },
  winbar_filename_inactive = {
    function()
      return winbar_filename()
    end
    , color = { fg = colors.editor.line_numbers, bg = colors.editor.contrast }
  }
}

require 'lualine'.setup {
  options = {
    -- theme = 'material-stealth'
    theme = 'kanagawa'
    , component_separators = { left = '', right = '' }
    , section_separators = { left = '', right = '' }
    , disabled_filetypes = {            -- filetypes disabled      for lualine
      statusline = {                    -- filetypes disabled only for statusline
        'NvimTree'
        , 'neo-tree'
        , 'dashboard'
        , 'Outline'
      }
      , winbar = {                      -- filetypes disabled only for winbar
        'NvimTree'
        , 'neo-tree'
        , 'dashboard'
        , 'Outline'
      }
    }
    -- , always_divide_middle = true       -- when true { left sections constrained if right sections exist }
    , globalstatus = true               -- when true { global statusline ( 0.7+ ) }
    , refresh = {
      statusline = 1000
      , tabline = 1000
      , winbar = 1000
    }
    -- , extensions = {
    --   'nvim-tree'
    -- }
  }
  , sections = {
    lualine_a = {
      components.mixedindent,
      components.mode
    },
    -- lualine_b = {},
    lualine_c = {
      { require 'nvim-navic'.get_location { highlight = true }, cond = require 'nvim-navic'.is_available },
    },
    lualine_x = {
      components.lsp,
      components.treesitter,
      'filetype',
    },
    lualine_y = {
    },
    lualine_z = {
      components.mode
    }
  }
  -- , inactive_sections = {
  -- --   lualine_c = {
  -- --     -- { 'diagnostics', source={'nvim_lsp'}},
  -- --     'filename'
  -- --   },
  -- --   lualine_x = {
  -- --     -- components.lsp,
  -- --     -- components.treesitter,
  -- --     { 'diagnostics', source={'nvim_lsp'}},
  -- --     'filetype',
  -- --   },
  --   lualine_x = {
  --   },
  --   lualine_y = {
  --   },
  --   lualine_z = {
  --     -- components.scrollbar,
  --     -- components.mode
  --   }
  -- }
  -- , tabline = {}
  , winbar = {
    lualine_z = {
      components.winbar_filename
    }
  }
  , inactive_winbar = {
    lualine_z = {
      components.winbar_filename_inactive
    }
  }
}
