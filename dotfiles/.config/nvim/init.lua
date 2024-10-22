-- Vim

-- Filetypes
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')

-- Tabs andd indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.breakindent = true
vim.opt.linebreak = true

-- Line numbering
vim.opt.number = true
vim.opt.numberwidth = 1

-- Highlighting
vim.cmd('let loaded_matchparen=1')

-- Keybindings

vim.g.mapleader = ' '
vim.g.localleader = '\\'

-- Normal mode
vim.keymap.set('n','j','gj')
vim.keymap.set('n','k','gk')
vim.keymap.set('n','t','gt')
vim.keymap.set('n','T','gT')
vim.cmd('nnoremap <CR> :write<CR>')

-- Visual mode
vim.keymap.set('v','oi','<Esc>')

-- Select mode
vim.keymap.set('s','oi','<Esc>')

-- Insert mode
vim.keymap.set('i','oi','<Esc>')

--Plugins
require("config.lazy")

-- Colorschemes

-- NvimTree
vim.cmd('highlight NvimTreeEndOfBuffer guifg=#11111b')
vim.cmd('highlight NvimTreeWinSeparator guibg=#11111b guifg=#11111b')
vim.cmd('highlight NvimTreeNormal guibg=#11111b')
vim.cmd('highlight NvimTreeStatusLine guibg=#11111b')
vim.cmd('highlight NvimTreeStatusLineNC guibg=#11111b')
vim.cmd('highlight EndOfBuffer guifg=#181825')

-- toggleterm
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#11111b', fg = '#cdd6f4' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#11111b', fg = '#cdd6f4' })

-- bufferline
vim.cmd('highlight BufferLineOffsetSeparator guifg=#11111b guibg=#11111b')
