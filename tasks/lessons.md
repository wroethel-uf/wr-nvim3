# Lessons Learned

## Neovim 0.12 bundles its own treesitter parsers

Neovim 0.12+ ships with bundled parsers for some languages (markdown, lua, etc.) and activates
treesitter highlighting independently of nvim-treesitter. The nvim-treesitter `highlight.disable`
list does NOT stop Neovim's built-in highlighter.

**Fix:** Add an autocmd to call `vim.treesitter.stop()` for affected filetypes:
```lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function() vim.treesitter.stop() end,
})
```

## Stale parsers shadow nvim-treesitter's managed parsers

Parsers in `~/.local/share/nvim/site/parser/` have higher runtimepath priority than
nvim-treesitter's own directory. Old parsers left there from a previous install will be
loaded instead of freshly installed ones, causing version mismatch errors.

**Diagnose:** `:lua =vim.api.nvim_get_runtime_file('parser/python.so', true)` — the first
result is what actually loads.
**Fix:** Delete stale `.so` files from `~/.local/share/nvim/site/parser/`.

## Switching nvim-treesitter master→main branch breaks parser installation

The `main` branch of nvim-treesitter uses a completely different parser download/build
mechanism. Switching mid-session causes `mv` errors and broken state. Avoid switching
branches unless starting fresh.

## oil.nvim buffer inflation

oil.nvim creates a listed buffer for every directory visited, cluttering `:buffers` and
`:b <Tab>` completion. Fix with `buf_options` in oil setup:
```lua
buf_options = {
  buflisted = false,
  bufhidden = "hide",
},
```

## treesitter injection errors are often filetype-specific

A markdown parser error that only triggers on some files is likely caused by treesitter
**injections** — markdown hands off fenced code blocks (` ```lua `, ` ```bash `) to the
respective language parsers. A simpler markdown file with no code blocks won't trigger
the injection and won't error.
