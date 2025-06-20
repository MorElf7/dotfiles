return {
    "neovim/nvim-lspconfig",
    event = { "BufRead" },
    dependencies = {
        -- "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local util = require("lspconfig/util")

        -- import cmp-nvim-lsp plugin
        -- local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap -- for conciseness

        local opts = { noremap = true, silent = true }
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                opts.buffer = args.buf

                -- set keybinds
                -- opts.desc = "Show LSP references"
                -- keymap.set("n", "<leader>cr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
                --
                -- opts.desc = "Go to declaration"
                -- keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, opts) -- go to declaration
                --
                -- opts.desc = "Show LSP definitions"
                -- keymap.set("n", "<leader>cd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
                --
                -- opts.desc = "Show LSP implementations"
                -- keymap.set("n", "<leader>ci", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
                --
                -- opts.desc = "Show LSP type definitions"
                -- keymap.set("n", "<leader>ct", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

                opts.desc = "See available code actions"
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

                opts.desc = "Smart rename"
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

                -- opts.desc = "Show buffer diagnostics"
                -- keymap.set("n", "<leader>bd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

                -- opts.desc = "Go to previous diagnostic"
                -- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
                --
                -- opts.desc = "Go to next diagnostic"
                -- keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
                --
                -- opts.desc = "Show documentation for what is under cursor"
                -- keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
            end,
        })

        -- used to enable autocompletion (assign to every lsp server config)
        -- local capabilities = cmp_nvim_lsp.default_capabilities()
        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN] = " ",
                    [vim.diagnostic.severity.HINT] = "󰠠 ",
                    [vim.diagnostic.severity.INFO] = " ",
                },
                linehl = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.HINT] = "",
                    [vim.diagnostic.severity.INFO] = "",
                },
                numhl = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.HINT] = "",
                    [vim.diagnostic.severity.INFO] = "",
                },
            },
        })

        vim.lsp.enable({
            "html",
            "ts_ls",
            "denols",
            "cssls",
            "marksman",
            "bashls",
            "texlab",
            "clangd",
            "gopls",
            "pyright",
            "ruff",
            "lua_ls",
        })
        -- configure html server
        vim.lsp.config("html", {
            capabilities = capabilities,
            filetypes = { "html" },
        })

        -- configure typescript server with plugin
        vim.lsp.config("ts_ls", {
            capabilities = capabilities,
            root_markers = util.root_pattern("package.json"),
            single_file_support = false,
        })

        -- configure deno server with plugin
        vim.lsp.config("denols", {
            capabilities = capabilities,
            filetypes = { "css" },
        })

        -- configure markdown server
        vim.lsp.config("marksman", {
            capabilities = capabilities,
            filetypes = { "markdown" },
        })

        -- configure cs server
        -- vim.lsp.config["csharp_ls",{
        --   capabilities = capabilities,
        --   filetypes = { "cs" },
        -- })

        -- configure bash server
        vim.lsp.config("bashls", {
            capabilities = capabilities,
            filetypes = { "sh" },
        })

        -- configure LaTex server
        vim.lsp.config("texlab", {
            capabilities = capabilities,
            filetypes = { "tex", "plaintex", "bib" },
        })

        -- configure c/c++ server
        vim.lsp.config("clangd", {
            capabilities = capabilities,
            filetypes = { "c", "cpp" },
        })

        -- configure go server
        vim.lsp.config("gopls", {
            capabilities = capabilities,
            filetypes = { "go", "gomod", "gowork", "gotmpl" },
            root_markers = util.root_pattern("go.work", "go.mod", ".git"),
            settings = {
                gopls = {
                    completeUnimported = true,
                    usePlaceholders = true,
                    analyses = {
                        unusedparams = true,
                    },
                },
            },
        })

        -- configure python server
        vim.lsp.config("pyright", {
            capabilities = capabilities,
            filetypes = { "python" },
        })

        -- configure python server
        vim.lsp.config("ruff", {
            capabilities = capabilities,
            filetypes = { "python" },
        })

        -- configure lua server (with special settings)
        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            filetypes = { "lua" },
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })
    end,
}
