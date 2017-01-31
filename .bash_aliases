alias cls="clear; ls"

alias tmux="tmux -2"
#alias tmux="TERM=screen-256color tmux"
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias ctl='clear; tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'
alias tta="ta 0"

alias dps="docker ps --format 'table {{.Image}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}'"

