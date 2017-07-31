# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_CONNECTION" ]; then
    export DISPLAY=:0.0
fi

# ALIASES
alias cls="clear;ls"
alias ls="ls --color"
alias ll="ls++ --potsf"
alias dps="docker ps --format 'table {{.Image}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}'"
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias ctl='clear; tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'
alias tta="ta 0"

eval $(dircolors -b $HOME/.dircolors)

PATH="/home/julian/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/julian/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/julian/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/julian/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/julian/perl5"; export PERL_MM_OPT;
