 -- Vim
 
 -- Filetypes
 
 vim.cmd('filetype plugin on')
 vim.cmd('filetype indent on')
 
 -- Tabs and indentation
 
 vim.opt.tabstop = 4
 vim.opt.softtabstop = 4
 vim.opt.shiftwidth = 4
 vim.opt.expandtab = true
 vim.opt.breakindent = true
 vim.opt.linebreak = true
 
 -- Line numbering
 
 vim.opt.number = true
 vim.opt.relativenumber = true
 vim.opt.numberwidth = 1
 
 -- Highlighting
 
 vim.cmd('let loaded_matchparen=1')
 vim.opt.fillchars:append('eob: ')
 
 -- Keybindings
 
 vim.g.mapleader = ' '
 vim.g.localleader = '\\'
 
 -- Normal mode
 vim.keymap.set('n','j','gj')
 vim.keymap.set('n','k','gk')
 vim.keymap.set('n','T','gT')
 vim.cmd('nnoremap <CR> :write<CR>')
 
 -- Visual mode
 vim.keymap.set('v','<C-j>','<Esc>')
 
 -- Select mode
 vim.keymap.set('s','<C-j>','<Esc>')
 
 -- Insert mode
 vim.keymap.set('i','<C-j>','<Esc>')
 vim.keymap.set('i','<C-e>','<C-o>$')
 
 --Plugins
 
 require("config.lazy")
