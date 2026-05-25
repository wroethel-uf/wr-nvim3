return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup()

      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- mason-lspconfig v2: handlers live inside setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",   -- Python
          "clangd",    -- C/C++
          "html",      -- HTML
          "lemminx",   -- XML
          "jsonls",    -- JSON
          "bashls",    -- Bash
          "ts_ls",     -- JavaScript/TypeScript
        },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({ capabilities = capabilities })
          end,
        },
      })

      -- LSP keymaps, set when an LSP attaches to a buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd",         vim.lsp.buf.definition,    opts)
          vim.keymap.set("n", "gD",         vim.lsp.buf.declaration,   opts)
          vim.keymap.set("n", "gi",         vim.lsp.buf.implementation,opts)
          vim.keymap.set("n", "gr",         vim.lsp.buf.references,    opts)
          vim.keymap.set("n", "K",          vim.lsp.buf.hover,         opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,        opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,   opts)
          vim.keymap.set("n", "<leader>f",  vim.lsp.buf.format,        opts)
          vim.keymap.set("n", "[d",         vim.diagnostic.goto_prev,  opts)
          vim.keymap.set("n", "]d",         vim.diagnostic.goto_next,  opts)
          vim.keymap.set("n", "<leader>d",  vim.diagnostic.open_float, opts)
        end,
      })
    end,
  },

}
