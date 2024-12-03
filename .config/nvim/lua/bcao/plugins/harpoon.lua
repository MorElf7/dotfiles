return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    branch = "harpoon2",
    events = { "BufRead", "BufNewFile" },
    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup()
        -- REQUIRED

        vim.keymap.set("n", "<leader>hm", function()
            harpoon:list():add()
        end)
        vim.keymap.set("n", "<leader>hl", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        vim.keymap.set("n", "<leader>1", function()
            harpoon:list():select(1)
        end)
        vim.keymap.set("n", "<leader>2", function()
            harpoon:list():select(2)
        end)
        vim.keymap.set("n", "<leader>3", function()
            harpoon:list():select(3)
        end)
        vim.keymap.set("n", "<leader>4", function()
            harpoon:list():select(4)
        end)
        vim.keymap.set("n", "<leader>5", function()
            harpoon:list():select(5)
        end)
    end,
}
