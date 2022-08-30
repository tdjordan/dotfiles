vim.filetype.add {
  extension = {
    sls = 'sls'
    , flux = 'flux'
    , dhall = 'dhall'
    , jsonnet = 'jsonnet'
    , cue = function( _, _ )
      vim.bo.cindent = false
      vim.bo.autoindent = false
      vim.bo.smartindent = true
      return 'cue'
    end
    -- example function
    -- , h = function()
    --   if vim.fn.search( '\\C^#include <[^>.]\\+>$', 'nw' ) >= 1 then
    --     return 'cpp'
    --   end
    --   return 'c'
    -- end
  },
  filename = {
    Jenkinsfile = 'Jenkinsfile'
    , Brewfile = 'conf'
    , justfile = 'just'
    , ['.gitignore'] = 'gitignore'
    , ['COMMIT_EDITMSG'] = function(_, _)
      vim.bo.cindent = false
      return 'gitcommit'
    end
  }
}
