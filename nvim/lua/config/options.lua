local vim = vim

vim.g.mapleader = " " -- Leader key: space
vim.g.have_nerd_font = true

vim.o.number = true
vim.o.termguicolors = true
vim.o.relativenumber = true
vim.o.modeline = false

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.scrolloff = 8

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.incsearch = true
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrap = false

-- Box style (autocomplete etc)
vim.o.completeopt = "menu,menuone,noselect,preview"
vim.o.winborder = "rounded"
vim.o.pumheight = 10
vim.o.showmode = false

vim.diagnostic.config({ virtual_text = true }) -- Render inline text (diagnostics etc)
