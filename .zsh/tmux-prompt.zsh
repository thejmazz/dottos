autoload -Uz add-zsh-hook

function swappane () {
    tmux if-shell "exit 0" "kill-pane; split-window -$DIR $1"
}

add-zsh-hook preexec swappane

PROMPT="TMUX: "
