require 'lualine'.setup {
  options = {
    theme = 'gruvbox_material'
  }
}


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
--       , hightlight = {
--         _HEX_COLORS.text, _HEX_COLORS.bar.side, 'bold'
--       }
--     }
--   }
-- }
