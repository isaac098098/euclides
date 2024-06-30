" vim-plug

call plug#begin('~/.local/share/nvim/plugged')

"Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'lervag/vimtex'

Plug 'nvim-lualine/lualine.nvim'

Plug 'nordtheme/vim'

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

Plug 'nvim-tree/nvim-tree.lua'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-tree/nvim-web-devicons' 

Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim', { 'brach': '0.1.x' }

Plug 'nvim-lua/popup.nvim'

Plug 'nvim-telescope/telescope-media-files.nvim'

"Plug 'SirVer/ultisnips'

Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}

Plug 'norcalli/nvim-colorizer.lua'

Plug 'folke/zen-mode.nvim'

call plug#end()

" Filetype plugins

filetype plugin on
filetype indent on
syntax on

if has('termguicolors')
	set termguicolors
endif

" Colorschemes

" nord

"colorscheme nord
"autocmd VimEnter * hi ZenBg ctermbg=NONE guibg=#2E3440

" catppuccin

"catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

colorscheme catppuccin-mocha 
:highlight CocFloating guibg=#181825
:highlight CocMenuSel guibg=#363a4f
:highlight CocSearch guifg=#89b4fa
autocmd VimEnter * hi ZenBg ctermbg=NONE guibg=#1E1E2F

" nvim-tree

nnoremap <leader>tt <cmd>NvimTreeToggle<cr>
nnoremap <leader>tf <cmd>NvimTreeFindFile<cr>

lua << END

-- nvim-tree

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)
end

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  on_attach = my_on_attach,
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

vim.opt.termguicolors = true 

vim.g.nvim_tree_respect_buf_cwd = 1

-- statusline

require('lualine').setup {
	options = {
	    icons_enabled = true,
	    component_separators = { left = '', right = ''},
	    section_separators = { left = '', right = ''},
	    disabled_filetypes = {
          statusline = {},
	      winbar = {},
	      'NvimTree',
	    },
	    ignore_focus = {},
	    always_divide_middle = true,
	    globalstatus = false,
	    refresh = {
	      statusline = 1000,
	      tabline = 1000,
	      winbar = 1000,
	    }
	  },
        sections = {
	    lualine_a = {'mode'},
	    lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {{'filename',path=1}},
	    lualine_x = {'encoding', 'fileformat', 'filetype'},
	    lualine_y = {'progress'},
	    lualine_z = {'location'}
	  },
	  inactive_sections = {
	    lualine_a = {},
	    lualine_b = {},
	    lualine_c = {},
	    lualine_x = {},
	    lualine_y = {},
	    lualine_z = {}
	  },
	  tabline = {},
	  winbar = {},
	  inactive_winbar = {},
	  extensions = {}
}

-- nvim-treesitter

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    --disable = function(lang, buf)
        --local max_filesize = 100 * 1024 -- 100 KB
        --local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        --if ok and stats and stats.size > max_filesize then
            --return true
        --end
    --end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = {"latex"},
  },
}


END

lua require'nvim-treesitter.configs'.setup{highlight={enable=true}}

lua << EOF

-- telescope-media-files.nvim

require('telescope').load_extension('media_files')
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

EOF

" coc-vim

"inoremap <silent><expr> <C-d>
      "\ coc#pum#visible() ? coc#pum#next(1) :
      "\ CheckBackspace() ? "\<C-d>" :
      "\ coc#refresh()
"inoremap <expr><C-e> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
"
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              "\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"function! CheckBackspace() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

" ulti-snippets

"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="ll"
"let g:UltiSnipsJumpBackwardTrigger="kk"

"nnoremap <leader>u <Cmd>call UltiSnips#RefreshSnippets()<CR>

