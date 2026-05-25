return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "python", "c", "cpp", "html", "xml",
          "json", "bash", "javascript", "typescript", "java",
          "lua",  -- needed for editing this config
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
