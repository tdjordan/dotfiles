require 'gitsigns'.setup {
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 350
  },
  on_attach = function( bufnr )
    -- local gs = require 'gitsigns'

    local function map( mode, lhs, rhs, opts )
      opts = vim.tbl_extend( 'force', { noremap = true, silent = true }, opts or {} )
      vim.api.nvim_buf_set_keymap( bufnr, mode, lhs, rhs, opts )
    end
    -- local function map( mode, l, r, opts )
    --   opts = opts or {}
    --   opts.bufnr = bufnr
    --   vim.keymap.set( mode, l, r, opts )
    -- end


    ---  Navigation
    ---
    map( 'n', '[c', "&diff '[c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true } )
    map( 'n', ']c', "&diff ']c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true } )
    -- map( 'n', ']c', function()
    --   if vim.wo.diff then return ']c' end
    --   vim.schedule( function() gs.next_hunk() end )
    --   return '<Ignore>'
    -- end, { expr = true })
    --
    -- map( 'n', '[c', function()
    --   if vim.wo.diff then return '[c' end
    --   vim.schedule( function() gs.prev_hunk() end )
    --   return '<Ignore>'
    -- end, { expr = true })

    ---  Actions
    ---
    map( 'n', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>'                         )
    map( 'v', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>'                         )
    map( 'n', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>'                         )
    map( 'v', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>'                         )
    map( 'n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>'                       )
    map( 'n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>'                    )
    map( 'n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>'                       )
    map( 'n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>'                       )
    map( 'n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>' )
    map( 'n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>'          )
    map( 'n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>'                           )
    map( 'n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis( "~" ) <CR>'      )
    map( 'n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>'                     )
    -- map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    -- map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    -- map('n', '<leader>hS', gs.stage_buffer)
    -- map('n', '<leader>hu', gs.undo_stage_hunk)
    -- map('n', '<leader>hR', gs.reset_buffer)
    -- map('n', '<leader>hp', gs.preview_hunk)
    -- map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    -- map('n', '<leader>tb', gs.toggle_current_line_blame)
    -- map('n', '<leader>hd', gs.diffthis)
    -- map('n', '<leader>hD', function() gs.diffthis('~') end)
    -- map('n', '<leader>td', gs.toggle_deleted)

    ---  Text object
    ---
    map( 'o', 'ih', ':<C-U>Gitsigns select_hunk<CR>' )
    map( 'x', 'ih', ':<C-U>Gitsigns select_hunk<CR>' )
    -- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