"inoremap <silent> ( <Cmd>call UltiSnips#Anon('($1)','','i','',1)<cr>
"inoremap <silent> { <Cmd>call UltiSnips#Anon('{$1}','','i','',1)<cr>
"inoremap <silent> [ <Cmd>call UltiSnips#Anon('[$1]','','i','',1)<cr>
"inoremap <silent> " <Cmd>call UltiSnips#Anon('"$1"','','i','',1)<cr>
"inoremap <silent> \| <Cmd>call UltiSnips#Anon('\|$1\|','','i','',1)<cr>
"inoremap <silent> ' <Cmd>call UltiSnips#Anon("'$1'",'','i','',1)<cr>

inoremap oi <Esc>
map j gj
map k gk

" vim-snippets

"let g:UltiSnipsExpandTrigger       = '<Tab>'    " use Tab to expand snippets
"let g:UltiSnipsJumpForwardTrigger  = '<Tab>'    " use Tab to move forward through tabstops
"let g:UltiSnipsJumpBackwardTrigger = '<A-Tab>'  " use Shift-Tab to move backward through tabstops

"telescope.nvim

"nnoremap <leader>ff <cmd>Telescope find_files<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" no line wrap

"set wrap
"set linebreak
"set tw=160
"set wrapmargin=0

" Indentation

set breakindent
set formatoptions=l
set lbr

" line number and indentation

set nu
set numberwidth=1

" vimtex
" Requieres tree-sitter-cli

" Wayland"

"function! Synctex()
	"let vimura_param = " --synctex-forward " . line('.') . ":" . col('.') . ":" . expand('%:p') . " " . substitute(expand('%:p'),"tex$","pdf","")
	"if has('nvim')
		"call jobstart("vimura neovim" . vimura_param)
	"else
		"exec "silent !vimura vim" . vimura_param . "&"
	"endif
	"redraw!
"endfunction 
"
"map <silent> <C-enter> :call Synctex()<cr>

"augroup vimtex
	"au!
	"au User VimtexEventCompileSuccess call Synctex()
"augroup END

let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_forward_search_on_start = 'false'
let g:vimtex_quickfix_mode = 0
let g:vimtex_view_automatic = 0

"zen mode
let g:vimtex_compiler_silent = 1

" Remove lag due to match search
let g:loaded_matchparen = 0
let g:vimtex_motion_matchparen = 0
let g:vimtex_matchparen_enabled = 0

let g:vimtex_compiler_latexmk_engines = {
        \ '_'                : '-pdf',
        \ 'pdfdvi'           : '-pdfdvi',
        \ 'pdfps'            : '-pdfps',
        \ 'pdflatex'         : '-pdf',
        "\ '_'           : '-lualatex',
		"\ '_'          : '-xelatex',
        "\ 'context (pdftex)' : '-pdf -pdflatex=texexec',
        \ 'context (luatex)' : '-pdf -pdflatex=context',
        \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
        \}

let g:vimtex_compiler_latexmk = {
        \ 'build_dir' : '',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
			\   '-xelatex',
			\   '-verbose',
			\   '-file-line-error',
			\   '-synctex=1',
			\   '-interaction=nonstopmode',
        \ ],
        \}

" X11

augroup vimtex
	au!
	au User VimtexEventCompileSuccess VimtexView 
augroup END

" LuaSnip

" Load snippets from ~/.config/nvim/LuaSnip/
lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})

nnoremap <leader>u <Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})<CR>

lua << EOF

-- Somewhere in your Neovim startup, e.g. init.lua
require("luasnip").config.set_config({ -- Setting LuaSnip config

  -- Enable autotriggered snippets
  keep_roots = true, --Link children
  exit_roots = true, --Link children
  enable_autosnippets = true,
  link_children = true,

  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",
})

-- Undo snippet

local untrigger = function()
  -- get the snippet
  local snip = require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()].parent.snippet
  -- get its trigger
  local trig = snip.trigger
  -- replace that region with the trigger
  local node_from, node_to = snip.mark:pos_begin_end_raw()
  vim.api.nvim_buf_set_text(
    0,
    node_from[1],
    node_from[2],
    node_to[1],
    node_to[2],
    { trig }
    --{" "}
  )
  -- reset the cursor-position to ahead the trigger
  vim.fn.setpos(".", { 0, node_from[1] + 1, node_from[2] + 1 + string.len(trig) })
