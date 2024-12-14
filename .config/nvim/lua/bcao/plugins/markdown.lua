return {
    {
        "3rd/image.nvim",
        ft = "markdown",
        config = function()
            require("image").setup({
                backend = "kitty", -- uberzug as alternative for non kitty terminal
                processor = "magick_cli",
                integrations = {
                    markdown = {
                        enabled = true,
                        clear_in_insert_mode = false,
                        download_remote_images = true,
                        only_render_image_at_cursor = true,
                        filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
                    },
                    neorg = {
                        enabled = true,
                        filetypes = { "norg" },
                    },
                    typst = {
                        enabled = true,
                        filetypes = { "typst" },
                    },
                    html = {
                        enabled = true,
                    },
                    css = {
                        enabled = true,
                    },
                },
                max_width = nil,
                max_height = nil,
                max_width_window_percentage = nil,
                max_height_window_percentage = 50,
                window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
                window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
                editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
                tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
                hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
            })
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        build = ":call mkdp#util#install()",
        config = function()
            vim.keymap.set("n", "<leader>mdp", "<cmd>MarkdownPreview<cr>", { desc = "Toggle Markdown Preview" })
            vim.cmd([[do FileType]])
            vim.cmd([[
         function OpenMarkdownPreview (url)
            let cmd = 'open -na "Google Chrome" --args --new-window ' . shellescape(a:url) . " &"
            silent call system(cmd)
         endfunction
      ]])
            vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
        end,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        -- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
        ft = "markdown",
    },
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        -- ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        event = {
            -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
            -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
            -- refer to `:h file-pattern` for more examples
            "BufReadPre "
                .. vim.fn.expand("~")
                .. "/Documents/projects/obsidian-vault/*.md",
            "BufNewFile " .. vim.fn.expand("~") .. "/Documents/projects/obsidian-vault/*.md",
        },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",
        },
        opts = {
            workspaces = {
                {
                    name = "personal",
                    path = "~/Documents/projects/obsidian-vault/",
                },
            },
            ui = {
                enable = false,
            },
        },
    },
}
