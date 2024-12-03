return {
  -- {
  --   "numToStr/Comment.nvim",
  --   event = { "BufRead", "BufNewFile" },
  --   dependencies = {
  --     "JoosepAlviste/nvim-ts-context-commentstring",
  --   },
  --   config = function()
  --     -- import comment plugin safely
  --     local comment = require("Comment")
  --     vim.g.skip_ts_context_commentstring_module = true
  --     require("ts_context_commentstring").setup({
  --       enable_autocmd = false,
  --     })
  --     local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
  --
  --     -- enable comment
  --     comment.setup({
  --       -- for commenting tsx and jsx files
  --       pre_hook = ts_context_commentstring.create_pre_hook(),
  --     })
  --   end,
  -- },
  {
    "echasnovski/mini.comment",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    version = false,
    config = function()
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
    end,
  },
}
