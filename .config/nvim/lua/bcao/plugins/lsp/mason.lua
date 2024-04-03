return {
  "williamboman/mason.nvim",
  event = { "BufRead", "BufNewFile" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")
    local mason_null_ls = require("mason-null-ls")
    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "lua_ls",
        "pyright",
        "clangd",
        "csharp_ls",
        "jdtls",
        "gopls",
        "texlab",
      },

      -- auto-install configured servers (with lspconfig)
      automatic_installation = false, -- not the same as ensure_installed
    })

    mason_null_ls.setup({
      -- list of formatters & linters for mason to install
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "clang-format",
        "ruff",
        "gofumpt",
        "golines",
        "goimports-reviser",
        "sqlfluff",
        "textlint",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true,
    })
  end,
}
