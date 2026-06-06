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
| `Ctrl+f` | `Cmd+Shift+f` | Find in files (requires `brew install ripgrep`) |
| `:Telescope colorscheme` | — | Browse and preview themes |

## Editing
| Key | VS Code equiv | Action |
|-----|--------------|--------|
| `Ctrl+z` | `Cmd+z` | Undo |
| `Ctrl+r` (n) | `Cmd+Shift+z` | Redo (built-in) |
| `Ctrl+/` | `Cmd+/` | Toggle comment |
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

## Quit
| Key | Action |
|-----|--------|
| `Ctrl+q` | Quit all panes |
