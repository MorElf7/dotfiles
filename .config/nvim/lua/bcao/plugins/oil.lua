return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = { { "-", "<cmd>Oil<cr>" } },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
    })
  end,
}
