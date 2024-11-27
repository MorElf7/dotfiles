return {
    "Exafunction/codeium.nvim",
    build = ":Codeium Auth",
    events = { "BufRead", "BufNewFile" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
            virtual_text = {
                enabled = false,
                key_bindings = {
                    accept = false, -- handled by nvim-cmp
                    next = "<M-]>",
                    prev = "<M-[>",
                },
            },
        })
    end,
}
