vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter", name = "nvim-treesitter" } })

require("nvim-treesitter").setup({ -- enable syntax highlighting
  highlight = {
    enable = true,
    disable = { "latex" },
    -- additional_vim_regex_highlighting = { "latex", "markdown" },
  },
  -- enable indentation
  indent = { enable = true },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  -- ensure these language parsers are installed
  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "java",
    "python",
    "go",
    "tsx",
    "hyprlang",
    "yaml",
    "html",
    "css",
    "markdown",
    "markdown_inline",
    "graphql",
    "bash",
    "lua",
    "vim",
    "dockerfile",
    "gitignore",
    "sql",
    "tmux",
    "c",
    "cpp",
    "nix",
  },
  -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  -- auto install above language parsers
  auto_install = true,
})
