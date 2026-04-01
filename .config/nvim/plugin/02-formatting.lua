vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
require("conform").setup({
  formatters_by_ft = {
    -- Conform will run multiple formatters sequentially
    -- Use a sub-list to run only the first available formatter
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    cpp = { "clang-format" },
    c = { "clang-format" },
    java = { "clang-format" },
    go = { "gofmt" },
    sh = { "shfmt" },
    zsh = { "shfmt" },
    bash = { "shfmt" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 5000,
    lsp_fallback = false,
  },
})
