return {
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
    config = function()
        require("neogen").setup({
            snippet_engine = "luasnip",
        })
    end,
}
