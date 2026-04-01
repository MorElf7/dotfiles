vim.pack.add({ "https://github.com/rebelot/kanagawa.nvim" })
require("kanagawa").setup({
  theme = "wave",
  transparent = true,
})
vim.cmd.colorscheme("kanagawa-wave")
