vim.pack.add({
  "https://github.com/folke/snacks.nvim",
})

require("snacks").setup({
  bigfile = { enabled = true },
  dashboard = {
    enabled = true,
    preset = {
      keys = {
        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
        {
          icon = " ",
          key = "g",
          desc = "Find Text",
          action = ":lua Snacks.dashboard.pick('live_grep')",
        },
        {
          icon = " ",
          key = "r",
          desc = "Recent Files",
          action = ":lua Snacks.dashboard.pick('oldfiles')",
        },
        {
          icon = " ",
          key = "s",
          desc = "Dotfiles Config",
          action = ":e $MYVIMRC | cd $HOME/.dotfiles",
        },
        {
          icon = " ",
          key = "n",
          desc = "Notes",
          action = ":e $HOME/Documents/projects/obsidian-vault/index.md",
        },
        {
          icon = " ",
          key = "c",
          desc = "Codes",
          action = ":e $HOME/codes.md",
        },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      },
    },
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
      { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
    },
  },
  notifier = {
    enabled = true,
    timeout = 3000,
  },
  quickfile = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = false },
  styles = {
    notification = {
      wo = { wrap = true }, -- Wrap notifications
    },
  },
  lazygit = { enabled = false },
  terminal = { enabled = false },
  picker = {
    enabled = false,
    sources = {
      files = {
        finder = "files",
        format = "file",
        show_empty = true,
        hidden = true,
        ignored = false,
        follow = true,
        supports_live = true,
      },
    },
  },
  explorer = { enabled = false },
  image = { enabled = false },
  scope = { enabled = true },
  input = { enabled = true },
})

local map = vim.keymap.set

-- Top Pickers & Explorer
map("n", "ga", function()
  require("aerial").snacks_picker()
end, { desc = "Aerial Pickers" })
map("n", "<leader><space>", function()
  Snacks.picker.smart()
end, { desc = "Smart Find Files" })
map("n", "<leader>,", function()
  Snacks.picker.buffers()
end, { desc = "Buffers" })
map("n", "<leader>/", function()
  Snacks.picker.grep()
end, { desc = "Grep" })
map("n", "<leader>:", function()
  Snacks.picker.command_history()
end, { desc = "Command History" })
map("n", "<leader>n", function()
  Snacks.picker.notifications()
end, { desc = "Notification History" })

map("n", "<leader>e", function()
  Snacks.explorer()
end, { desc = "File Explorer" })

-- Find
map("n", "<leader>fb", function()
  Snacks.picker.buffers()
end, { desc = "Buffers" })
map("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Find Files" })
map("n", "<leader>fg", function()
  Snacks.picker.git_files()
end, { desc = "Find Git Files" })
map("n", "<leader>fp", function()
  Snacks.picker.projects()
end, { desc = "Projects" })
map("n", "<leader>fr", function()
  Snacks.picker.recent()
end, { desc = "Recent" })

-- Git
map("n", "<leader>gb", function()
  Snacks.picker.git_branches()
end, { desc = "Git Branches" })
map("n", "<leader>gl", function()
  Snacks.picker.git_log()
end, { desc = "Git Log" })
map("n", "<leader>gL", function()
  Snacks.picker.git_log_line()
end, { desc = "Git Log Line" })
map("n", "<leader>gs", function()
  Snacks.picker.git_status()
end, { desc = "Git Status" })
map("n", "<leader>gS", function()
  Snacks.picker.git_stash()
end, { desc = "Git Stash" })

map("n", "<leader>gd", function()
  Snacks.picker.git_diff()
end, { desc = "Git Diff (Hunks)" })

map("n", "<leader>gf", function()
  Snacks.picker.git_log_file()
end, { desc = "Git Log File" })

-- Grep
map("n", "<leader>sb", function()
  Snacks.picker.lines()
end, { desc = "Buffer Lines" })
map("n", "<leader>sB", function()
  Snacks.picker.grep_buffers()
end, { desc = "Grep Open Buffers" })
map("n", "<leader>sg", function()
  Snacks.picker.grep()
end, { desc = "Grep" })
map({ "n", "x" }, "<leader>sw", function()
  Snacks.picker.grep_word()
end, { desc = "Visual selection or word" })

-- Search
map("n", '<leader>s"', function()
  Snacks.picker.registers()
end, { desc = "Registers" })
map("n", "<leader>s/", function()
  Snacks.picker.search_history()
end, { desc = "Search History" })

