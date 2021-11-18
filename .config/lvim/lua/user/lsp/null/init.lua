local nls = require 'null-ls'

nls.config {
  sources = {
    nls.builtins.diagnostics.hadolint
  }
}
