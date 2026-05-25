-- To switch themes: uncomment one vim.cmd line below, comment the others.
-- Run :Lazy after changing to ensure all themes are installed.

return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,  -- load before other plugins
    config = function()
      require("gruvbox").setup({
        contrast = "hard",   -- options: "hard", "medium", "soft"
        italic = {
          strings = false,   -- no italic strings, easier to read
          comments = true,
          operators = false,
          folds = true,
        },
      })
      vim.cmd("colorscheme gruvbox")       -- ACTIVE
      -- vim.cmd("colorscheme kanagawa")   -- uncomment to use kanagawa
      -- vim.cmd("colorscheme everforest") -- uncomment to use everforest
    end,
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    opts = {
      theme = "wave",   -- options: "wave", "dragon", "lotus"
    },
  },

  {
    "sainnhe/everforest",
    lazy = true,
    init = function()
      vim.g.everforest_background = "hard"  -- options: "hard", "medium", "soft"
    end,
  },
}
