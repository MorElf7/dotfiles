vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/nvim-mini/mini.indentscope",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/mhinz/vim-signify",
})

-- lualine
require("lualine").setup({
  options = {
    theme = "kanagawa",
  },
  sections = {
    lualine_x = {
      "filetype",
      "fileformat",
    },
  },
})

-- indentscope
require("mini.indentscope").setup({
  draw = {
    delay = 100,
    fg = "#dcd7ba",
  },
  symbol = "│",
  options = { try_as_border = true },
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "Trouble",
    "startify",
    "alpha",
    "help",
    "lazy",
    "mason",
    "notify",
    "oil",
    "dashboard",
    "snacks",
  },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})

-- oil nvim
vim.keymap.set("n", "-", "<cmd>Oil<cr>", { silent = true, noremap = true, desc = "Open Oil" })
require("oil").setup({
  default_file_explorer = true,
  lsp_file_methods = {
    enabled = false,
  },
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-c>"] = "actions.close",
    ["<C-l>"] = false,
    ["<C-h>"] = false,
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["`"] = "actions.cd",
    ["~"] = {
      "actions.cd",
      opts = { scope = "tab" },
      desc = ":tcd to the current oil directory",
      mode = "n",
    },
    ["gs"] = "actions.change_sort",
    ["gx"] = "actions.open_external",
    ["g."] = "actions.toggle_hidden",
    ["g\\"] = "actions.toggle_trash",
  },
})

-- vim-signify
vim.g.signify_vcs_list = { "hg", "git" }

vim.g.signify_sign_add = "+"
vim.g.signify_sign_change = "~"
vim.g.signify_sign_delete = "-"
-- vim.g.signify_sign_delete_first_line = ""

vim.g.signcolumn = "number"

local kanagawa_fg = "#DCD7BA"
local cterm_fg = "223"

vim.cmd(string.format("highlight SignifySignAdd guifg=%s ctermfg=%s guibg=#2f3832 ctermbg=236", kanagawa_fg, cterm_fg))
vim.cmd(
  string.format("highlight SignifySignChange guifg=%s ctermfg=%s guibg=#4E4337 ctermbg=237", kanagawa_fg, cterm_fg)
)
vim.cmd(
  string.format("highlight SignifySignDelete guifg=%s ctermfg=%s guibg=#423134 ctermbg=52", kanagawa_fg, cterm_fg)
)
