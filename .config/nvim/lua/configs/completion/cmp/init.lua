local api = vim.api
-- local fn  = vim.fn

local function prequire(...)
  local status, lib = pcall(require, ...)
  if (status) then return lib end
  return nil
end

-- local t = function(str)
--   return api.nvim_replace_termcodes(str, true, true, true)
-- end

local check_back_space = function()
  local line, col = unpack( api.nvim_win_get_cursor(0) )
  return col == 0 or api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') ~= nil
end

-- local feedkey = function(key, mode)
--   api.nvim_feedkeys( api.nvim_replace_termcodes(key, true, true, true), mode, true )
-- end

local has_words_before = function()
  if api.nvim_buf_get_option( 0, 'buftype' ) == 'prompt' then
    return false
  end
  local line, col = unpack( api.nvim_win_get_cursor(0) )
  return col == 0 and api.nvim_buf_get_lines( 0, line - 1, line, true )[1]:sub(col, col):match("%s") == nil
end

local luasnip = prequire 'luasnip'
local cmp     = prequire 'cmp'

-- local tab_complete = function(fallback)
--   if fn.pumvisible() == 1 then
--     api.nvim_feedkeys( t("<c-n>"), 'n', true )
--   -- elseif check_back_space() then
--   --   api.nvim_feedkeys( t("<tab>"), 'n', true )
--   elseif luasnip and luasnip.expand_or_jumpable() then
--     api.nvim_feedkeys( t("<plug>luasnip-expand-or-jump"), '', true )
--   -- elseif fn['vsnip#available']() then
--   --   api.nvim_feedkeys( t("<plug>(vsnip-expand-or-jump)"), '', true )
--   else
--     fallback()
--   end
-- end

-- local s_tab_complete = function(fallback)
--   if fn.pumvisible() == 1 then
--     api.nvim_feedkeys( t("<c-p>"), 'n', true )
--   elseif luasnip and luasnip.jumpable(-1) then
--     api.nvim_feedkeys( t("<plug>luasnip-expand-or-prev"), '', true )
--   -- elseif fn['vsnip#available']() then
--   --   api.nvim_feedkeys( t("<plug>(vsnip-expand-or-prev)"), '', true )
--   else
--     fallback()
--   end
-- end

