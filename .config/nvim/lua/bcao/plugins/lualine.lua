return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count

        -- Get the colors for the current theme
        -- local colors = require("kanagawa.colors").setup().palette
        --
        -- local kanagawa = {
        --     normal = {
        --         a = { bg = colors.crystalBlue, fg = colors.sumiInk4, gui = "bold" },
        --         b = { bg = colors.sumiInk3, fg = colors.fujiWhite },
        --         c = { bg = colors.sumiInk3, fg = colors.fujiWhite },
        --     },
        --     insert = {
        --         a = { bg = colors.autumnGreen, fg = colors.sumiInk4, gui = "bold" },
        --         b = { bg = colors.sumiInk3, fg = colors.fujiWhite },
        --         c = { bg = colors.sumiInk3, fg = colors.fujiWhite },
        --     },
        --     visual = {
        --         a = { bg = colors.oniViolet, fg = colors.sumiInk4, gui = "bold" },
        --         b = { bg = colors.sumiInk3, fg = colors.fujiWhite },
        --         c = { bg = colors.sumiInk3, fg = colors.fujiWhite },
        --     },
        --     command = {
        --         a = { bg = colors.autumnYellow, fg = colors.sumiInk4, gui = "bold" },
        --         b = { bg = colors.sumiInk3, fg = colors.fujiWhite },
        --         c = { bg = colors.sumiInk3, fg = colors.fujiWhite },
        --     },
        --     replace = {
        --         a = { bg = colors.autumnRed, fg = colors.sumiInk4, gui = "bold" },
        --         b = { bg = colors.sumiInk3, fg = colors.fujiWhite },
        --         c = { bg = colors.sumiInk3, fg = colors.fujiWhite },
        --     },
        --     inactive = {
        --         a = { bg = colors.sumiInk3, fg = colors.fujiWhite, gui = "bold" },
        --         b = { bg = colors.sumiInk3, fg = colors.fujiWhite },
        --         c = { bg = colors.sumiInk3, fg = colors.fujiWhite },
        --     },
        -- }

        -- configure lualine with modified theme
        lualine.setup({
            options = {
                -- theme = kanagawa,
                theme = "catppuccin",
            },
            sections = {
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#ff9e64" },
                    },
                    {
                        require("noice").api.status.mode.get,
                        cond = require("noice").api.status.mode.has,
                    },
                    {
                        require("noice").api.status.command.get,
                        cond = require("noice").api.status.command.has,
                    },
                    "filetype",
                    "fileformat",
                },
            },
        })
    end,
}
