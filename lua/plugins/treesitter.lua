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
      -- Neovim 0.12 bundles its own markdown parser and activates treesitter
      -- highlighting independently of nvim-treesitter. Stop it explicitly.
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "markdown" },
        callback = function() vim.treesitter.stop() end,
      })
    end,
  },
}