map("n", "<leader>sa", function()
  Snacks.picker.autocmds()
end, { desc = "Autocmds" })
map("n", "<leader>sc", function()
  Snacks.picker.command_history()
end, { desc = "Command History" })
map("n", "<leader>sC", function()
  Snacks.picker.commands()
end, { desc = "Commands" })
map("n", "<leader>sd", function()
  Snacks.picker.diagnostics()
end, { desc = "Diagnostics" })
map("n", "<leader>sD", function()
  Snacks.picker.diagnostics_buffer()
end, { desc = "Buffer Diagnostics" })
map("n", "<leader>sh", function()
  Snacks.picker.help()
end, { desc = "Help Pages" })
map("n", "<leader>sH", function()
  Snacks.picker.highlights()
end, { desc = "Highlights" })
map("n", "<leader>si", function()
  Snacks.picker.icons()
end, { desc = "Icons" })
map("n", "<leader>sj", function()
  Snacks.picker.jumps()
end, { desc = "Jumps" })
map("n", "<leader>sk", function()
  Snacks.picker.keymaps()
end, { desc = "Keymaps" })
map("n", "<leader>sl", function()
  Snacks.picker.loclist()
end, { desc = "Location List" })
map("n", "<leader>sm", function()
  Snacks.picker.marks()
end, { desc = "Marks" })
map("n", "<leader>sM", function()
  Snacks.picker.man()
end, { desc = "Man Pages" })

map("n", "<leader>sp", function()
  Snacks.picker.lazy()
end, { desc = "Search for Plugin Spec" })
map("n", "<leader>sq", function()
  Snacks.picker.qflist()
end, { desc = "Quickfix List" })
map("n", "<leader>sR", function()
  Snacks.picker.resume()
end, { desc = "Resume" })
map("n", "<leader>su", function()
  Snacks.picker.undo()
end, { desc = "Undo History" })
map("n", "<leader>uC", function()
  Snacks.picker.colorschemes()
end, { desc = "Colorschemes" })

-- LSP
map("n", "gd", function()
  Snacks.picker.lsp_definitions()
end, { desc = "Goto Definition" })
map("n", "gD", function()
  Snacks.picker.lsp_declarations()
end, { desc = "Goto Declaration" })
map("n", "gr", function()
  Snacks.picker.lsp_references()
end, { desc = "References", nowait = true })
map("n", "gI", function()
  Snacks.picker.lsp_implementations()
end, { desc = "Goto Implementation" })
map("n", "gy", function()
  Snacks.picker.lsp_type_definitions()
end, { desc = "Goto T[y]pe Definition" })
map("n", "<leader>ss", function()
  Snacks.picker.lsp_symbols()
end, { desc = "LSP Symbols" })
map("n", "<leader>sS", function()
  Snacks.picker.lsp_workspace_symbols()
end, { desc = "LSP Workspace Symbols" })

-- Scratch
map("n", "<leader>.", function()
  Snacks.scratch()
end, { desc = "Toggle Scratch Buffer" })
map("n", "<leader>S", function()
  Snacks.scratch.select()
end, { desc = "Select Scratch Buffer" })

-- Notifications
map("n", "<leader>n", function()
  Snacks.notifier.show_history()
end, { desc = "Notification History" })
map("n", "<leader>nd", function()
  Snacks.notifier.hide()
end, { desc = "Dismiss All Notifications" })

-- Buffer
map("n", "<leader>bd", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })

-- Misc
map("n", "<leader>cR", function()
  Snacks.rename.rename_file()
end, { desc = "Rename File" })
map("n", "<leader>gb", function()
  Snacks.git.blame_line()
end, { desc = "Git Blame Line" })
map("n", "<leader>gf", function()
  Snacks.lazygit.log_file()
end, { desc = "Lazygit Current File History" })

-- Words / References
map({ "n", "t" }, "]]", function()
  Snacks.words.jump(vim.v.count1)
end, { desc = "Next Reference" })
map({ "n", "t" }, "[[", function()
  Snacks.words.jump(-vim.v.count1)
end, { desc = "Prev Reference" })

-- Neovim News
map("n", "<leader>N", function()
  Snacks.win({
    file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
    width = 0.6,
    height = 0.6,
    wo = {
      spell = false,
      wrap = false,
      signcolumn = "yes",
      statuscolumn = " ",
      conceallevel = 3,
    },
  })
end, { desc = "Neovim News" })

Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
