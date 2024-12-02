return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufRead", "BufNewFile" },
    main = "ibl",
    config = function()
        vim.cmd("highlight IndentBlanklineContextChar guifg=#DCD7BA gui=nocombine")
        require("ibl").setup({
            indent = { char = "│" },
            scope = {
                highlight = "IndentBlanklineContextChar",
                show_start = true,
                show_end = true,
            },
        })
    end,
}
