local mapKey = require("utils.keyMapper").mapKey

-- Neotree toggle
mapKey('<leader>e', ':Neotree toggle<CR>')

-- pane navigation
mapKey('<C-h>', '<C-w>h') -- Left
mapKey('<C-j>', '<C-w>j') -- Down
mapKey('<C-k>', '<C-w>k') -- Up
mapKey('<C-l>', '<C-w>l') -- Right

-- clear search hl
mapKey('<leader>c', ':nohlsearch<CR>')

-- select configuration
mapKey('<leader>d', 'vi"')
mapKey('<leader>r', 'vi(')
mapKey('<leader>t', 'vi{')
mapKey('<leader>v', 'viw')
mapKey('<leader>x', '<S-V>x')

-- move cursor
mapKey('<leader>a', '^')
mapKey('<leader>f', '$')
mapKey('<leader>a', '^', 'v')
mapKey('<leader>f', '$', 'v')

-- copy doesn't yank
mapKey('x', '"_x')
mapKey('d', '"_d')
mapKey('d', '"_d', 'v')
mapKey('p', '"_dp', 'x')

-- indent
mapKey(',', '<gv', 'v')
mapKey('.', '>gv', 'v')
