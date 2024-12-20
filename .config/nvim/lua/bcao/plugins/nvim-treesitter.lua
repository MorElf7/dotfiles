return {
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
}
