vim.cmd('colorscheme base16-tomorrow-night')

-- NvimTree

vim.cmd('highlight NvimTreeNormal guibg=#1A1B1D')
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
vim.cmd('highlight Normal ctermbg=none guibg=none')
vim.cmd('highlight NormalNC ctermbg=none guibg=none')
vim.cmd('highlight ModeMsg guifg=#C5C8C6')

-- TabLine

vim.cmd('highligh TabLineSel guifg=#1A1B1D guibg=#81A2B3')
vim.cmd('highligh TabLine guifg=#C5C8C6 guibg=#1D1F21')
vim.cmd('highligh TabLineFill guibg=#1D1F21')

-- Relative line numbers
-- vim.cmd('highlight LineNr guifg=#C5C8C6 guibg=none')
-- vim.cmd('highlight LineNrAbove guifg=#373B41 guibg=none')
-- vim.cmd('highlight LineNrBelow guifg=#373B41 guibg=none')

-- Normal line numbers
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.cmd('highlight LineNr guifg=#373B41 guibg=none')
vim.api.nvim_set_hl(0, "CursorLineNr", { underline = false, fg = "#C5C8C6", bg = "none" })
