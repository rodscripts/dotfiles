vim.pack.add({
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
    { src = "https://github.com/b0o/SchemaStore.nvim" },
})

require("mason").setup()
require("mason-lspconfig").setup({})
require("mason-tool-installer").setup({
    ensure_installed = {
        "clangd",
        "stylua",
        "prettierd",
        "eslint",
        "lua_ls",
        "tailwindcss-language-server",
        "ts_ls",
        "jsonls",
        "pyright",
        "zls",
    },
    auto_update = false,
    run_on_start = true,
})

-- LspAttach keymaps
vim.api.nvim_create_autocmd(
    "LspAttach",
    { --  Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
            vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc" -- Enable completion triggered by <c-x><c-o>

            local map = function(keys, func, desc, mode)
                mode = mode or "n"
                vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
            end

            -- Show definition
            map("K", vim.lsp.buf.hover, "Show definition")

            -- Rename variable under cursor. (Most language servers support renaming across files)
            map("grn", vim.lsp.buf.rename, "Rename")

            -- Execute a code action. (Possibly fix warnings and errors)
            map("ca", vim.lsp.buf.code_action, "Code action", { "n", "x" })

            -- Find references for the word under the cursor
            --map("grr", vim.lsp.buf.references, "Find references") -- Example of how it looks without telescope
            map("grr", require("telescope.builtin").lsp_references, "Find references")

            -- Jump to the implementation of the word under the cursor.
            map("gri", require("telescope.builtin").lsp_implementations, "Jump to implementation")

            -- Jump to the definition of a word under the cursor (Use <C-t> to jump back)
            map("grd", require("telescope.builtin").lsp_definitions, "Jump to definition")

            -- Jump to the type of the word under the cursor
            map("grt", require("telescope.builtin").lsp_type_definitions, "Jump to type definition")

            -- Go to declaration (Example: go to the header)
            map("grD", vim.lsp.buf.declaration, "Go to declaration")

            -- Fuzzy find all the symbols like functions, variables, types etc
            map("gO", require("telescope.builtin").lsp_document_symbols, "Open document symbols")

            -- Similar to document symbols, but for the entire project.
            map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open workspace symbols")

            -- Format source code
            map("<leader>li", vim.lsp.buf.format, "Format source code")
        end,
    }
)
