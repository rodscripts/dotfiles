vim.pack.add({
    {src = "https://github.com/nvim-telescope/telescope.nvim"},
    {src = "https://github.com/nvim-lua/plenary.nvim"},
    {src = "https://github.com/nvim-tree/nvim-web-devicons"},
    {src = "https://github.com/nvim-telescope/telescope-ui-select.nvim"},
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = "Search files" })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = "Search grep" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search current word" })
vim.keymap.set("n", "<leader>sr", builtin.oldfiles, { desc = "Search recent files" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers" })

vim.keymap.set("n", "<leader>/", function()
    builtin.current_buffer_fuzzy_find()
end, {desc = "Search in the current buffer"})

require("telescope").setup {
    defaults = {
        layout_strategy = "bottom_pane",
        sorting_strategy = "descending",
        border = true,
        hidden = true,
        layout_config = {
            height = 0.4,
            prompt_position = "bottom",
        },
    },
    pickers = {
        live_grep = {
            file_ignore_patterns = {"node_modules", ".git"},
            additional_args = function(_)
                return { "--hidden" }
            end
        },
        find_files = {
            file_ignore_patterns = {"node_modules", ".git"},
            hidden = true
        }
    }
}

require("telescope").load_extension("ui-select")
