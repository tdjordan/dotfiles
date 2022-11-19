local api = vim.api

vim.opt.completeopt = { 'menuone', 'noselect' }

require 'compe'.setup {
  enabled          = true,
  autocomplete     = true,
  debug            = false,
  min_length       = 1,
  preselect        = 'enable',
  thottle_time     = 80,
  source_timeout   = 200,
  incomplete_delay = 400,
  max_abbr_width   = 100,
  max_kind_width   = 100,
  max_menu_width   = 100,
  documentation    = true,

  source = {
    path          = true,
    buffer        = true,
    calc          = true,
    -- vsnip         = true,
    luasnip       = true,
    nvim_lsp      = true,
    nvim_lua      = true,
    -- spell         = true,
    tags          = true,
    snippets_nvim = true,
    treesitter    = true,
    -- ultisnips     = true,
    -- neorg         = true,
  }
}

local t = function(str)
  return api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

--- Use (s-)tab to:
---   move to prev/next item in completion menuone
---   jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  -- elseif vim.fn.call("vsnip#available", {1}) == 1 then
  --   return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  -- elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    -- return t "<Plug>(vsnip-jump-prev)"
  else
    -- if <S-Tab> is not working in your teminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

local keymap = vim.keymap.set
keymap( "i", "<Tab>",   "v:lua.tab_complete()",   { expr = true } )
keymap( "s", "<Tab>",   "v:lua.tab_complete()",   { expr = true } )
keymap( "i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true } )
keymap( "s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true } )

---  speed up compe
---

-- local g = vim.g

-- g.loaded_compe_calc = 0
-- g.loaded_compe_emoji = 0

-- g.loaded_compe_luasnip = 0
-- g.loaded_compe_nvim_lua = 0

-- g.loaded_compe_path = 0
-- g.loaded_compe_spell = 0
-- g.loaded_compe_tags = 0
-- g.loaded_compe_treesitter = 0

-- g.loaded_compe_snippets_nvim = 0

-- g.loaded_compe_ultisnips = 0
-- g.loaded_compe_vim_lsc = 0
-- g.loaded_compe_vim_lsp = 0
-- g.loaded_compe_omni = 0
