return {
    {
        "akinsho/bufferline.nvim",
        enabled = false,
        event = { "BufRead", "BufNewFile" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        version = "*",
        opts = {
            options = {
                mode = "tabs",
                separator_style = "thin",
            },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufRead", "BufNewFile" },
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "+" },
                    change = { text = "~" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                },
                signs_staged = {
                    add = { text = "+" },
                    change = { text = "~" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                },
                current_line_blame = true,
                signcolumn = true,
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map("n", "]c", function()
                        if vim.wo.diff then
                            return "]c"
                        end
                        vim.schedule(function()
                            gs.next_hunk()
                        end)
                        return "<Ignore>"
                    end, { expr = true })

                    map("n", "[c", function()
                        if vim.wo.diff then
                            return "[c"
                        end
                        vim.schedule(function()
                            gs.prev_hunk()
                        end)
                        return "<Ignore>"
                    end, { expr = true })

                    -- Actions
                    map("n", "<leader>gsh", gs.stage_hunk)
                    map("n", "<leader>grh", gs.reset_hunk)
                    map("n", "<leader>guh", gs.undo_stage_hunk)
                    map("n", "<leader>gRh", gs.reset_buffer)
                end,
            })
        end,
    },
    {
        enabled = false,
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufRead", "BufNewFile" },
        main = "ibl",
        config = function()
            vim.cmd("highlight IndentBlanklineContextChar guifg=#DCD7BA gui=nocombine")
            require("ibl").setup({
                indent = { char = "▏" },
                scope = {
                    highlight = "IndentBlanklineContextChar",
                    show_start = true,
                    show_end = true,
                },
            })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local lualine = require("lualine")
            local lazy_status = require("lazy.status") -- to configure lazy pending updates count

            lualine.setup({
                options = {
                    -- theme = kanso,
                    theme = "kanagawa",
                    -- theme = "catppuccin",
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
    },
    {
        "echasnovski/mini.indentscope",
        enabled = true,
        version = false,
        events = { "BufRead", "BufNewFile" },
        opts = {
            draw = {
                delay = 100,
                fg = "#dcd7ba",
            },
            symbol = "│",
            options = { try_as_border = true },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "Trouble",
                    "startify",
                    "alpha",
                    "help",
                    "lazy",
                    "mason",
                    "notify",
                    "oil",
                    "dashboard",
                    "snacks",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            -- "rcarriga/nvim-notify",
        },
        config = function()
            -- require("notify").setup({
            --     timeout = 4000,
            --     stages = "static",
            --     max_height = function()
            --         return math.floor(vim.o.lines * 0.75)
            --     end,
            --     max_width = function()
            --         return math.floor(vim.o.columns * 0.75)
            --     end,
            --     on_open = function(win)
            --         vim.api.nvim_win_set_config(win, { zindex = 100 })
            --     end,
            -- })

            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    -- bottom_search = true, -- use a classic bottom cmdline for search
                    -- command_palette = true, -- position the cmdline and popupmenu together
                    -- long_message_to_split = true, -- long messages will be sent to a split
                    -- inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = true, -- add a border to hover docs and signature help
                },
            })

            -- vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<cr>")
        end,
    },
    {
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
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = { "Trouble" },
        opts = { use_diagnostic_signs = true },
        keys = {
            {
                "<leader>tw",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>td",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>tl",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>tq",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
            {
                "[q",
                function()
                    if require("trouble").is_open() then
                        require("trouble").previous({ skip_groups = true, jump = true })
                    else
                        local ok, err = pcall(vim.cmd.cprev)
                        if not ok then
                            vim.notify(err, vim.log.levels.ERROR)
                        end
                    end
                end,
                desc = "Previous Trouble/Quickfix Item",
            },
            {
                "]q",
                function()
                    if require("trouble").is_open() then
                        require("trouble").next({ skip_groups = true, jump = true })
                    else
                        local ok, err = pcall(vim.cmd.cnext)
                        if not ok then
                            vim.notify(err, vim.log.levels.ERROR)
                        end
                    end
                end,
                desc = "Next Trouble/Quickfix Item",
            },
        },
    },
}
