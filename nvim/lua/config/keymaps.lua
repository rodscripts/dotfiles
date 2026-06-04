local vim = vim

vim.keymap.set("n", "<leader>v", ":vsplit<CR>") -- Split right
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Show directory
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>") -- Clear highlights

-- Move line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Replace all occurrences of a word in the current file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { silent = false })

-- Buffers
vim.keymap.set("n", "<S-Right>", ":bnext<CR>", { silent = false }) -- Navigate right
vim.keymap.set("n", "<S-Left>", ":bprevious<CR>", { silent = false }) -- Navigate left
vim.keymap.set("n", "<C-w>", ":bwipeout<CR>", { silent = false }) -- Close buffer

-- Tabs
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>") -- New tab
vim.keymap.set("n", "<leader>tw", ":tabclose<CR>") -- Close tab
vim.keymap.set("n", "<leader>ts", ":tab split<CR>") -- Split current tab
vim.keymap.set("n", "<leader><Tab>", ":tabnext<CR>") -- Next tab (Tab)
vim.keymap.set("n", "<leader><S-Tab>", ":tabprevious<CR>") -- Previous tab (Shift tab)

-- Small terminal
local term_win = nil
local term_buf = nil

vim.keymap.set("n", "<leader>st", function()
    -- Close window if already exists
    if term_win and vim.api.nvim_win_is_valid(term_win) then
        vim.api.nvim_win_close(term_win, true)
        term_win = nil
        return
    end

    local function open_term()
        vim.cmd.new()
        vim.cmd.wincmd("J")
        vim.api.nvim_win_set_height(0, 12)
        vim.wo.winfixheight = true
    end

    -- Reuse buffer if already exists
    if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
        open_term()
        vim.api.nvim_win_set_buf(0, term_buf)
        term_win = vim.api.nvim_get_current_win()
        vim.cmd.startinsert()
        return
    end

    -- Otherwise create a new terminal buffer
    open_term()
    vim.cmd.term()
    vim.cmd.startinsert()

    term_win = vim.api.nvim_get_current_win()
    term_buf = vim.api.nvim_get_current_buf()
end)

vim.keymap.set("t", "<Esc>", "<C-\\><C-N>") -- Esc to exit terminal

-- Copy (yank) to system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Use system clipboard
vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)
