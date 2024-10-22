local builtin = require('telescope.builtin')

--Keymaps
vim.keymap.set('n', '<localleader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<localleader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<localleader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<localleader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

local colors = require("catppuccin.palettes").get_palette()
local TelescopeColor = {
    TelescopeMatching = { fg = colors.flamingo },
    TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },

    TelescopePromptPrefix = { bg = colors.surface0 },
    TelescopePromptNormal = { bg = colors.surface0 },
    TelescopeResultsNormal = { bg = colors.mantle },
    TelescopePreviewNormal = { bg = colors.mantle },
    TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
    TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
    TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
    TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
    TelescopeResultsTitle = { fg = colors.mantle },
    TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
}

for hl, col in pairs(TelescopeColor) do
    vim.api.nvim_set_hl(0, hl, col)
end

return {
    defaults = {
        preview = true,
        prompt_prefix = "   ",
        selection_caret = " ",
        entry_prefix = " ",
        sorting_strategy = "ascending",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
            },
            width = 0.87,
            height = 0.80,
        },
        pickers = {
            find_files = { preview = true },
        },
        mappings = {
            n = { ["q"] = require("telescope.actions").close },
        },
    },

    extensions_list = { "themes", "terms" },
    extensions = {},
}
