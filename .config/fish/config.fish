
# Create aliases
alias cls="clear"
alias g="git"
alias n="nvim"
alias m="micro"

if status is-interactive
    # Установка
    abbr -a pi 'sudo pacman -S'
    # Удаление (с зависимостями)
    abbr -a pr 'sudo pacman -Rs'
    # Обновление всей системы
    abbr -a pu 'sudo pacman -Syu'
    # Поиск пакета
    abbr -a ps 'pacman -Ss'
    #yay
    abbr -a yi 'yay -S'
    #yay sudo 
    abbr -a ysi 'yay -S'
    #yazi 
    abbr -a y 'yazi'
    #remote mac
    abbr -a r 'ssh user@192.168.0.101'
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

# Дефолтный курсор — блок
set fish_cursor_default block

# Курсор в режиме вставки (если используешь Vi-mode)
# Можно тоже поставить block, если не хочешь, чтобы он менялся
set fish_cursor_insert block

# Курсор при замене символов
set fish_cursor_replace_one block

set -gx FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border --info=inline"
set -gx FZF_DEFAULT_COMMAND "fd --type f --strip-cwd-prefix --hidden --exclude .git"
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"# Если используете плагин fzf.fish, превью включено по умолчанию.



# Переключаем раскладку на английский при запуске терминала
if status is-interactive
    hyprctl switchxkblayout apple-spi-keyboard 0 > /dev/null 2>&1
end