end

vim.keymap.set({ "i", "s" }, "<C-i>", function()
  if require("luasnip").in_snippet() then
    untrigger()
    require("luasnip").unlink_current()
  end
end, {
  desc = "Undo a snippet",
})

EOF

" Use Tab to expand and jump through snippets
imap <silent><expr> jk luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
"imap <silent><expr> ll luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
smap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> wq luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> wq  luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'

" Cycle forward through choice nodes with Control-f (for example)
imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'

" Tabs

iunmap <tab>
set tabstop=4
set shiftwidth=4
"set expandtab

" Título de las pestañas 

function! Tabline() abort
    let l:line = ' '
    let l:current = tabpagenr()

    for l:i in range(1, tabpagenr('$'))
        if l:i == l:current
            let l:line .= '%#TabLineSel#'
        else
            let l:line .= '%#TabLine#'
        endif

		let bufnrlist = tabpagebuflist(l:i)

		for bufnr in bufnrlist
			if getbufvar(bufnr, "&modified")
				let l:line .= ' [+]'
				break
			endif
		endfor

        let l:label = fnamemodify(
            \ bufname(tabpagebuflist(l:i)[tabpagewinnr(l:i) - 1]),
            \ ':t'
        \ )

        let l:line .= '%' . i . 'T' " Starts mouse click target region.
        let l:line .= ' ' . l:label . ' '
    endfor

    let l:line .= '%#TabLineFill#'
    let l:line .= '%T' " Ends mouse click target region(s).

    return l:line
endfunction

set tabline=%!Tabline()

" Wayland clipboard, requires wl-clipboard

"nnoremap "+y :call system("wl-copy", @") <CR>

"Cursor

set guicursor=i:hor10
set guicursor+=n-v-c:blinkon0

"Colorizer

lua require'colorizer'.setup()

"zen-mode

lua << EOF

local api = vim.api

api.nvim_set_keymap("n", "<leader>zm", ":ZenMode<CR>", {})

require("zen-mode").setup {
  window = {
    backdrop = 0, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    -- * a function that returns the width or the height
    width = 0.9, -- width of the Zen window
    height = 0.95, -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
      -- signcolumn = "no", -- disable signcolumn
      number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
      -- you may turn on/off statusline in zen mode by setting 'laststatus' 
      -- statusline will be shown only if 'laststatus' == 3
      laststatus = 1, -- turn off the statusline in zen mode
    },
    twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
    tmux = { enabled = false }, -- disables the tmux statusline
    -- this will change the font size on kitty when in zen mode
    -- to make this work, you need to set the following kitty options:
    -- - allow_remote_control socket-only
    -- - listen_on unix:/tmp/kitty
    kitty = {
      enabled = false,
      font = "+4", -- font size increment
    },
    -- this will change the font size on alacritty when in zen mode
    -- requires  Alacritty Version 0.10.0 or higher
    -- uses `alacritty msg` subcommand to change font size
    alacritty = {
      enabled = false,
      font = "14", -- font size
    },
    -- this will change the font size on wezterm when in zen mode
    -- See alse also the Plugins/Wezterm section in this projects README
    wezterm = {
      enabled = false,
      -- can be either an absolute font size or the number of incremental steps
      font = "+4", -- (10% increase per step)
    },
  },
  -- callback where you can add custom code when the Zen window opens
  on_open = function(win)
  		-- catppuccin-mocha

        vim.cmd("highlight MsgArea guifg=#1e1e2f")
        vim.cmd("highlight ModeMsg guifg=#1e1e2f")

		-- nord

        --vim.cmd("highlight MsgArea guifg=#2E3440")
        --vim.cmd("highlight ModeMsg guifg=#2E3440")
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
  		-- catppuccin-mocha
		
        vim.cmd("highlight MsgArea guifg=#cdd6f4")

  		-- nord
		
        --vim.cmd("highlight MsgArea guifg=#ECEFF4")
  end,
}
EOF
