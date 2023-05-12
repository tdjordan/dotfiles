---  snippets
---
return {
  -- {
  --   'hrsh7th/vim-vsnip'
  --   , event = 'InsertEnter'
  --   , dependencies = {
  --     'hrsh7th/vim-vsnip-integ'
  --   }
  -- },
  -- {
  --   'hrsh7th/vim-vsnip-integ'
  --   , event = 'InsertEnter'
  -- },
  -- {
  --   'rafamadriz/friendly-snippets'
  --   , dependencies = {
  --     'hrsh7th/vim-vsnip'
  --   }
  --   , event = 'InsertEnter'
  -- },
  -- { 'Shougo/neosnippet' },
  -- { 'Shougo/neosnippet-snippets' },
  -- { 'honza/vim-snippets' },
  -- { 'SirVer/ultisnips' },
  -- { 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' },
  {
    'norcalli/snippets.nvim'
    , event = 'InsertEnter'
    , config = function()
      require 'configs.snippets.snippets-nvim'
    end
  },
  {
    'L3MON4D3/LuaSnip'
    -- , event = 'InsertEnter'
    -- , config = function()
    --   require 'configs.snippets.luasnip'
    -- end
    , config = function()
      require 'configs.luasnip'
    end
  },
  -- {
  --   'molleweide/LuaSnip-snippets.nvim'
  --   , event = 'InsertEnter'
  --   , config = function()
  --     require 'configs.luasnip.snippets'
  --   end
  -- },
  {
    'saadparwaiz1/cmp_luasnip'
  }
}
