return {
    {
        "saghen/blink.cmp",
        dependencies = {
            {
                enabled = false,
                "L3MON4D3/LuaSnip",
                version = "v2.*",
                build = "make install_jsregexp",
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                end,
            },
            "rafamadriz/friendly-snippets",
        },
        version = "*",
        opts = {
            -- 'default' for mappings similar to built-in completion
            -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
            -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
            keymap = { preset = "default" },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },
            cmdline = {
                keymap = {
                    -- recommended, as the default keymap will only show and select the next item
                    ["<Tab>"] = { "show", "accept" },
                },
                completion = { ghost_text = { enabled = false }, menu = { auto_show = true } },
            },
            -- snippets = { preset = "luasnip" },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
        opts_extend = { "sources.default" },
    },
    {
        enabled = false,
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer", -- source for text in buffer
            "hrsh7th/cmp-path", -- source for file system paths
            "L3MON4D3/LuaSnip", -- snippet engine
            "saadparwaiz1/cmp_luasnip", -- for autocompletion
            "rafamadriz/friendly-snippets", -- useful snippets
            "onsails/lspkind.nvim", -- vs-code like pictograms
            "hrsh7th/cmp-cmdline",
        },
        config = function()
            local cmp = require("cmp")

            local luasnip = require("luasnip")

            local lspkind = require("lspkind")

            -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                enabled = function()
                    local bufs = {
                        "prompt",
                    }
                    local buftype = vim.bo.buftype
                    for _, b in ipairs(bufs) do
                        if buftype == b then
                            return false
                        end
                    end

                    local files = {
                        "oil",
                    }

                    local filetype = vim.bo.filetype

                    for _, f in ipairs(files) do
                        if filetype == f then
                            return false
                        end
                    end

                    return true
                end,
                completion = {
                    completeopt = "menu,menuone,preview,noselect",
                },
                snippet = { -- configure how nvim-cmp interacts with snippet engine
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }), -- previous suggestion
                    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }), -- next suggestion
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                }),
                -- sources for autocompletion
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- snippets
                    { name = "buffer" }, -- text within current buffer
                    { name = "path" }, -- file system paths
                    -- { name = "codeium" }, -- codeium AI code generation
                }),
                -- configure lspkind for vs-code like pictograms in completion menu
                formatting = {
                    format = lspkind.cmp_format({
                        -- maxwidth = 50,
                        -- ellipsis_char = "...",
                        mode = "symbol",
                        maxwidth = 50,
                        ellipsis_char = "...",
                        symbol_map = { Codeium = "" },
                    }),
                },
            })
            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })
            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
                matching = { disallow_symbol_nonprefix_matching = false },
            })
        end,
    },
}
