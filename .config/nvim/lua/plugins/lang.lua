---  Language Specific Plugins
---
return {
  ---  repl consoles
  ---
  {
    'yarospace/lua-console.nvim'
    -- , keys = "`"
    , opts = {}
  },
  ---  language syntax
  ---
  {
    'ckipp01/nvim-jenkinsfile-linter'
    , event = 'BufRead Jenkinsfile'
  },
  {
    'martinda/Jenkinsfile-vim-syntax'
    , ft = 'Jenkinsfile'
    , event = 'BufRead Jenkinsfile'
  },
  {
    'gisphm/vim-gradle'
    , event = 'BufRead *.gradle'
  },

  --- xcode work-alike
  ---
  ---  Swift
  ---
  -- {
  --   'xbase-lab/xbase'
  --   , build = 'make install'
  --   , config = true
  -- },
  ---  Rust
  ---
  {
    'simrat39/rust-tools.nvim'
    , ft = 'rust'
  },
  -- ---  Inlay Hints for rust-analyzer
  -- ---
  -- {
  --   'nvim-lua/lsp_extensions.nvim'
  -- },
  {
    'MeanderingProgrammer/render-markdown.nvim'
    , ft = {
      'markdown'
    }
    , dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'echasnovski/mini.icons'
    }
    , opts = {
      render_modes = { 'n', 'v', 'i', 'c' }
      , heading = {
        sign = false
      }
      , quote = {
        repeat_linebreak = true
      }
      , win_options = {
        showbreak = {
          default  = '',
          rendered = ''
        }
        , breakindent = {
          default = false,
          rendered = true
        }
        , breakindentopt = {
          default = '',
          rendered = ''
        }
      }
    }
  }
}
