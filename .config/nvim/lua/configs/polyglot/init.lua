local g = vim.g
g.polyglot_disabled = require 'nvim-treesitter.parsers'.available_parsers()
