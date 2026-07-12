return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    ft = "python",
    keys = {
      { "<leader>fv", "<cmd>VenvSelect<cr>", desc = "Select venv" },
    },
    opts = {},
  },
}
