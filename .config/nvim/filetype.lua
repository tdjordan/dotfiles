vim.filetype.add {
  extension = {
    sls = 'sls'
    , flux = 'flux'
    , dhall = 'dhall'
    , norg = 'norg'
    , jsonnet = 'jsonnet'
    , cue = function( _, _ )
      vim.bo.cindent = true
      vim.bo.autoindent = false
      vim.bo.smartindent = false
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
  }
}
