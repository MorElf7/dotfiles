return {
    -- enabled = false,
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration
        "nvim-telescope/telescope.nvim", -- optional
    },
    keys = {
        -- {
        --     "<leader>gg",
        --     ":Neogit<Return>",
        --     silent = true,
        --     noremap = true,
        -- },
        {
            "<leader>gd",
            ":DiffviewOpen<Return>",
            silent = true,
            noremap = true,
        },
    },
    config = function()
        require("neogit").setup({
            graph_style = "unicode",
            telescope_sorter = function()
                return require("telescope").extensions.fzf.native_fzf_sorter()
            end,
            integrations = {
                -- If enabled, use telescope for menu selection rather than vim.ui.select.
                -- Allows multi-select and some things that vim.ui.select doesn't.
                telescope = true,
                -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `diffview`.
                -- The diffview integration enables the diff popup.
                --
                -- Requires you to have `sindrets/diffview.nvim` installed.
                diffview = true,

                -- If enabled, uses fzf-lua for menu selection. If the telescope integration
                -- is also selected then telescope is used instead
                -- Requires you to have `ibhagwan/fzf-lua` installed.
                fzf_lua = false,
            },
        })
    end,
}
