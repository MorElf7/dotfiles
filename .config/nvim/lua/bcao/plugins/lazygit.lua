return {
  "kdheepak/lazygit.nvim",
  enable = false,
  keys = {
    {
      "<leader>gg",
      ":LazyGit<Return>",
      silent = true,
      noremap = true,
    },
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
