-- local cmd    = vim.cmd

-- New <leader> of the band
-- cmd [[
--   nnoremap <silent> <space> <nop>
--   vnoremap <silent> <space> <nop>
-- ]]

-- vim.g.mapleader = ' '

---
---  noremap bindings
---

---
---  u* mappings
---
-- nnoremap( '<leader>u', '<cmd>UndotreeToggle<cr>' )

---  Comment Handling
---
-- nnoremap( '<C-_>', '<plug>NERDCommenterToggle' )
-- vnoremap( '<C-_>', '<plug>NERDCommenterToggle' )

---  File Browser
---
-- nnoremap( '<leader>k', '<cmd>NERDTreeToggle<cr>' )

---  Window Navigation
---
---  navigate cursor to adjoining window
---
-- terminal mode
-- tnoremap( '<Esc>', [[<C-\><C-n>]] )
-- tnoremap( '<C-h>', [[<C-\><C-n><C-w>h]] )
-- tnoremap( '<C-j>', [[<C-\><C-n><C-w>j]] )
-- tnoremap( '<C-k>', [[<C-\><C-n><C-w>k]] )
-- tnoremap( '<C-l>', [[<C-\><C-n><C-w>l]] )
-- nnoremap( '<leader>t', ':split term://$SHELL<cr>' )
-- tnoremap( '', [[<c-\><c-n>:split term://$SHELL<cr>]] )
-- tnoremap( '<M-t>', [[<c-\><c-n>:split term://$SHELL<cr>]] )
-- tnoremap( '<A-t>', [[<c-\><c-n>:split term://$SHELL<cr>]] )
--  augroup terminal_settings
--    autocmd!
-- cmd [[ autocmd BufWinEnter,WinEnter,TermEnter term://* setlocal nonumber norelativenumber ]]
-- cmd [[ autocmd BufWinEnter,WinEnter,TermEnter term://* startinsert                        ]]
-- cmd [[ autocmd BufLeave                       term://* stopinsert                         ]]
-- cmd [[ autocmd TermClose                      term://* call nvim_input('<cr>')            ]]
--    autocmd BufWinEnter,WinEnter,TermEnter term://* startinsert
--    autocmd BufLeave                       term://* stopinsert
--    autocmd TermClose                      term://*
--      \ if    (expand('<afile>') !~ "fzf")
--      \    && (expand('<afile>') !~ "ranger")
--      \    && (expand('<afile>') !~ "coc")    |
--      \   call nvim_input('<cr>') |
--      \ endif
--  augroup END
---  normal mode
-- nnoremap <C-h> <C-w>h
-- nnoremap <C-j> <C-w>j
-- nnoremap <C-k> <C-w>k
-- nnoremap <C-l> <C-w>l
-- nnoremap( '<c-h>', '<cmd>wincmd h<cr>' )
-- nnoremap( '<c-j>', '<cmd>wincmd j<cr>' )
-- nnoremap( '<c-k>', '<cmd>wincmd k<cr>' )
-- nnoremap( '<c-l>', '<cmd>wincmd l<cr>' )
---  insert mode
-- inoremap <C-h> <Esc><C-W>h
-- inoremap <C-j> <Esc><C-w>j
-- inoremap <C-k> <Esc><C-w>k
-- inoremap <C-l> <Esc><C-w>l
---
---  move window to <position> of other windows
---
---  normal mode
-- nnoremap <C-S-H> <C-W>H
-- nnoremap <C-S-J> <C-W>J
-- nnoremap <C-S-K> <C-W>K
-- nnoremap <C-S-L> <C-W>L
-- nnoremap <C-S-T> <C-W>T

---  Comments
---
-- keymap( "n", "<c-_>",      "<Plug>kommentary_line_default",   { } )
-- keymap( "v", "<c-_>",      "<Plug>kommentary_visual_default", { } )
-- keymap( "n", "<leader>cc", "<Plug>kommentary_line_default",   { } )
-- keymap( "n", "<leader>c",  "<Plug>kommentary_motion_default", { } )
-- keymap( "v", "<leader>c",  "<Plug>kommentary_visual_default", { } )

---  Escape
---
-- cmd [[ :imap jk <esc> ]]
-- inoremap( 'jk',    '<esc>' )
-- inoremap( 'kj',    '<esc>' )
-- inoremap( '<C-c>', '<esc>' )

-- cmd [[ autocmd BufWinEnter,WinEnter TelescopePrompt :iunremap jk ]]
-- cmd [[ autocmd BufWinLeave,WinLeave TelescopePrompt :inoremap jk <esc> ]]

---  When opening a file, return to last edit postion
---
-- cmd [[
--   autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line('$') | execute 'normal! g`"' | endif
-- ]]

-- require 'configs.keys'
