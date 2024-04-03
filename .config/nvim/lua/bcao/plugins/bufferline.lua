return {
  "akinsho/bufferline.nvim",
  event = { "BufRead", "BufNewFile" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant",
    },
  },
}
