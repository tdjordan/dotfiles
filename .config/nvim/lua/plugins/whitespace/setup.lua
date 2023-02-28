return {
  'ntpeters/vim-better-whitespace'
  , event = 'BufReadPost'
  , config = function()
    local g = vim.g
    g.strip_whitespace_on_save              = true
    g.strip_whitespace_confirm              = false
    g.strip_whitelines_at_eof               = true
    -- g.strip_only_modified_lines             = false
    g.show_spaces_that_precede_tabs         = true
    -- g.strip_max_file_size                   = 1000
    -- g.better_whitespace_skip_empty_lines    = false
    -- g.better_whitespace_verbosity           = false
    g.better_whitespace_operator            = ''
    g.better_whitespace_filetypes_blacklist =
    { 'diff'
      , 'gitcommit'
      , 'unite'
      , 'qf'
      , 'help'
      , 'packer'
      , 'man'
    }
  end
}
