local api = vim.api

-- local function prequire(...)
--   local status, lib = pcall(require, ...)
--   if (status) then return lib end
--   -- return nil
-- end

local check_back_space = function()
  local line, col = unpack( api.nvim_win_get_cursor(0) )
  return col == 0 or api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') ~= nil
end

local has_words_before = function()
  if api.nvim_buf_get_option( 0, 'buftype' ) == 'prompt' then
    return false
  end
  local line, col = unpack( api.nvim_win_get_cursor(0) )
  return col == 0 and api.nvim_buf_get_lines( 0, line - 1, line, true )[1]:sub(col, col):match("%s") == nil
end

-- local luasnip = prequire 'luasnip'
-- local ok, cmp, luasnip
-- ok, luasnip = pcall( require, 'luasnip' )
-- if not ok then return else
--   ok, cmp = pcall( require, 'cmp' )
--   if not ok then return end
-- end
-- local cmp     = prequire 'cmp'
-- local ok_cmp, cmp = pcall( require, 'cmp' )
-- if not ok_cmp then return end
local luasnip = require 'luasnip'
local cmp = require 'cmp'
-- local compare = require 'cmp.config.compare'
-- local types = require 'cmp.types'

cmp.setup {
  snippet = {
    expand = function(args)
      require 'luasnip'.lsp_expand(args.body)
    end
  },
  -- completion = {
  --   autocomplete = {
  --     types.cmp.TriggerEvent.TextChanged
  --   },
  --   completeopt = 'menu,menuone,noselect'
  -- },
  -- window = {
  --   completion = cmp.config.window.bordered(),
  --   documentation = cmp.config.window.bordered(),
  --   col_offset = 0,
  --   side_padding = 1
  -- },
  preselect = cmp.PreselectMode.None,
  -- performance = {
  --   debounce = 80,
  --   throtle = 40
  -- },
  mapping =
    { ['<Tab>']     = cmp.mapping(function(fallback)
      if cmp and cmp.visible() then
          cmp.select_next_item()
      elseif luasnip and luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      elseif check_back_space() then
        fallback()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" })
    , ['<S-Tab>']   = cmp.mapping(function(fallback)
      if cmp and cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" })
    , ['<C-p>']     = cmp.mapping.select_prev_item()
    , ['<C-n>']     = cmp.mapping.select_next_item()
    , ['<C-b>']     = cmp.mapping.scroll_docs(-4)
    , ['<C-f>']     = cmp.mapping.scroll_docs(4)
    , ['<C-Space>'] = cmp.mapping.complete()
    , ['<C-e>']     = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close()
    }

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
    -- { { name = 'nvim_lua'    }
    { { name = 'nvim_lsp'    }
    -- , { name = 'jenkinsfile' }
    , { name = 'neorg'       }
    -- , { name = 'luasnip'     }
    -- , { name = 'buffer'      }
    , { name = 'path'        }
    -- , { name = 'tmux'        }
    , { name = 'tags'        }
    -- , { name = 'treesitter'  }
    , { name = 'calc'        }
    -- , { name = 'orgmode'     }
    -- , { name = 'vsnip'     }
    -- , { name = 'look'      }
    , { name = 'emjoi'       }
    -- , { name = 'npm', keyword_length = 4 }
    -- , { name = 'crates'     }
  }),
  formatting = {
    -- fields = { 'abbr', 'kind', 'menu' }
    -- fields = { 'menu', 'abbr', 'kind' }
    -- fields = { 'kind', 'menu', 'abbr' }
    fields = { 'kind', 'abbr', 'menu' }
    , format = require 'lspkind'.cmp_format {
      mode = 'symbol'
      -- , maxwidth = 50
      , menu = {
        nvim_lua = '',
        nvim_lsp = '',     --        曆
        jenkinsfile = '',  -- 溺 ﴢ ﯑ ﬥ  וֹ אַ ﬈ ﬉ 窱 祉 祈 禍痢李易         
        neorg = '',
        luasnip = '',      --  
        buffer = '﬘',       --     
        path = '﬌',         --   ﬌  P ﱮ
        tmux = '',
        tags = 'פּ',         -- פּ ﮒ          識 粒 ﰠ 識
        treesitter = '',   --         
        calc = '珞',        --         匿 溺 駱     ﯰ  ﰂ  落
        -- orgmode = '',
        -- vsnip = '',        --  
        -- look = '',
        emoji = '',
        -- crates = '識',
        -- latex_symbols = "[Latex]",
        -- spell = '暈',
      }
    },
  }
  -- , sorting = {
  --   comparators = {
  --     cmp.config.compare.offset,
  --     cmp.config.compare.exact,
  --     cmp.config.compare.score,
  --     function(entry1, entry2)
  --       local kind1 = entry1:get_kind()
  --       kind1 = kind1 == types.lsp.CompletionItemKind.Text and 100 or kind1
  --       local kind2 = entry2:get_kind()
  --       kind2 = kind2 == types.lsp.CompletionItemKind.Text and 100 or kind2
  --       if kind1 ~= kind2 then
  --         if kind1 == types.lsp.CompletionItemKind.Snippet then
  --           return false
  --         end
  --         if kind2 == types.lsp.CompletionItemKind.Snippet then
  --           return true
  --         end
  --         local diff = kind1 - kind2
  --         if diff < 0 then
  --           return true
  --         elseif diff > 0 then
  --           return false
  --         end
  --       end
  --     end,
  --     cmp.config.compare.sort_text,
  --     cmp.config.compare.length,
  --     cmp.config.compare.order,
  --   },
  -- }
  -- , experimental = {
  --   ghost_text = true
  -- }
}

cmp.setup.filetype( 'lua', {
  sources = {
    { name = 'nvim_lsp'                },
    { name = 'nvim_lua'                },
    { name = 'nvim_lsp_signature_help' },
    { name = 'buffer'                  },
    { name = 'luasnip'                 },
    { name = 'path'                    },
    { name = 'tags'                    }
  }
})
