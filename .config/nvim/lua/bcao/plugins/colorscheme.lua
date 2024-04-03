return {
  {
    -- "olimorris/onedarkpro.nvim",
    -- "folke/tokyonight.nvim",
    "rebelot/kanagawa.nvim",
    -- "catppuccin/nvim",
    -- name = "catppuccin",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      -- require("onedarkpro").setup({
      --   colors = {
      --     fg = "#eaeaea",
      --     bg = "#282935",
      --   },
      -- })

      -- vim.cmd("colorscheme catppuccin-macchiato")
      -- vim.cmd("colorscheme tokyonight-storm")
      vim.cmd("colorscheme kanagawa-wave")
    end,
  },
}