cmp.setup {
  snippet = {
    expand = function(args)
      -- fn['vsnip#anonymous'](args.body)
      require 'luasnip'.lsp_expand(args.body)
    end
  },
  preselect = cmp.PreselectMode.None,
  completion = {
    completeopt = 'menu,menuone,noselect'
  },
  mapping =
    -- { ['<tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
    -- , ['<s-tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })
    -- { ['<tab>']     = cmp.mapping(function(fallback) tab_complete  (fallback) end, { 'i', 's' })
    -- , ['<s-tab>']   = cmp.mapping(function(fallback) s_tab_complete(fallback) end, { 'i', 's' })
    { ['<Tab>']     = cmp.mapping(function(fallback)
      if luasnip and luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif cmp and cmp.visible() then
        cmp.select_next_item()
      -- elseif luasnip and luasnip.expand_or_jumpable() then
        -- return t("<plug>luasnip-exand-or-jump")
      -- elseif fn.pumvisible() == 1 then
      --   feedkey( "<c-n>", 'n' )
      -- elseif luasnip.expand_or_jumpable() then
        -- luasnip.expand_or_jump()
      elseif check_back_space() then
        fallback()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" })
    , ['<S-Tab>']   = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      elseif cmp and cmp.visible() then
        cmp.select_prev_item()
      -- if fn.pumvisible() == 1 then
        -- feedkey( "<c-p>", 'n' )
        -- api.nvim_feedkeys( api.nvim_feedkeys("<c-p>", true, true, true), 'n', true )
      else
        fallback()
      end
    end, { "i", "s" })
    , ['<C-p>']     = cmp.mapping.select_prev_item()
    , ['<C-n>']     = cmp.mapping.select_next_item()
    , ['<C-b>']     = cmp.mapping.scroll_docs(-4)
    , ['<C-f>']     = cmp.mapping.scroll_docs(4)
    , ['<C-Space>'] = cmp.mapping.complete()
    , ['<C-e>']     = cmp.mapping.close()
    -- , ['<C-e>']     = cmp.mapping {
    --   i = cmp.mapping.abort(),
    --   c = cmp.mapping.close()
    -- }

    ---  Accept currently selected item.
    ---
    , ['<CR>']      = cmp.mapping.confirm({
      -- behavior = cmp.ConfirmBehavior.Replace,

      ---  'true'  : selects the first item if no item is currently selected
      ---  'false' : to only confirm explicitly selected item
      ---
      select = false
    })
  },
  sources = cmp.config.sources(
    { { name = 'nvim_lua'   }
    , { name = 'nvim_lsp'   }
    , { name = 'luasnip'    }
    , { name = 'buffer'     }
    , { name = 'path'       }
    -- , { name = 'tmux'       }
    , { name = 'tags'       }
    -- , { name = 'treesitter' }
    , { name = 'calc'       }
    , { name = 'orgmode'    }
    -- , { name = 'vsnip'    }
    -- , { name = 'look'     }
    , { name = 'emjoi'      }
    -- , { name = 'npm', keyword_length = 4 }
    -- , { name = 'crates'     }
  }),
  formatting = {
    format = require 'lspkind'.cmp_format {
      -- mode = 'symbol'
      -- , maxwidth = 50
      -- , before = function( entry, vim_item )

      -- end
      menu = {
        nvim_lua = '',
        nvim_lsp = '',     --        曆
        luasnip = '',      --  
        buffer = '﬘',       --     
        path = '﬌',         --   ﬌  P ﱮ
        -- tmux = '',
        tags = 'פּ',         -- פּ ﮒ          識 粒 ﰠ 識
        treesitter = '',   --         
        calc = '珞',        --         匿 溺 駱     ﯰ  ﰂ  落
        orgmode = '',
        -- vsnip = '',        --  
        -- look = '',
        emoji = '',
        -- crates = '識',
        -- latex_symbols = "[Latex]",
        -- spell = '暈',
      }
    },
    -- format = function( entry, vim_item )
    --   vim_item.kind = require 'lspkind'.presets.default[vim_item.kind] .. " " .. vim_item.kind

    --   -- set a name for each source
    --   vim_item.menu = ({
    --     -- nvim_lua = '[Lua]',
    --     -- nvim_lsp = '[LSP]',
    --     -- luasnip = '[LuaSnip]',
    --     -- buffer = '[Buffer]',
    --     -- path = '[Path]',
    --     -- treesitter = '[Treesitter]',
    --     -- tags = '[Tags]',
    --     -- calc = '[Calc]',
    --     -- orgmode = '[Orgmode]'
    --     -- latex_symbols = "[Latex]",
    --     -- nvim_lua = '[lua]',
    --     -- nvim_lsp = '[lsp]',
    --     -- luasnip = '[snp]',
    --     -- buffer = '[buf]',
    --     -- path = '[pth]',
    --     -- treesitter = '[tree]',
    --     -- tags = '[ta]
    --   -- calc = '[calc]',
    --     -- orgmode = '[org]'
    --     -- latex_symbols = "[Latex]",
    --     nvim_lua = '',
    --     nvim_lsp = ' 曆',  --        曆
    --     luasnip = '  ',      --  
    --     buffer = '﬘',       --     
    --     path = '﬌',         --   ﬌  P ﱮ
    --     treesitter = ' ', --         
    --     tags = 'פּ',         -- פּ ﮒ          識 粒 ﰠ 識
    --     calc = '珞',        --         匿 溺 駱     ﯰ  ﰂ  落
    --     orgmode = '',
    --     -- latex_symbols = "[Latex]",
    --     -- spell = '暈',
    --   })[entry.source.name]

    --   -- vim_item.kind = require 'lspkind'.presets.default[vim_item.kind]
    --   return vim_item
    -- end
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
