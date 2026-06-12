# Neovim Keybindings

> Works in normal and insert mode unless marked (n) for normal mode only.
> Leader key is `Space`.

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
| `Shift+Tab` (i) | `Shift+Tab` | Dedent current line |

## Modes
| Key | Action |
|-----|--------|
| `Esc` | Normal mode |
| `i` | Insert mode |
| `v` | Visual mode (select, then y/d/p) |

## Language Server
> These keys are active only when an LSP server is attached to the file.

| Key | VS Code equiv | Action |
|-----|--------------|--------|
| `K` (n) | hover | Show docs / type signature |
| `Ctrl+.` | `Cmd+.` | Code actions |
| `Ctrl+g` | `F12` | Go to definition |
| `gr` (n) | `Shift+F12` | Find references |
| `F2` | `F2` | Rename symbol |
| `gy` (n) | — | Go to type definition |
| `gi` (n) | — | Go to implementation |

## Completion
| Key | VS Code equiv | Action |
|-----|--------------|--------|
| `Tab` | `Tab` | Next suggestion / expand snippet |
| `Shift+Tab` | `Shift+Tab` | Previous suggestion |
| `Enter` | `Enter` | Confirm suggestion |
| `Ctrl+Space` | `Ctrl+Space` | Trigger completion manually |
| `Ctrl+e` | `Escape` | Dismiss completion |

## Git (gitsigns + fugitive)
| Key | VS Code equiv | Action |
|-----|--------------|--------|
| `Ctrl+j` (n) | — | Next changed hunk in file |
| `Ctrl+k` (n) | — | Previous changed hunk in file |
| `Space` `hs` (n) | — | Stage hunk under cursor |
| `Space` `hr` (n) | — | Reset hunk under cursor |
| `Space` `gb` (n) | GitLens blame | Toggle inline blame on current line |
| `:Git` | Source Control panel | Git status |
| `:Git diff` | — | Diff view |
| `:Gdiffsplit` | Diff editor | Side-by-side diff |

## Tabs (bufferline)
| Key | VS Code equiv | Action |
|-----|--------------|--------|
| `Tab` | `Ctrl+Tab` | Next tab |
| `Shift+Tab` | `Ctrl+Shift+Tab` | Previous tab |
| `Space` `bd` | `Cmd+w` | Close current tab |

## Spell Check
| Key | Action |
|-----|--------|
| `Ctrl+,` (n) | Jump to previous spelling error |

> Spell check is active only in markdown, text, and git commit files.

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
