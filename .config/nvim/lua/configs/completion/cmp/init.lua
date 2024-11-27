local api = vim.api

-- local function prequire(...)
--   local status, lib = pcall(require, ...)
--   if (status) then return lib end
--   -- return nil
-- end

-- local check_back_space = function()
--   local line, col = unpack( api.nvim_win_get_cursor(0) )
--   return col == 0 or api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') ~= nil
-- end

local has_words_before = function()
  if api.nvim_buf_get_option( 0, 'buftype' ) == 'prompt' then
    return false
  end
---@diagnostic disable-next-line: deprecated
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
  -- enabled = function()
  --   local disabled = false
  --   disabled = disabled or (vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt')
  --   disabled = disabled or (vim.fn.reg_recording() ~= '')
  --   disabled = disabled or (vim.fn.reg_executing() ~= '')
  --   return not disabled
  -- end,
  -- performance = {
  --   debounce = 60,
  --   throtle = 30,
  --   fetching_timeout = 500
  -- },
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      require 'luasnip'.lsp_expand(args.body)
    end
  },
  mapping =
    { ['<Tab>']     = cmp.mapping(function(fallback)
      if cmp and cmp.visible() then
          cmp.select_next_item()
      elseif luasnip and luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
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
  -- completion = {
  --   autocomplete = {
  --     types.cmp.TriggerEvent.TextChanged
  --   },
  --   completeopt = 'menu,menuone,noselect',
  --   keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
  --   keyword_length = 1
  -- },
  formatting = {
    -- expandable_indicator = true,
    fields = { 'kind', 'abbr', 'menu' }
    , format = require 'lspkind'.cmp_format {
      mode = 'symbol'
      -- , maxwidth = 50
      -- , elipsis_char = '...'
      , menu = {
        nvim_lua = '',
        nvim_lsp = '',     --        󰒌
        jenkinsfile = '󰏮',  -- 󰓭 󰠤 󰛓   󰙌 󰘯 󰘉 󰘊 󰖭 󰕎 󰕏 󰕓󰓦󰓢󰓡󰏟 󰏞 󰏮 󰌍 󰇙 󰇛 󰇝 󰃛 󰃜 
        neorg = '',
        luasnip = '',      --  
        buffer = '',       --       
        path = '󰘍',         --  󰋷 󰘍  P 󰝰
        tmux = '',         --  
        tags = '󰙅',         --  󰙅 󰚔 󰅴         󰓽 󰓺 󰜢 󰓽󰋸
        treesitter = '',   --        󰄥 
        calc = '󰐘',        -- 󰋸 󰃬       󰓬 󰓭 󰌉  󰍷  󰛲  󰜄  󰐙
        -- salc = '󰐘',        -- 󰋸 󰃬       󰓬 󰓭 󰌉  󰍷  󰛲  󰜄  󰐙   🔭  ∭
        -- orgmode = '',
        -- vsnip = '',        --  
        -- look = '',
        emoji = '󰄥',
        -- crates = '󰓽',
        -- latex_symbols = "[Latex]",
        spell =  '󰓆',
      }
    }
  },
  -- sources = cmp.config.sources {
  --   -- { { name = 'nvim_lua'    }
  --     { name = 'nvim_lsp'    }
  --   -- , { name = 'jenkinsfile' }
  --   , { name = 'neorg'       }
  --   -- , { name = 'luasnip'     }
  --   , { name = 'buffer'      }
  --   -- , { name = 'dictionary'  }
  --   , { name = 'path'        }
  --   -- , { name = 'tmux'        }
  --   , { name = 'tags'        }
  --   -- , { name = 'treesitter'  }
  --   , { name = 'calc'        }
  --   -- , { name = 'orgmode'     }
  --   -- , { name = 'vsnip'     }
  --   -- , { name = 'look'      }
  --   , { name = 'emoji'       }
  --   -- , { name = 'npm', keyword_length = 4 }
  --   -- , { name = 'crates'     }
  -- },
  -- matching = {
  --   disallow_fuzzy_matching = false,
  --   disallow_partial_fuzzy_matching = true,
  --   disallow_partial_matching = false,
  --   disallow_prefix_matching = false
  -- },
  -- , sorting = {
  --   priority_weight = 2,
  --   comparators = {
  --     compare.offset,
  --     compare.exact,
  --     -- compare.scopes,
  --     compare.score,
  --     compare.recently_used,
  --     compare.locality,
  --     compare.kind,
  --     compare.sort_text,
  --     compare.length,
  --     compare.order,
  --   }
  -- },
  -- confirmation = {
  --   default_behavior = types.cmp.ConfirmBehavior.Insert,
  --   get_commit_characters = function( commit_characters )
  --     return commit_characters
  --   end
  -- },
  -- event = {}
  -- experimental = {
  --   ghost_text = true
  -- },
  -- view = {
  --   entries = {
  --     name = 'custom',
  --     selection_order = 'top_down'
  --   }
  -- },
  -- window = {
  --   completion = cmp.config.window.bordered(),
  --   documentation = {
  --     max_height = math.floor(--[[ WIDE_HEIGHT ]] 40 * (--[[ WIDE_HEIGHT ]] 40 / vim.o.lines)),
  --     max_width = math.floor((--[[ WIDE_HEIGHT ]] 40 * 2) * (vim.o.columns / (--[[ WIDE_HEIGHT ]] 40 * 2 * 16 / 9))),
  --     border = cmp.config.window.bordered().border,
  --     winhighlight = 'FloatBorder:NormalFloat'
  --   }
  -- },
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
