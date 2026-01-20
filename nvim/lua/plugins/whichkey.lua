return {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
        spec = {
            { '<leader>/', group = 'Comments' },
            { '<leader>c', group = '[C]ode' },
            { '<leader>d', group = '[D]ebug' },
            { '<leader>e', group = '[E]xplorer' },
            { '<leader>g', group = '[G]it' },
            { '<leader>J', group = '[J]ava' },
            { '<leader>t', group = '[T]ab' },
            { '<leader>w', group = '[W]indow' },
        },
    },
}
