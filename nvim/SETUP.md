# Neovim Setup Guide

## Prerequisites

Install the required system tools via Homebrew:

```sh
brew install neovim node ripgrep
```

| Tool | Required for |
|------|-------------|
| `neovim` | The editor |
| `node` | CoC (autocomplete / LSP) |
| `ripgrep` | Telescope live grep (`Ctrl+f`) |

---

## 1. Install vim-plug

vim-plug manages all plugins. Find installation instructions [here](https://github.com/junegunn/vim-plug#installation).

---

## 2. Install plugins

Open Neovim and run:

```
:PlugInstall
```

Wait for all plugins to finish downloading. You will see a status window. Once done, close it with `q` and restart Neovim.

---

## 3. Install CoC language servers

CoC handles autocomplete, go-to-definition, and inline errors. Install extensions for the languages you use.
Open Neovim and run:

```
:CocInstall coc-pyright coc-tsserver coc-json coc-yaml coc-sh
```

| Extension | Language |
|-----------|----------|
| `coc-pyright` | Python |
| `coc-tsserver` | TypeScript / JavaScript |
| `coc-json` | JSON |
| `coc-yaml` | YAML |
| `coc-sh` | Bash / Shell |

Remove any languages you don't need.

---

## 4. Verify everything works

Open a file and check:

| Feature | How to test |
|---------|------------|
| File tree | `Ctrl+b` should toggle the left sidebar |
| File search | `Ctrl+p` should open a fuzzy file finder |
| Live grep | `Ctrl+f` should search file contents |
| Autocomplete | Start typing in a code file — suggestions should appear |
| Go to definition | `Ctrl+g` on a function/variable |

---

## Keybindings

See `KEYBINDINGS.md` for the full reference.
