return {
    "stevearc/oil.nvim",
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        vim.keymap.set("n", "-", "<cmd>Oil<cr>", { silent = true, noremap = true, desc = "Open Oil" })
        require("oil").setup({
            default_file_explorer = true,
            lsp_file_methods = {
                enabled = false,
            },
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-c>"] = "actions.close",
                ["<C-l>"] = false,
                ["<C-h>"] = false,
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = {
                    "actions.cd",
                    opts = { scope = "tab" },
                    desc = ":tcd to the current oil directory",
                    mode = "n",
                },
                ["gs"] = "actions.change_sort",
                ["gx"] = "actions.open_external",
                ["g."] = "actions.toggle_hidden",
                ["g\\"] = "actions.toggle_trash",
            },
        })
    end,
}
