return {
    {
        "yetone/avante.nvim",
        build = "make",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
        },
        event = "VeryLazy",
        version = false, -- Never set this value to "*"! Never!
        opts = {
            -- add any opts here
            provider = "ollama",
            providers = {
                ollama = {
                    endpoint = "http://127.0.0.1:11434",
                    model = "qwen3:8b",
                },
            },
        },
        keys = {
            {
                "<leader>ip",
                function()
                    return vim.bo.filetype == "AvanteInput" and require("avante.clipboard").paste_image()
                        or require("img-clip").paste_image()
                end,
                desc = "clip: paste image",
            },
        },
    },
}
