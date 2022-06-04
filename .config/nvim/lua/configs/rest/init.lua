require 'rest-nvim'.setup(
  { result_split_horizontal = false   -- open results in horizontal split
  , result_split_in_place = false     -- keep http file buffer above|left when split
  , skip_ssl_verification  = true     -- no SSL certificate verificaiton
  , highlight =
    { enabled = true
    , timeout = 150
  }
  -- , result =
  --   { show_url = true
  --   , show_http_info = true
  --   , show_headers = true
  -- }
  , jump_to_request = false           -- jump to request line on run
  -- , env_file = '.env'
  -- , custom_dynamic_variables = {}
  -- , yank_dry_run = true
})
