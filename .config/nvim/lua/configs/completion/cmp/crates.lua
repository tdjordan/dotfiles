require 'plenary.job'

local crates = require 'crates'

-- vim.cmd [[
--   autocmd BufReadPost Cargo.toml lua require 'cmp'.setup.buffer {sources = {{ name = 'crates' } } }
-- ]]

local cmp = require 'cmp'

-- cmp.setup.filetype( 'toml', {
--   sources = cmp.config.sources {
--     { name = 'crates'   },
--     { name = 'buffer'   },
--     { name = 'luasnip'  },
--     { name = 'nvim_lsp' },
--     { name = 'path'     },
--     { name = 'tags'     }
--   }
-- })

local api = vim.api
local keymap = vim.keymap

api.nvim_create_autocmd( 'BufReadPost', {
  group = api.nvim_create_augroup( 'CmpSourceCargo', { clear = true } )
  , pattern = 'Cargo.toml'
  , callback = function()
    cmp.setup.buffer {
      sources = {
        { name = 'crates' },
        { name = 'buffer' },
      }
    }

    local opts = {
      noremap = true
      , silent = true
      , buffer = true
    }

    keymap.set('n', '<leader>ct', crates.toggle,                  opts)
    keymap.set('n', '<leader>cr', crates.reload,                  opts)

    keymap.set('n', '<leader>cv', crates.show_versions_popup,     opts)
    keymap.set('n', '<leader>cf', crates.show_features_popup,     opts)
    keymap.set('n', '<leader>cd', crates.show_dependencies_popup, opts)

    keymap.set('n', '<leader>cu', crates.update_crate,            opts)
    keymap.set('v', '<leader>cu', crates.update_crates,           opts)
    keymap.set('n', '<leader>ca', crates.update_all_crates,       opts)
    keymap.set('n', '<leader>cU', crates.upgrade_crate,           opts)
    keymap.set('v', '<leader>cU', crates.upgrade_crates,          opts)
    keymap.set('n', '<leader>cA', crates.upgrade_all_crates,      opts)

    keymap.set('n', '<leader>cH', crates.open_homepage,           opts)
    keymap.set('n', '<leader>cR', crates.open_repository,         opts)
    keymap.set('n', '<leader>cD', crates.open_documentation,      opts)
    keymap.set('n', '<leader>cC', crates.open_crates_io,          opts)

    keymap.set('n', '<leader>ck', crates.show_popup,              opts)
    -- keymap.set('n', '<leader>k',  crates.show_popup,              opts)
  end
})
