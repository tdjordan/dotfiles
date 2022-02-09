require 'crates'.setup()

-- vim.cmd [[
--   autocmd BufReadPost Cargo.toml lua require 'cmp'.setup.buffer {sources = {{ name = 'crates' } } }
-- ]]
