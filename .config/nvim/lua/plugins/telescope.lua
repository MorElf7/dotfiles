return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    enabled = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
        "stevearc/aerial.nvim",
    },
    config = function()
        require("aerial").setup({
            -- optionally use on_attach to set keymaps when aerial has attached to a buffer
            -- on_attach = function(bufnr)
            --     -- Jump forwards/backwards with '{' and '}'
            --     vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
            --     vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
            -- end,
        })

        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local telescopeConfig = require("telescope.config")

        -- Clone the default Telescope configuration
        local vimgrep_arguments = telescopeConfig.values.vimgrep_arguments

        -- I want to search in hidden/dot files.
        table.insert(vimgrep_arguments, "--hidden")
        -- I don't want to search in the `.git` directory.
        table.insert(vimgrep_arguments, "--glob")
        table.insert(vimgrep_arguments, "!**/.git/*")
        table.insert(vimgrep_arguments, "--trim")
        telescope.setup({
            defaults = {
                vimgrep_arguments = vimgrep_arguments,
                path_display = { "truncate " },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        -- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                    follow = true,
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                },
            },
        })

        telescope.load_extension("fzf")
        telescope.load_extension("aerial")

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
        keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Fuzzy find git files in cwd" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
        keymap.set("n", "<leader>fa", "<cmd>Telescope aerial<cr>", { desc = "Go to symbol (Aerial)" })
    end,
    init = function()
        local utils = require("telescope.utils")
        local builtin = require("telescope.builtin")
        _G.project_files = function()
            local _, ret, _ = utils.get_os_command_output({ "git", "rev-parse", "--is-inside-work-tree" })
            if ret == 0 then
                builtin.git_files()
            else
                builtin.find_files()
            end
        end
    end,
}
