--[[ MAP ]]
local map = vim.keymap.set

-- clear hlsearch
map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear Highlight Search' })

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- better up down functionality
map({ 'n', 'x' }, 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, silent = true })
map({ 'n', 'x' }, 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, silent = true })

-- resize windows
map('n', '_', '<cmd>resize -5<cr>', { desc = 'Decrease Window Height' })
map('n', '+', '<cmd>resize +5<cr>', { desc = 'Increase Window Height' })
map('n', '-', '<cmd>vertical resize -10<cr>', { desc = 'Decrease Window Width' })
map('n', '=', '<cmd>vertical resize +10<cr>', { desc = 'Increase Window Width' })

-- Add undo break-points
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', ';', ';<c-g>u')

-- save file
map({ 'x', 'n', 's', 'i' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })
-- close buffer
map({ 'i', 'x', 'n', 's' }, '<C-q>', '<cmd>bp | sp | bn | bd<cr>', { desc = 'Close Buffer' })
-- force close buffer
map({ 'n', 's' }, '<C-x>', '<cmd>bd!<cr>', { desc = 'Force Close Buffer' })
-- CTRL-C go to normal mode, or exit vim
map({ 'n' }, '<C-c>', '<cmd>q<cr><esc>', { desc = 'Close Window' })
map({ 'i', 'x', 's' }, '<C-c>', '<esc>', { desc = 'Go to Normal Mode' })

-- remap <c-_> to <c-/> so I can bind <C-/>
map('n', '<c-_>', '<c-/>', { remap = true, desc = 'which_key_ignore' })
map('t', '<c-_>', '<c-/>', { remap = true, desc = 'which_key_ignore' })
