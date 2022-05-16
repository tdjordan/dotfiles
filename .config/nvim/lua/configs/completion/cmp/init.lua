local api = vim.api

local function prequire(...)
  local status, lib = pcall(require, ...)
  if (status) then return lib end
  return nil
end

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

local luasnip = prequire 'luasnip'
local cmp     = prequire 'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      require 'luasnip'.lsp_expand(args.body)
    end
  },
  -- window = {
  --   completion = cmp.config.window.bordered(),
  --   documentation = cmp.config.window.bordered(),
  -- },
  preselect = cmp.PreselectMode.None,
  completion = {
    completeopt = 'menu,menuone,noselect'
  },
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
    { { name = 'nvim_lua'    }
    , { name = 'nvim_lsp'    }
    , { name = 'jenkinsfile' }
    , { name = 'neorg'       }
    -- , { name = 'luasnip'     }
    , { name = 'buffer'      }
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
    format = require 'lspkind'.cmp_format {
      -- mode = 'symbol'
      -- , maxwidth = 50
      -- , before = function( entry, vim_item )

      -- end
      menu = {
        nvim_lua = '',
        nvim_lsp = '',     --        曆
        jenkinsfile = '', -- 溺 ﴢ ﯑ ﬥ  וֹ אַ ﬈ ﬉ 窱 祉 祈 禍痢李易         
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
  }
  , experimental = {
    ghost_text = true
  }
}
