return {
    "nvim-lua/plenary.nvim", -- lua functions that many plugins use
    {
        "christoomey/vim-tmux-navigator", -- tmux & split window navigation
        lazy = true,
        enabled = false,
        event = "VeryLazy",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        },
    },
    {
        "mrjones2014/smart-splits.nvim",
        lazy = false,
        config = function()
            require("smart-splits").setup()

            -- resize
            vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
            vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
            vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
            vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
            -- moving between splits
            vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
            vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
            vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
            vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
            vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)
        end,
    },
}
