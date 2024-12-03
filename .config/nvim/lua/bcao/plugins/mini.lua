return {
    {
        "echasnovski/mini.indentscope",
        enabled = false,
        version = false,
        events = { "BufRead", "BufNewFile" },
        opts = {
            draw = {
                delay = 100,
                fg = "#dcd7ba",
            },
            symbol = "│",
            options = { try_as_border = true },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "Trouble",
                    "startify",
                    "alpha",
                    "help",
                    "lazy",
                    "mason",
                    "notify",
                    "oil",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
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
}
