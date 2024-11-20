return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        default_file_explorer = true,
        lsp_file_methods = {
            enabled = false,
        },
        keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["<C-c>"] = "actions.close",
            ["-"] = "actions.parent",
            ["_"] = "actions.open_cwd",
            ["`"] = "actions.cd",
            ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory", mode = "n" },
            ["gs"] = "actions.change_sort",
            ["gx"] = "actions.open_external",
            ["g."] = "actions.toggle_hidden",
            ["g\\"] = "actions.toggle_trash",
        },
        -- Set to false to disable all of the above keymaps
        use_default_keymaps = false,
    },
    lazy = true,
    -- Optional dependencies
    keys = {
        { "-", "<cmd>Oil --float<cr>", silent = true, noremap = true, desc = "Open Oil" },
    },
}
