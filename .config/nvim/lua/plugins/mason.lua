return {
    "williamboman/mason.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        -- import mason
        local mason = require("mason")
        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

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
            -- list of LSPs for mason to install
            ensure_installed = {
                "ts_ls",
                "html",
                "cssls",
                "lua_ls",
                "pyright",
                "clangd",
                "jdtls",
                -- "csharp_ls",
                "jdtls",
                "gopls",
                "texlab",
                "ruff",
                "marksman",
                "bashls",
                "denols",
            },

            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })

        -- Install formatter/linters
        require("mason-tool-installer").setup({

            -- a list of all tools you want to ensure are installed upon
            ensure_installed = {
                "stylua",
                "gofumpt",
                "golines",
                "goimports-reviser",
                "gotests",
                "shfmt",
                "clang-format",
                "prettierd",
                "xmlformatter",
            },

            -- if set to true this will check each tool for updates. If updates
            -- are available the tool will be updated. This setting does not
            -- affect :MasonToolsUpdate or :MasonToolsInstall.
            -- Default: false
            auto_update = false,

            -- automatically install / update on startup. If set to false nothing
            -- will happen on startup. You can use :MasonToolsInstall or
            -- :MasonToolsUpdate to install tools and check for updates.
            -- Default: true
            run_on_start = true,

            -- set a delay (in ms) before the installation starts. This is only
            -- effective if run_on_start is set to true.
            -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
            -- Default: 0
            start_delay = 0,

            -- Only attempt to install if 'debounce_hours' number of hours has
            -- elapsed since the last time Neovim was started. This stores a
            -- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
            -- This is only relevant when you are using 'run_on_start'. It has no
            -- effect when running manually via ':MasonToolsInstall' etc....
            -- Default: nil
            debounce_hours = nil,

            -- By default all integrations are enabled. If you turn on an integration
            -- and you have the required module(s) installed this means you can use
            -- alternative names, supplied by the modules, for the thing that you want
            -- to install. If you turn off the integration (by setting it to false) you
            -- cannot use these alternative names. It also suppresses loading of those
            -- module(s) (assuming any are installed) which is sometimes wanted when
            -- doing lazy loading.
            integrations = {
                ["mason-lspconfig"] = true,
                ["mason-null-ls"] = true,
                ["mason-nvim-dap"] = true,
            },
        })
    end,
}
