return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                -- python = { "isort", "black" },
                -- Use a sub-list to run only the first available formatter
                javascript = { "prettierd", "prettier", stop_after_first = true },
                javascriptreact = { "prettierd", "prettier", stop_after_first = true },
                typescript = { "prettierd", "prettier", stop_after_first = true },
                typescriptreact = { "prettierd", "prettier", stop_after_first = true },
                -- json = { "prettierd", "prettier", stop_after_first = true },
                jsonc = { "prettierd", "prettier", stop_after_first = true },
                json = { "jq" },
                cpp = { "clang-format" },
                java = { "clang-format" },
                go = { "gofumpt", "goimports-reviser", "golines" },
                tex = { "latexindent" },
                sh = { "shfmt" },
                xml = { "xmlformatter" },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 2000,
                lsp_fallback = true,
            },
        })
    end,
}
