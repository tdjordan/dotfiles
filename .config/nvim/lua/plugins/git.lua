return {
  {
    'theprimeagen/git-worktree.nvim'
    , dependencies = {
      'nvim-lua/plenary.nvim'
      , 'nvim-telescope/telescope.nvim'
    }
    , keys = {
      {
        '<leader>gw', function()
          require 'telescope'.extensions.git_worktree.git_worktrees()
        end, desc = 'git worktree list'
      },
      {
        '<leader>gW', function()
          require 'telescope'.extensions.git_worktree.create_git_worktree()
        end, desc = 'git worktree create'
      }
    }
    , config = function()
      require 'git-worktree'.setup {}
      require 'telescope'.load_extension( 'git_worktree' )
    end
  },
  {
    'pwntester/octo.nvim'
    , cmd = 'Octo'
    , dependencies = {
      'nvim-lua/plenary.nvim'
      , 'nvim-telescope/telescope.nvim'
      , 'nvim-tree/nvim-web-devicons'
    }
    , config = function()
      require 'configs.telescope.github.octo'
    end
  },
  {
    'lewis6991/gitsigns.nvim'
    , ft = 'gitcommit'
    , init = function()
      vim.api.nvim_create_autocmd( { 'BufRead' }, {
        group = vim.api.nvim_create_augroup( 'GitSignsLazyLoad', { clear = true } )
        , callback = function()
          vim.fn.system('git -C ' .. vim.fn.expand '%:p:h' .. ' rev-parse')
          if vim.v.shell_error == 0 then
            vim.api.nvim_del_augroup_by_name 'GitSignsLazyLoad'
            require 'lazy'.load { plugins = { 'gitsigns.nvim' } }
          end
        end
      })
    end
    , opts = {
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 350
          -- , virt_text_pos = 'right_align'
        },
        on_attach = function( bufnr )
          local gs = package.loaded.gitsigns

          local function map( mode, l, r, desc, opts )
            opts        = opts or {}
            opts.desc   = desc
            opts.buffer = bufnr
            vim.keymap.set( mode, l, r, opts )
          end

          ---  Navigation
          ---
          map( 'n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule( function() gs.next_hunk() end )
            return '<Ignore>'
          end, 'next hunk', { expr = true })

          map( 'n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule( function() gs.prev_hunk() end )
            return '<Ignore>'
          end, 'prev hunk', { expr = true })

          ---  Actions
          ---
          local line = vim.fn.line

          map( 'n', '<leader>hs', gs.stage_hunk,                                         'stage hunk'      )
          map( 'n', '<leader>hr', gs.reset_hunk,                                         'reset hunk'      )
          map( 'v', '<leader>hs', function() gs.stage_hunk { line("."), line("v") } end, 'stage hunk'      )
          map( 'v', '<leader>hr', function() gs.reset_hunk { line("."), line("v") } end, 'reset hunk'      )
          map( 'n', '<leader>hS', gs.stage_buffer,                                       'stage buffer'    )
          map( 'n', '<leader>hu', gs.undo_stage_hunk,                                    'undo hunk stage' )
          map( 'n', '<leader>hR', gs.reset_buffer,                                       'reset buffer'    )
          map( 'n', '<leader>hp', gs.preview_hunk,                                       'preview hunk'    )
          map( 'n', '<leader>hb', function() gs.blame_line { full = true } end,          'blame line'      )
          map( 'n', '<leader>tb', gs.toggle_current_line_blame,                          'blame line'      )
          map( 'n', '<leader>hd', gs.diffthis,                                           'diff this'       )
          map( 'n', '<leader>hD', function() gs.diffthis( '~' ) end,                     'diff this ~'     )
          map( 'n', '<leader>td', gs.toggle_deleted,                                     'toggle deleted'  )

          ---  Text object
          ---
          map( { 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'select hunk' )
        end
    }
  }
}
