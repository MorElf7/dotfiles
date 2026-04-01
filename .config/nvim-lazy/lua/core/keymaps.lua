-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- for conciseness

---------------------General Keymaps -------------------

-- Ctrl + s for save
-- keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "Write buffer" })
-- keymap.set("n", "<C-q>", "<cmd>q!<cr>", { desc = "Quit" })

-- use jk to exit insert mode
-- keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("v", "<leader>p", '"_dP')
-- keymap.set({ "n", "x" }, "<leader>d", '"_d')
-- keymap.set({ "n", "x" }, "<leader>x", '"_x')
-- keymap.set({ "n", "x" }, "<leader>c", '"_c')

keymap.set({ "n", "x" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
keymap.set({ "n", "x" }, "<leader>yy", '"+yy', { desc = "Yank line to clipboard" })
keymap.set({ "n", "x" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })
keymap.set("x", "<leader>P", '"_dP', { desc = "Paste over selection without erasing unnamed register" })

-- increment/decrement numbers
keymap.set("n", "<C-w>", "<C-a>", { desc = "Increment number" }) -- increment

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  g--[[  ]]o to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set(
    "n",
    "<leader>nn",
    "<cmd>:e $HOME/Documents/projects/obsidian-vault/index.md<CR>",
    { desc = "Open index notes" }
) --  move current buffer to new tab

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("n", "<leader>w", "<cmd>noautocmd w<cr>")

keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")

keymap.set("n", "H", "^")
keymap.set("n", "L", "$")
