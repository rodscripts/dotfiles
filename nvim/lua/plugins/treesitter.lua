vim.pack.add({
	{ src = "https://github.com/reybits/ts-forge.nvim" },
})

require("ts-forge").setup({
	auto_install = false,
	ensure_installed = {
		"bash",
		"c",
        "cpp",
        "python",
		"css",
		"html",
		"javascript",
        "typescript",
		"tsx",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"query",
		"vim",
		"vimdoc",
	},
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})
