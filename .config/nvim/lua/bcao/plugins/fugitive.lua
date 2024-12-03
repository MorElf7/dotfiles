return {
  "tpope/vim-fugitive", -- git
  event = "VeryLazy",
  enabled = false,
  config = function()
    local keymap = vim.keymap

    keymap.set("n", "<leader>ga", "<cmd>Git add -A<cr>", { desc = "Git add all" })
    keymap.set("n", "<leader>gc", "<cmd>Git commit<cr>", { desc = "Git commit" })
    keymap.set("n", "<leader>gp", "<cmd>Git push<cr>", { desc = "Git push" })
    keymap.set("n", "<leader>gl", "<cmd>Git pull<cr>", { desc = "Git pull" })
    keymap.set("n", "<leader>glo", "<cmd>Git log<cr>", { desc = "Git logs" })
    keymap.set("n", "<leader>gss", "<cmd>Git<cr>", { desc = "Git status" })
  end,
}
