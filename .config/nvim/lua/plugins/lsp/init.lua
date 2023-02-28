return {
  ---  Language Protocol Server - LSP
  ---
  {
    'williamboman/mason.nvim'
    , event = 'BufReadPre'
    , dependencies = {
      'williamboman/mason-lspconfig.nvim',
      {
        'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
        , config = function()
          require 'configs.lsp.lines'
        end
      }
    }
    , config = function()
      require 'configs.lsp.mason'
    end
  },
  {
    'jose-elias-alvarez/null-ls.nvim'
    , dependencies = {
      'jay-babu/mason-null-ls.nvim'
    }
    , event = { 'BufReadPre', 'BufNewFile' }
    -- , event = { 'CursorHold' }
    , config = function()
      require 'configs.lsp.null'
    end
  },

  {
    'neovim/nvim-lspconfig'
    , dependencies = {
      'williamboman/mason-lspconfig.nvim',
    }
  },

}
