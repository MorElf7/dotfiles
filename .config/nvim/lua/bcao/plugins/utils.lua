return {
    {
        "stevearc/aerial.nvim",
        opts = {},
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "ThePrimeagen/harpoon",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        branch = "harpoon2",
        events = { "BufRead", "BufNewFile" },
        config = function()
            local harpoon = require("harpoon")

            -- REQUIRED
            harpoon:setup()
            -- REQUIRED

            vim.keymap.set("n", "<leader>hm", function()
                harpoon:list():add()
            end)
            vim.keymap.set("n", "<leader>hl", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end)

            vim.keymap.set("n", "<leader>1", function()
                harpoon:list():select(1)
            end)
            vim.keymap.set("n", "<leader>2", function()
                harpoon:list():select(2)
            end)
            vim.keymap.set("n", "<leader>3", function()
                harpoon:list():select(3)
            end)
            vim.keymap.set("n", "<leader>4", function()
                harpoon:list():select(4)
            end)
            vim.keymap.set("n", "<leader>5", function()
                harpoon:list():select(5)
            end)
        end,
    },
    {
        "danymat/neogen",
        keys = {
            {
                "<leader>ng",
                function()
                    require("neogen").generate()
                end,
                desc = "Generate Annotations (Neogen)",
                noremap = true,
                silent = true,
            },
        },
        -- config = function()
        --     require("neogen").setup({
        --         snippet_engine = "luasnip",
        --     })
        -- end,
    },
    {
        enabled = false,
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "sindrets/diffview.nvim", -- optional - Diff integration
            "nvim-telescope/telescope.nvim", -- optional
        },
        keys = {
            -- {
            --     "<leader>gg",
            --     ":Neogit<Return>",
            --     silent = true,
            --     noremap = true,
            -- },
            {
                "<leader>gd",
                ":DiffviewOpen<Return>",
                silent = true,
                noremap = true,
            },
        },
        config = function()
            require("neogit").setup({
                graph_style = "unicode",
                telescope_sorter = function()
                    return require("telescope").extensions.fzf.native_fzf_sorter()
                end,
                integrations = {
                    -- If enabled, use telescope for menu selection rather than vim.ui.select.
                    -- Allows multi-select and some things that vim.ui.select doesn't.
                    telescope = true,
                    -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `diffview`.
                    -- The diffview integration enables the diff popup.
                    --
                    -- Requires you to have `sindrets/diffview.nvim` installed.
                    diffview = true,

                    -- If enabled, uses fzf-lua for menu selection. If the telescope integration
                    -- is also selected then telescope is used instead
                    -- Requires you to have `ibhagwan/fzf-lua` installed.
                    fzf_lua = false,
                },
            })
        end,
    },
    {
        "kylechui/nvim-surround",
        event = { "BufRead", "BufNewFile" },
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = true,
        enabled = false,
    },
    {
        "echasnovski/mini.surround",
        version = false,
        events = { "BufRead", "BufNewFile" },
        config = function()
            require("mini.surround").setup()
        end,
    },
    {
        "echasnovski/mini.ai",
        version = false,
        events = { "BufRead", "BufNewFile" },
        config = function()
            require("mini.ai").setup()
        end,
    },
    {
        "echasnovski/mini.comment",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        version = false,
        events = { "BufRead", "BufNewFile" },
        config = function()
            vim.g.skip_ts_context_commentstring_module = true
            require("ts_context_commentstring").setup({
                enable_autocmd = false,
            })
            require("mini.comment").setup({
                options = {
                    custom_commentstring = function()
                        return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
                    end,
                },
            })
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = { "InsertEnter" },
        dependencies = {
            -- "hrsh7th/nvim-cmp",
        },
        config = function()
            -- import nvim-autopairs
            local autopairs = require("nvim-autopairs")

            -- configure autopairs
            autopairs.setup({
                check_ts = true, -- enable treesitter
                ts_config = {
                    lua = { "string" }, -- don't add pairs in lua string treesitter nodes
                    javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
                    java = false, -- don't check treesitter on java
                },
            })

            -- -- import nvim-autopairs completion functionality
            -- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            --
            -- -- import nvim-cmp plugin (completions plugin)
            -- local cmp = require("cmp")
            --
            -- -- make autopairs and completion work together
            -- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },
    {
        {
            "nvim-treesitter/nvim-treesitter",
            -- commit = "17e77749c1f14f7e2bbae8c92c1b1cad1c2f26a9",
            -- event = { "BufRead", "BufNewFile" },
            build = ":TSUpdate",
            dependencies = {
                "windwp/nvim-ts-autotag",
            },
            config = function()
                -- import nvim-treesitter plugin
                local treesitter = require("nvim-treesitter.configs")

                -- configure treesitter
                treesitter.setup({ -- enable syntax highlighting
                    highlight = {
                        enable = true,
                        disable = { "latex" },
                        -- additional_vim_regex_highlighting = { "latex", "markdown" },
                    },
                    -- enable indentation
                    indent = { enable = true },
                    -- enable autotagging (w/ nvim-ts-autotag plugin)
                    autotag = { enable = true },
                    -- ensure these language parsers are installed
                    ensure_installed = {
                        "json",
                        "javascript",
                        "typescript",
                        "java",
                        "python",
                        "go",
                        "tsx",
                        "yaml",
                        "html",
                        "css",
                        "markdown",
                        "markdown_inline",
                        "graphql",
                        "bash",
                        "lua",
                        "vim",
                        "dockerfile",
                        "gitignore",
                        "sql",
                        "tmux",
                        "c",
                        "cpp",
                        "nix",
                    },
                    -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
                    -- context_commentstring = {
                    --   enable = true,
                    --   enable_autocmd = false,
                    -- },
                    -- auto install above language parsers
                    auto_install = true,
                })
            end,
        },
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        config = function()
            require("nvim-web-devicons").set_icon({
                gql = {
                    icon = "",
                    color = "#e535ab",
                    cterm_color = "199",
                    name = "GraphQL",
                },
            })
        end,
    },
    {
        "ThePrimeagen/refactoring.nvim",
        enabled = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("refactoring").setup({
                prompt_func_return_type = {
                    go = false,
                    java = false,

                    cpp = false,
                    c = false,
                    h = false,
                    hpp = false,
                    cxx = false,
                },
                prompt_func_param_type = {
                    go = false,
                    java = false,

                    cpp = false,
                    c = false,
                    h = false,
                    hpp = false,
                    cxx = false,
                },
                printf_statements = {},
                print_var_statements = {},
                show_success_message = false, -- shows a message with information about the refactor on success
                -- i.e. [Refactor] Inlined 3 variable occurrences
            })
            vim.keymap.set({ "n", "x" }, "<leader>rr", function()
                require("refactoring").select_refactor()
            end)
            vim.keymap.set("x", "<leader>re", function()
                require("refactoring").refactor("Extract Function")
            end)
            vim.keymap.set("x", "<leader>rf", function()
                require("refactoring").refactor("Extract Function To File")
            end)
            -- Extract function supports only visual mode
            vim.keymap.set("x", "<leader>rv", function()
                require("refactoring").refactor("Extract Variable")
            end)
            -- Extract variable supports only visual mode
            vim.keymap.set("n", "<leader>rI", function()
                require("refactoring").refactor("Inline Function")
            end)
            -- Inline func supports only normal
            vim.keymap.set({ "n", "x" }, "<leader>ri", function()
                require("refactoring").refactor("Inline Variable")
            end)
            -- Inline var supports both normal and visual mode

            vim.keymap.set("n", "<leader>rb", function()
                require("refactoring").refactor("Extract Block")
            end)
            vim.keymap.set("n", "<leader>rbf", function()
                require("refactoring").refactor("Extract Block To File")
            end)
            -- Extract block supports only normal mode
        end,
    },
    {
        "lervag/vimtex",
        -- enabled = false,
        lazy = false, -- lazy-loading will disable inverse search
        config = function()
            vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
            vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
            vim.g.vimtex_compiler_latexmk = {
                out_dir = "./latexbuild",
                aux_dir = "./latexbuild",
            }
            vim.g.vimtex_view_method = "skim"
            vim.g.vimtex_compiler_method = "latexmk"
        end,
    },
}
