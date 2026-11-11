vim.pack.add({{
	src = "https://github.com/nvim-treesitter/nvim-treesitter"
}})

require('nvim-treesitter').setup({
	ensure_installed = {
		"gdscript",
		"godot_resource",
		"gdshader",
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
		"cmake"
	},
	highlight = {
		enable = true,
	},
})
