return {
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        buf_options = {
          buflisted = false,
          bufhidden = "hide",
        },
        view_options = {
          show_hidden = true,
        },
        -- Keeps oil in the current window; use float = true for a popup instead
        float = {
          padding = 2,
          max_width = 80,
        },
      })

      -- Press "-" anywhere to open the parent directory (just like native vim -)
      vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
      -- Press "-" in oil to go up a level (this is already the default)
    end,
  },
}
