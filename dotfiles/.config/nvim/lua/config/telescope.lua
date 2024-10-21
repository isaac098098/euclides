local builtin = require('telescope.builtin')

--Keymaps
vim.keymap.set('n', '<localleader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<localleader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<localleader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<localleader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

return {
    defaults = {
        preview = false,
        prompt_prefix = "   ",
        selection_caret = " ",
        entry_prefix = " ",
        sorting_strategy = "ascending",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
            },
            width = 0.58,
            height = 0.50,
        },
        pickers = {
            find_files = { preview = false },
        },
        mappings = {
            n = { ["q"] = require("telescope.actions").close },
        },
    },

    extensions_list = { "themes", "terms" },
    extensions = {},
}
