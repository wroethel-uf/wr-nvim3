# wr-nvim3

A minimal Neovim config built to stay close to native Vim while adding essential coding tools. No opinionated UI framework — just a package manager, syntax highlighting, LSP, completion, and a file navigator. Keybindings are mostly stock Vim; additions are listed below.

## Installation

```bash
# Back up any existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Symlink this repo
ln -s ~/projects/config/wr-nvim3 ~/.config/nvim
```

Open `nvim` — lazy.nvim will bootstrap itself and install all plugins on first launch. Run `:TSUpdate` once after to ensure all parsers are current.

## Plugins

| Plugin | Purpose |
|---|---|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting and indentation |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/tool installer |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Bridges mason with nvim-lspconfig |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP client configuration |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder (files, grep, buffers) |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua utility library (telescope dependency) |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | File navigation (directory-as-buffer) |
| [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) | Colorscheme (hard contrast) |
| [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) | Colorscheme (wave variant, inactive) |
| [everforest](https://github.com/sainnhe/everforest) | Colorscheme (hard contrast, inactive) |

## LSP Servers (auto-installed via Mason)

| Server | Language |
|---|---|
| pyright | Python |
| clangd | C / C++ |
| html | HTML |
| lemminx | XML |
| jsonls | JSON |
| bashls | Bash |
| ts_ls | JavaScript / TypeScript |

## Keybindings

`<leader>` is `Space`.

### Fuzzy Finding (telescope.nvim)

Requires `ripgrep` for live grep (`brew install ripgrep`).

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep across project |
| `<leader>fb` | Fuzzy-switch open buffers |
| `<leader>fh` | Search help tags |

### File Navigation (oil.nvim)

| Key | Action |
|---|---|
| `-` | Open parent directory |
| `-` (in oil) | Go up a level |
| `<Enter>` | Open file or directory |

In an oil buffer, edit like any text file — rename lines, `dd` to delete, `:w` to apply changes to disk.

Oil directory buffers are unlisted (`buflisted = false`) — they won't appear in `:buffers`, `:ls`, or `:b <Tab>` completion.

### LSP (active when a language server is attached)

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | List references |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>f` | Format file |
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>d` | Show diagnostic detail |

### Completion (nvim-cmp)

| Key | Action |
|---|---|
| `<C-Space>` | Trigger completion |
| `<C-n>` / `<C-p>` | Next / previous item |
| `<Tab>` | Confirm selection (or expand/jump snippet placeholder) |
| `<S-Tab>` | Previous item, or jump back in snippet |
| `<CR>` | Plain newline (dismisses popup without confirming) |
| `<C-e>` | Abort |
| `<leader>tc` | Toggle completion on / off |

### General

| Key | Action |
|---|---|
| `<Esc>` | Clear search highlight |
| `[b` / `]b` | Previous / next buffer |
| `J` / `K` (visual) | Move selection down / up |
| `<C-d>` / `<C-u>` | Scroll half-page, cursor centered |

## Switching Colorscheme

Edit `lua/plugins/colorschemes.lua` and swap which `vim.cmd` line is uncommented:

```lua
vim.cmd("colorscheme gruvbox")       -- active
-- vim.cmd("colorscheme kanagawa")
-- vim.cmd("colorscheme everforest")
```

## Maintenance

| Command | Action |
|---|---|
| `:Lazy` | Open plugin manager UI |
| `:Lazy update` | Update all plugins |
| `:Mason` | Open tool installer UI |
| `:TSUpdate` | Update all treesitter parsers |
| `:checkhealth` | Run health checks |
