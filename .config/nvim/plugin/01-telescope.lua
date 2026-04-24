local hooks = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
    vim.system({ "make" }, { cwd = ev.data.path }):wait()
  end
end
vim.api.nvim_create_autocmd("PackChanged", { callback = hooks })

vim.pack.add({
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
})

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

-- set keymaps
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
