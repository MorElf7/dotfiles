return {
  {
    -- "folke/tokyonight.nvim",
    -- "rebelot/kanagawa.nvim",

    "catppuccin/nvim",
    name = "catppuccin",

    priority = 1000, -- make sure to load this before all the other start plugins
    options = {
      transparent = true,
    },
    config = function()
      -- load the colorscheme here

      require("catppuccin").setup({
        transparent_background = true,
      })
      vim.cmd("colorscheme catppuccin-mocha")
      -- vim.cmd("colorscheme tokyonight-storm")
      -- vim.cmd("colorscheme kanagawa-wave")
    end,
  },
}
