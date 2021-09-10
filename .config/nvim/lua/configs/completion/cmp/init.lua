local api = vim.api
local fn  = vim.fn

local function prequire(...)
  local status, lib = pcall(require, ...)
  if (status) then return lib end
  return nil
end

local t = function(str)
  return api.nvim_replace_termcodes(str, true, true, true)
end

-- local check_back_space = function()
--   local line, col = unpack( api.nvim_win_get_cursor(0) )
--   return col == 0 or api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') ~= nil
-- end

local luasnip = prequire 'luasnip'
local cmp     = prequire 'cmp'

local tab_complete = function(fallback)
  if fn.pumvisible() == 1 then
    api.nvim_feedkeys( t("<c-n>"), 'n', true )
  -- elseif check_back_space() then
  --   api.nvim_feedkeys( t("<tab>"), 'n', true )
  elseif luasnip and luasnip.expand_or_jumpable() then
    api.nvim_feedkeys( t("<plug>luasnip-expand-or-jump"), '', true )
  -- elseif fn['vsnip#available']() then
  --   api.nvim_feedkeys( t("<plug>(vsnip-expand-or-jump)"), '', true )
  else
    fallback()
  end
end

local s_tab_complete = function(fallback)
  if fn.pumvisible() == 1 then
    api.nvim_feedkeys( t("<c-p>"), 'n', true )
  elseif luasnip and luasnip.jumpable(-1) then
    api.nvim_feedkeys( t("<plug>luasnip-expand-or-prev"), '', true )
  -- elseif fn['vsnip#available']() then
  --   api.nvim_feedkeys( t("<plug>(vsnip-expand-or-prev)"), '', true )
  else
    fallback()
  end
end

cmp.setup {
  snippet = {
    expand = function(args)
      -- fn['vsnip#anonymous'](args.body)
      require 'luasnip'.lsp_expand(args.body)
    end
  },
  mapping =
    -- { ['<tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
    -- , ['<s-tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })
    { ['<tab>']     = cmp.mapping(function(fallback) tab_complete  (fallback) end, { 'i', 's' })
    , ['<s-tab>']   = cmp.mapping(function(fallback) s_tab_complete(fallback) end, { 'i', 's' })
    , ['<c-p>']     = cmp.mapping.select_prev_item()
    , ['<c-n>']     = cmp.mapping.select_next_item()
    , ['<c-d>']     = cmp.mapping.scroll_docs(-4)
    , ['<c-f>']     = cmp.mapping.scroll_docs(4)
    , ['<c-space>'] = cmp.mapping.complete()
    , ['<c-e>']     = cmp.mapping.close()
    , ['<cr>']      = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    })
  },
  sources =
    { { name = 'nvim_lua'   }
    , { name = 'nvim_lsp'   }
    , { name = 'luasnip'    }
    , { name = 'buffer'     }
    , { name = 'path'       }
    -- , { name = 'tmux'       }
    , { name = 'treesitter' }
    , { name = 'tags'       }
    , { name = 'calc'       }
    , { name = 'orgmode'    }
    -- , { name = 'vsnip'    }
    -- , { name = 'look'     }
    -- , { name = 'emjoi'    }
  },
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = require 'lspkind'.presets.default[vim_item.kind] .. " " .. vim_item.kind
      -- vim_item.kind = require 'lspkind'.presets.default[vim_item.kind]
      return vim_item
    end
  }
  , experimental = {
    ghost_text = true
  }
}
-- require 'compe'.setup {
--   enabled          = true,
--   autocomplete     = true,
--   debug            = false,
--   min_length       = 1,
--   preselect        = 'enable',
--   thottle_time     = 80,
--   source_timeout   = 200,
--   incomplete_delay = 400,
--   max_abbr_width   = 100,
--   max_kind_width   = 100,
--   max_menu_width   = 100,
--   documentation    = true,

--   source = {
--     path          = true,
--     buffer        = true,
--     calc          = true,
--     -- vsnip         = true,
--     luasnip       = true,
--     nvim_lsp      = true,
--     nvim_lua      = true,
--     -- spell         = true,
--     tags          = true,
--     snippets_nvim = true,
--     treesitter    = true,
--     -- ultisnips     = true,
--     neorg         = true,
--   }
-- }
