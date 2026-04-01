vim.pack.add({
  "https://github.com/MagicDuck/grug-far.nvim",
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
  "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
  "https://github.com/nvim-mini/mini.surround",
  "https://github.com/nvim-mini/mini.ai",
  "https://github.com/nvim-mini/mini.comment",
  "https://github.com/windwp/nvim-autopairs",
})

require("grug-far").setup({})
vim.keymap.set({ "n", "x" }, "<leader>rr", "<cmd>GrugFar<CR>")

local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>hm", function()
  harpoon:list():add()
end)
vim.keymap.set("n", "<leader>hl", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>1", function()
  harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>2", function()
  harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>3", function()
  harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>4", function()
  harpoon:list():select(4)
end)
vim.keymap.set("n", "<leader>5", function()
  harpoon:list():select(5)
end)

require("mini.surround").setup()
require("mini.ai").setup()
vim.g.skip_ts_context_commentstring_module = true
require("ts_context_commentstring").setup({
  enable_autocmd = false,
})
require("mini.comment").setup({
  options = {
    custom_commentstring = function()
      return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
    end,
  },
})

require("nvim-autopairs").setup({
  check_ts = true, -- enable treesitter
  ts_config = {
    lua = { "string" }, -- don't add pairs in lua string treesitter nodes
    javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
    java = false, -- don't check treesitter on java
  },
})
