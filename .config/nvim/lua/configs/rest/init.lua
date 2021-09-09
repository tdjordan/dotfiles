require 'rest-nvim'.setup(
  { result_split_horizontal = false   -- open results in horizontal split
  , skip_ssl_verification  = true     -- no SSL certificate verificaiton
  , hightlight =
    { enabled = true
    , timeout = 150
  }
  , jump_to_request = false           -- jump to request line on run
})
