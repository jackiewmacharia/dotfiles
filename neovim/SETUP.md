# Neovim Setup Guide

## Prerequisites

Install the required system tools via Homebrew:

```sh
brew install neovim node ripgrep gcc
```

| Tool | Required for |
|------|-------------|
| `neovim` | The editor |
| `node` | TypeScript / JavaScript LSP server |
| `ripgrep` | Telescope live grep (`Ctrl+f`) |
| `gcc` | Compiling Tree-sitter parsers |

---

## 1. Install vim-plug

vim-plug manages all plugins. Install it with:

```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

---

## 2. Install plugins

Open Neovim and run:

```
:PlugInstall
```

Wait for all plugins to finish downloading, then close the window with `q` and restart Neovim.

Tree-sitter parsers compile automatically on first open (requires `gcc`).

---

## 3. Install language servers

Language servers are managed by **Mason**. The servers listed in `lsp.lua` install automatically on first launch.

To manage servers manually, open Neovim and run:

```
:Mason
```

This opens an interactive UI where you can install, update, or remove servers.

### Servers installed automatically

| Server | Language |
|--------|----------|
| `pyright` | Python |
| `ts_ls` | TypeScript / JavaScript |
| `jsonls` | JSON |
| `yamlls` | YAML |
| `bashls` | Bash / Shell |

To add more, open `after/plugin/lsp.lua` and add the server name to both the `ensure_installed` list and the `vim.lsp.enable()` call. Find server names at [mason-registry](https://mason-registry.dev/registry/list).

---

## 4. Verify everything works

Open a file and check:

| Feature | How to test |
|---------|------------|
| File tree | `Ctrl+b` toggles the left sidebar |
| File search | `Ctrl+p` opens a fuzzy file finder |
| Live grep | `Ctrl+f` searches file contents |
| Autocomplete | Start typing — suggestions appear automatically |
| Go to definition | `Ctrl+g` on a function or variable |
| Hover docs | `K` over a symbol shows documentation |
| Diagnostics | Errors and warnings appear inline as virtual text |
| Statusline | Bar at the bottom shows mode, branch, filename |
| Indent guides | Vertical lines at each indent level |
| Git signs | `│` in the gutter next to changed lines |

---

## Keybindings

See `KEYBINDINGS.md` for the full reference.
