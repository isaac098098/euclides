vim.cmd('colorscheme base16-tomorrow-night')

-- NvimTree

vim.cmd('highlight NvimTreeNormal guibg=#1a1b1d')
vim.cmd('highlight NvimTreeEndOfBuffer guifg=#1D1F21')
vim.cmd('highlight NvimTreeWinSeparator guibg=#1A1B1D guifg=#1A1B1D')
vim.cmd('highlight NvimTreeStatusLine guifg=#1A1B1D guibg=#1A1B1D')
vim.cmd('highlight NvimTreeStatusLineNC guifg=#1A1B1D guibg=#1A1B1D')

-- Toggleterm

vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#1a1b1d', fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#1d1f21', fg = '#ffffff' })

-- Bufferline

vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#1a1b1d', fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#1d1f21', fg = '#ffffff' })

-- Nvim

vim.cmd('highlight EndOfBuffer guifg=#1D1F21')
vim.cmd('highlight LineNr guifg=#969896')
