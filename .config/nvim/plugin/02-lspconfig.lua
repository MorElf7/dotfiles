vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
})

local util = require("lspconfig/util")

local keymap = vim.keymap -- for conciseness

local opts = { noremap = true, silent = true }
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    opts.buffer = args.buf

    opts.desc = "See available code actions"
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

    opts.desc = "Smart rename"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
  end,
})

-- used to enable autocompletion (assign to every lsp server config)
-- local capabilities = cmp_nvim_lsp.default_capabilities()
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰠠 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
})

vim.lsp.enable({
  "html",
  "ts_ls",
  "denols",
  "cssls",
  "marksman",
  "bashls",
  "texlab",
  "clangd",
  "gopls",
  "pyright",
  "ruff",
  "lua_ls",
})
-- configure html server
vim.lsp.config("html", {
  capabilities = capabilities,
  filetypes = { "html" },
})

-- configure typescript server with plugin
vim.lsp.config("ts_ls", {
  capabilities = capabilities,
  root_markers = util.root_pattern("package.json"),
  single_file_support = false,
})

-- configure deno server with plugin
vim.lsp.config("denols", {
  capabilities = capabilities,
  filetypes = { "css" },
})

-- configure markdown server
vim.lsp.config("marksman", {
  capabilities = capabilities,
  filetypes = { "markdown" },
})

-- configure cs server
-- vim.lsp.config["csharp_ls",{
--   capabilities = capabilities,
--   filetypes = { "cs" },
-- })

-- configure bash server
vim.lsp.config("bashls", {
  capabilities = capabilities,
  filetypes = { "sh" },
})

-- configure LaTex server
vim.lsp.config("texlab", {
  capabilities = capabilities,
  filetypes = { "tex", "plaintex", "bib" },
})

-- configure c/c++ server
vim.lsp.config("clangd", {
  capabilities = capabilities,
  filetypes = { "c", "cpp" },
})

-- configure go server
vim.lsp.config("gopls", {
  capabilities = capabilities,
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
})

-- configure python server
vim.lsp.config("pyright", {
  capabilities = capabilities,
  filetypes = { "python" },
})

-- configure python server
vim.lsp.config("ruff", {
  capabilities = capabilities,
  filetypes = { "python" },
})

-- configure lua server (with special settings)
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  filetypes = { "lua" },
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})
