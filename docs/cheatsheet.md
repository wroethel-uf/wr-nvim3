# Neovim Cheat Sheet for Common Tasks

**Disclaimer:**
This reflects my common usage of nvim and may be different for 
others. Happy if it helps others, don't yell if it doesn't cover
your needs, just create your own 😀.

**Style used here**
* `<..>` is used for keys
* [..] generally not any special meaning at this point 
  (in case you were wondering)
* dyc = applies to **d**elete, **y**ank, and **c**hange (replace)

## Advanced Navigating
* Move to start of next word: `w`
* Move to start of next extended word: `W`
* Move to end of word: `e`
* Move to end of extended word: `E`
* Move to character position 20 in the current line: `20|`
* Move forward to the next 'x' (or any other character): `fx`
* Move forward to the character right before the next 'x': `tx`
* Move backward to the next 'x': `Fx`
* Move backward to the character right before the next 'x': `Tx`
* Repeat last f/t motion: `;` (forward) or `,` (backward)
* Search forward for word: `/word<CR>` — use `<Esc>` to clear highlight

## Copy / Yanks

* To end of word: `yw`
* To end of extended word: `yW`

## Delete / Yank / Change [dyc]
Commands shown for delete `d` but apply equally to yank `y` and change `c`.

* To end of word: `dw` or `dW`
* Entire current word: `diw` or `diW`
* Up to position 20 in the current line: `d20|`
* Up to next `"` (not including it): `dt"`
* Up to and including next `"`: `df"`
* Backward to next `"` (not including it): `dT"`
* Backward to and including next `"`: `dF"`

## Text Objects (quotes, brackets)
Works from anywhere inside the quoted/bracketed region.

* Delete contents of double quotes: `di"`
* Delete contents + the quotes: `da"`
* Change contents of double quotes: `ci"`
* Yank contents of double quotes: `yi"`
* Same patterns apply for single quotes with `'`, parens `(`, brackets `[`, braces `{`

## Using Buffers
* Switch to the last used buffer: `<C-^>`
* Switch to a buffer by file name: `:b partial<Tab>`
  → use `<Tab>` / `<S-Tab>` to cycle through suggestions
* Cycle through buffers in order: `[b` / `]b`

## Fuzzy Finding (Telescope)
* Find files: `<leader>ff`
* Search across file contents: `<leader>fg`
* Switch between open buffers: `<leader>fb`
* Search help tags: `<leader>fh`
* Select Python venv (repoints pyright live): `<leader>fv`

## Completion (nvim-cmp)
* Trigger completion: `<C-Space>`
* Cycle candidates: `<C-n>` / `<C-p>`
* Confirm selection: `<Tab>`
* Dismiss popup (plain newline): `<CR>`
* Abort: `<C-e>`
* Toggle completion on/off: `<leader>tc`

## Python venvs (pyright)
* Point pyright at a project's venv without relying on shell activation — add to `pyproject.toml`:
  ```toml
  [tool.pyright]
  venvPath = "."
  venv = ".venv"
  ```
* To switch envs on the fly instead: `<leader>fv` opens a picker and repoints the running pyright client immediately, no restart needed.

## Emoji
* Type `:smile` (or any emoji name) in insert mode to get completions via cmp-emoji
* Confirm with `<Tab>` as usual
