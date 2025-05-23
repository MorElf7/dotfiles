return {
    {
        "webhooked/kanso.nvim",
        lazy = false,
        enabled = false,
        priority = 1000,
        config = function()
            require("kanso").setup({
                theme = "ink",
                transparent = true,
            })
            vim.cmd("colorscheme kanso")
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        enabled = true,
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("kanagawa").setup({
                theme = "wave",
                transparent = true,
            })
            vim.cmd("colorscheme kanagawa-wave")
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        enabled = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here

            require("catppuccin").setup({
                transparent_background = true,
                integrations = {
                    mini = {
                        enabled = true,
                        indentscope_color = "overlay0",
                    },
                    snacks = true,
                    blink_cmp = true,
                    bufferline = true,
                },
            })
            vim.cmd("colorscheme catppuccin-mocha")
        end,
    },
}
