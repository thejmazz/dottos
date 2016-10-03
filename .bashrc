# Aliases
alias src="source $HOME/.bash_profile"
alias ls="ls -G"
alias cls="clear; ls"
alias cl="clear"
alias ccat="pygmentize -g"
alias git=hub
alias cclear="clear; clear"
alias vims="vim -c \":OpenSession\""
alias prev="qlmanage -p"
alias pycobra="/Users/jmazz/venv/cobrapy/bin/python"
alias cltx="rm *.aux *.fls *.out *.pyg *.log *.fdb_latexmk"
alias wds="webpack-dev-server"
alias canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --enable-unsafe-es3-apis"
alias sed=gsed
alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
eval $(thefuck --alias)
alias less="less -R"
alias tree="tree -I node_modules"
alias dps="docker ps --format 'table {{.Image}}\t{{.Command}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}'"
alias disku="sudo du -sh ./* | gsort -rh"
# alias r="r --no-save"
# === tmux aliases ===
# alias tmux="tmux -2"
alias tmux="TERM=screen-256color tmux"
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'
alias tta="ta 🍄"

# Force SSH into starting
#eval "$(ssh-agent -s)"

# Make less more like more, but still more than more
# Breaks git diff
export LESS='-RsCmqPm--Less--(?eEND:%pb\%.)'

function denv {
    eval $(docker-machine env default)
}

function unsetdocker {
    unset DOCKER_TLS_VERIFY
    unset DOCKER_CERT_PATH
    unset DOCKER_MACHINE_NAME
    unset DOCKER_HOST
}

# Git aliases
alias gs="git status"
alias gcam="git commit -am"
alias gp="git push"
alias gpsuom="git push --set-upstream origin master"

# Functions
function cless {
    pygmentize -g $1 | less -r
}

function cdc {
    cd $1; cls
}

function trash {
    mv "$1" ~/.Trash
}

function pbpasten {
    pbpaste > "$1" && printf "\n" >> "$1"
}

function gc {
    git commit -m "$1"
}

function gcp {
    git commit -m "$1"; git push
}

function gcamp {
    git add -A; git commit -m "$1"; git push
}

function digs {
    dig $1 +nostats +nocomments +nocmd
}

function curl-header-only {
    curl -s -D - $1 -o /dev/null
}

# #docker-port <machine-name> <container-name>
# docker-port <container-name>
function docker-port {
    echo `docker-machine ip default`:`docker port $1 | grep 80/tcp | cut -d'>' -f2 | cut -d':' -f2`
}

# So that Vim does not show in shell
export TERM=xterm
export VISUAL=vim
export EDITOR="$VISUAL"

# Coloured manpages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# export PS1="\w$ "

alias markright="open -a /Applications/MarkRight.app"
# alias typora="open -a /Applications/Typora.app"

# vi mode shell
set -o vi

alias node6="docker run --rm -it -w /usr/src/app -v `pwd`:/usr/src/app node:6.2.0 node"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh"  ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# for npm chalk
export FORCE_COLOR=dank
