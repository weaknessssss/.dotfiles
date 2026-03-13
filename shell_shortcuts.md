# 🐟 Shell Shortcuts & Aliases

This file documents the custom aliases and abbreviations configured for the Fish shell.

## Package Management (Arch Linux)

| Alias / Abbr | Command | Description |
| :--- | :--- | :--- |
| `pi` | `sudo pacman -S` | Install package |
| `pr` | `sudo pacman -Rs` | Remove package with dependencies |
| `pu` | `sudo pacman -Syu` | Update entire system |
| `yi` / `ysi` | `yay -S` | Install AUR package |

## Core Utilities

| Alias | Command | Description |
| :--- | :--- | :--- |
| `cls` | `clear` | Clear terminal output |
| `ls` | `eza --icons --group-directories-first` | Enhanced `ls` with icons |
| `ll` | `eza --icons --group-directories-first -l` | Detailed list view |
| `tree`| `eza --icons --tree` | Directory tree view |

## Applications

| Alias / Abbr | Command | Description |
| :--- | :--- | :--- |
| `g` | `git` | Git |
| `n` | `nvim` | Neovim |
| `m` | `micro` | Micro editor |
| `y` | `yazi` | Yazi file manager |
| `t` | `tmux` | Tmux multiplexer |

## System Logs & Maintenance

| Alias | Command | Description |
| :--- | :--- | :--- |
| `syslog` | `sudo dmesg --level=err,warn` | View common errors |
| `syslog_emerg`| `sudo dmesg --level=emerg,alert,crit`| View critical errors |
| `xlog` | `grep "(EE)\|(WW)\|error\|failed" ~/.local/share/xorg/Xorg.0.log` | Filter X server errors |
| `vacuum` | `journalctl --vacuum-size=100M` | Clear journald logs (keep 100M) |
| `vacuum_time`| `journalctl --vacuum-time=2weeks` | Clear journald logs older than 2 weeks |
