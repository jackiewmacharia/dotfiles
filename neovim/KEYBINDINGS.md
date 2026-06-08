# Neovim Keybindings

> Works in normal and insert mode unless marked (n) for normal mode only.

## File Tree (nvim-tree)
| Key | VS Code equiv | Action |
|-----|--------------|--------|
| `Ctrl+b` | `Cmd+b` | Toggle file tree |
| `Ctrl+t` | — | Focus file tree |

### Inside the tree
| Key | Action |
|-----|--------|
| `Enter` | Open file |
| `Ctrl+v` | Open in vertical split |
| `Ctrl+x` | Open in horizontal split |
| `d` | Delete file/folder |
| `a` | Create file/folder |
| `r` | Rename |
| `c` | Copy |
| `x` | Cut |
| `p` | Paste |
| `y` | Copy filename |
| `Y` | Copy relative path |
| `gy` | Copy absolute path |

### Git status indicators
| Symbol | Color | Meaning |
|--------|-------|---------|
| `M` | purple | Modified (unstaged) |
| `S` | pink | Staged |
| `U` | green | Untracked (new) |
| `D` | red | Deleted |
| `R` | — | Renamed |

### Diagnostic indicators
| Symbol | Color | Meaning |
|--------|-------|---------|
| `E` | red | Error |
| `W` | orange | Warning |
| `H` | orange | Hint |

## File Search (Telescope)
| Key | VS Code equiv | Action |
|-----|--------------|--------|
| `Ctrl+p` | `Cmd+p` | Quick open file |
| `Ctrl+f` | `Cmd+Shift+f` | Find in files |
| `:Telescope colorscheme` | — | Browse and preview themes |

## Editing
| Key | VS Code equiv | Action |
|-----|--------------|--------|
| `Ctrl+z` | `Cmd+z` | Undo |
| `Ctrl+r` (n) | `Cmd+Shift+z` | Redo (built-in) |
| `gcc` (n) | `Cmd+/` | Toggle comment on line |
| `gc` (v) | `Cmd+/` | Toggle comment on selection |
| `v` (n) | click+drag | Visual/select mode |
| `ggVG` (n) | `Cmd+a` | Select all |
| `ggdG` (n) | — | Delete all |
| `y` (n) | `Cmd+c` | Copy selection |
| `yy` (n) | — | Copy line |
| `p` (n) | `Cmd+v` | Paste |
| `d` (n) | `Cmd+x` | Cut selection |

## Modes
| Key | Action |
|-----|--------|
| `Esc` | Normal mode |
| `i` | Insert mode |
| `v` | Visual mode (select, then y/d/p) |

## Language Server (CoC)
| Key | VS Code equiv | Action |
|-----|--------------|--------|
| `Ctrl+.` | `Cmd+.` | Code actions |
| `Ctrl+g` | `F12` | Go to definition |
| `Ctrl+m` | `F2` | Rename symbol |
| `gr` (n) | `Shift+F12` | Find references |
| `gy` (n) | — | Go to type definition |
| `gi` (n) | — | Go to implementation |
| `K` (n) | hover | Show docs |
| `Tab` | `Tab` | Next autocomplete |
| `Shift+Tab` | `Shift+Tab` | Prev autocomplete |
| `Enter` | `Enter` | Confirm autocomplete |

## Spell Check
| Key | Action |
|-----|--------|
| `Ctrl+,` (n) | Previous spelling error |

## Git
| Key | VS Code equiv | Action |
|-----|--------------|--------|
| `Ctrl+j` | — | Next git change in file |
| `Ctrl+k` | — | Previous git change in file |
| `:Git` | Source Control panel | Git status |
| `:Git diff` | — | Diff view |
| `:Git blame` | GitLens blame | Line blame |
| `:Gdiffsplit` | Diff editor | Side-by-side diff |

## Tabs (bufferline)
| Key | VS Code equiv | Action |
|-----|--------------|--------|
| `Tab` | `Ctrl+Tab` | Next tab |
| `Shift+Tab` | `Ctrl+Shift+Tab` | Previous tab |
| `Ctrl+w` | `Cmd+w` | Close current tab |

---

## Splits

Open splits from the command line:

| Command | Action |
|---------|--------|
| `:vsp filename` | Open file in vertical split |
| `:sp filename` | Open file in horizontal split |

Navigate between splits:

| Key | Action |
|-----|--------|
| `Ctrl+w h` | Move to left split |
| `Ctrl+w l` | Move to right split |
| `Ctrl+w j` | Move to split below |
| `Ctrl+w k` | Move to split above |
| `Ctrl+w w` | Cycle through splits |

---

## Quit
| Key | Action |
|-----|--------|
| `Ctrl+q` | Quit all panes |
