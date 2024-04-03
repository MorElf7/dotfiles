return {
  "nvimtools/none-ls.nvim",
  event = { "BufRead", "BufNewFile" },
  config = function()
    -- import null-ls plugin
    local null_ls = require("null-ls")

    local null_ls_utils = require("null-ls.utils")
    local h = require("null-ls.helpers")

    -- for conciseness
    local formatting = null_ls.builtins.formatting -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters

    -- to setup format on save
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local latexindent = {
      name = "latexindent",
      method = { null_ls.methods.FORMATTING },
      filetypes = { "tex", "latex" },
      generator = null_ls.formatter({
        command = "latexindent",
        args = { "-s", "-o", "$FILENAME", "$FILENAME" },
        to_stdin = true,
        from_stderr = true,
      }),
    }
    -- configure null_ls
    null_ls.setup({
      -- add package.json as identifier for root (for typescript monorepos)
      root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
      -- setup formatters & linters
      sources = {
        --  to disable file types use
        --  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
        formatting.prettier.with({
          extra_filetypes = { "svelte" },
        }), -- js/ts formatter
        formatting.stylua, -- lua formatter
        formatting.isort,
        formatting.black,
        formatting.clang_format,
        formatting.gofumpt,
        formatting.goimports_reviser,
        formatting.golines,
        latexindent,
        formatting.sqlfluff.with({
          extra_args = { "--dialect", "postgres" }, -- change to your dialect
        }),
      },
      -- configure format on save
      on_attach = function(current_client, bufnr)
        if current_client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                filter = function(client)
                  --  only use null-ls for formatting instead of lsp server
                  return client.name == "null-ls"
                end,
                bufnr = bufnr,
                timeout_ms = 5000,
              })
            end,
          })
        end
      end,
    })
  end,
}
