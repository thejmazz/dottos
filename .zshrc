# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep

bindkey -v
bindkey '^R' history-incremental-search-backward

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit

PROMPT="|> "
[[ -n "SSH_CLIENT" ]] && PROMPT="[%n@%M]|> "

function zle-line-init zle-keymap-select {
    # LEFT="=="; RIGHT="=="
    # LEFT=">-"; RIGHT="-<"
    # LEFT=">>="; RIGHT="=<<"
    # LEFT="<|"; RIGHT="|>"
    # LEFT="<-"; RIGHT="->"
    LEFT="==>"; RIGHT="<=="
    # LEFT="<~"; RIGHT="~>"

    N_LEFT=$LEFT; N_RIGHT=$RIGHT
    N_LEFT="<=="; N_RIGHT="==>"

    # RPS1="${${KEYMAP/vicmd/$N_LEFT NORMAL $N_RIGHT}/(main|viins)/$LEFT INSERT $RIGHT}"
    RPS1="${${KEYMAP/vicmd/$N_LEFT NORMAL $N_RIGHT}/(main|viins)/%~}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_CONNECTION" ]; then
    export DISPLAY=:0.0
fi

# ALIASES
alias ls="ls --color"
[[ -f $HOME/.bash_aliases ]] && source $HOME/.bash_aliases

[[ -f $HOME/.dircolors ]] && eval $(dircolors -b $HOME/.dircolors)

PATH="/home/julian/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/julian/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/julian/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/julian/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/julian/perl5"; export PERL_MM_OPT;

export PATH="$PATH:$HOME/bin:$HOME/.local/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh"  ] && . "$NVM_DIR/nvm.sh"

# Needs to be at end
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

