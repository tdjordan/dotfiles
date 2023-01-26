require 'lsp_lines'.setup()

vim.diagnostic.config {
  -- virtual_lines = true,
  virtual_lines = {
    only_current_line = true
  }
}

local kset = function( mode, l, r, desc )
  opts        = opts or { noremap = true, silent = true }
  opts.desc   = desc
  vim.keymap.set( mode, l, r, opts )
end

local toggleDiagnostic_inline = function()
  vim.diagnostic.config {
    virtual_lines = true
  }
end

kset( 'n', '<space>lti', toggleDiagnostic_inline, 'toggle inline diagnostics' )

    -- virtual_text = {
    --   prefix = "",     --        
    --   spacing = 3,
    --   -- source = 'always'
    --   -- severity_limit = 'Warning'
    -- }
