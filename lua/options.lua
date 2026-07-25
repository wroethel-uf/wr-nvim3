local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation (overridden per filetype by treesitter/lsp)
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- UI
opt.wrap = false
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes"   -- always show, prevents layout shift
opt.scrolloff = 8
opt.splitright = true
opt.splitbelow = true
opt.showmode = false     -- mode shown in statusline already

-- Behavior
opt.updatetime = 250
opt.clipboard = "unnamedplus"

-- No local persistence (PII/confidential files must never be written to disk
-- outside the file itself): disables ShaDa, persistent undo, swapfiles, backups.
opt.shada = ""
opt.undofile = false
opt.swapfile = false
opt.backup = false
opt.writebackup = false

-- Disable unused providers (suppresses checkhealth warnings)
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
