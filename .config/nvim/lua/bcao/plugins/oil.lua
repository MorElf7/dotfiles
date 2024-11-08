return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.keymap.set("n", "-", "<cmd>Oil<cr>")
    require("oil").setup({
      default_file_explorer = true,
    })
  end,
}
