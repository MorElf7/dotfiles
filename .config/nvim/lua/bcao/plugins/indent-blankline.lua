return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufRead", "BufNewFile" },
    enabled = false,
    main = "ibl",
    config = function()
        vim.cmd("highlight IndentBlanklineContextChar guifg=#878787 gui=nocombine")
        require("ibl").setup({
            indent = { char = "▏" },
            scope = {
                highlight = "IndentBlanklineContextChar",
                show_start = false,
                show_end = false,
            },
        })
    end,
}
