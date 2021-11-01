local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()

parser_config.http = {
  install_info =
    { url = 'https://github.com/NTBBloodbath/tree-sitter-http'
    , files = { 'src/parser.c' }
    , branch = 'main'
  }
}


