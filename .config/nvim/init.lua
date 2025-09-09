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

-- Tab labels

vim.o.tabline = "%!v:lua.file_only()"

function _G.file_only()
    local s = ""
    local tabcount = vim.fn.tabpagenr("$")
    for i = 1, tabcount do
        local winnr = vim.fn.tabpagewinnr(i)
        local buflist = vim.fn.tabpagebuflist(i)
        local bufname = vim.fn.bufname(buflist[winnr])
        local filename = vim.fn.fnamemodify(bufname, ":t")
        if i == vim.fn.tabpagenr() then
            s = s .. "%#TabLineSel#"
        else s = s .. "%#TabLine#"
        end
        s = s .. " " .. (filename ~= "" and filename or "[No Name]") .. " "
    end
    s = s .. "%#TabLineFill#"
    return s
end

-- StatusLine

vim.opt.laststatus = 0

-- Line numbering

vim.opt.number = true
vim.opt.relativenumber = false
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
