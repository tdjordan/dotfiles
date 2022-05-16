vim.filetype.add {
  extension = {
    http = 'http'
    , sls = 'sls'
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
  },
  filename = {
    Jenkinsfile = 'Jenkinsfile'
    , Brewfile = 'conf'
  }
}
