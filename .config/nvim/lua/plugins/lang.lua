---  Language Specific Plugins
---
return {
  ---  language syntax
  ---
  {
    'ckipp01/nvim-jenkinsfile-linter'
    , event = 'BufRead Jenkinsfile'
  },
  {
    'martinda/Jenkinsfile-vim-syntax'
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
  {
    'xbase-lab/xbase'
    , build = 'make install'
    , config = true
  },
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
}
