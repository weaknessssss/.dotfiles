
# Create aliases
alias cls="clear"
alias g="git"
alias n="nvim"
alias m="micro"

if status is-interactive
    # Install
    abbr -a pi 'sudo pacman -S'
    # Remove (with dependencies)
    abbr -a pr 'sudo pacman -Rs'
    # System update
    abbr -a pu 'sudo pacman -Syu'
    #yay
    abbr -a yi 'yay -S'
    #yay sudo 
    abbr -a ysi 'yay -S'
    #yazi 
    abbr -a y 'yazi'
    #tmux
    abbr -a t 'tmux'

end

# TODO: Replace journal aliases after switching to OpenRC

# Display critical errors
alias syslog_emerg="sudo dmesg --level=emerg,alert,crit"

# Output common errors
alias syslog="sudo dmesg --level=err,warn"

# Print logs from x server
alias xlog='grep "(EE)\|(WW)\|error\|failed" ~/.local/share/xorg/Xorg.0.log'

# Remove archived journal files until the disk space they use falls below 100M
alias vacuum="journalctl --vacuum-size=100M"

# Make all journal files contain no data older than 2 weeks
alias vacuum_time="journalctl --vacuum-time=2weeks"

set -U fish_greeting
set fish_color_command green
set -gx EDITOR micro
set -gx VISUAL micro
set -gx BROWSER /usr/bin/firefox


if status is-interactive
    # Commands to run in interactive sessions can go here
end


#starship init fish | source
zoxide init fish | source


alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first -l"
alias tree="eza --icons --tree"

# Default cursor - block
set fish_cursor_default block

# Cursor in insert mode (if using Vi-mode)
# Optional: can also be set to block to prevent changing
set fish_cursor_insert block

# Cursor when replacing characters
set fish_cursor_replace_one block

set -gx FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border --info=inline"
set -gx FZF_DEFAULT_COMMAND "fd --type f --strip-cwd-prefix --hidden --exclude .git"
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND" # If using fzf.fish plugin, preview is enabled by default.









fish_add_path $HOME/.spicetify
