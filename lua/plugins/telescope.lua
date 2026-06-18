return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")

      require("telescope").setup({})

      vim.keymap.set("n", "<leader>ff", builtin.find_files,  { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep,   { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers,     { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags,   { desc = "Help tags" })
      vim.keymap.set("n", "<leader>fa", function() 
          require("telescope.builtin").find_files({
              no_ignore = true,
              hidden = true,
          })
      end, { desc = "Find all files (including hidden and gitignored)" })
      vim.keymap.set("n", "<leader>fi", function() 
          require("telescope.builtin").find_files({
              no_ignore = true,
          })
      end, { desc = "Find files (including gitignored)" })
    end,
  },
}
