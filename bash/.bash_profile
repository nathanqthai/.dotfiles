# macshit
if [[ $OSTYPE == "darwin"* ]]; then
    export PS1="\[\033[38;5;8m\][\[$(tput sgr0)\]\[\033[38;5;23m\]\t\[$(tput sgr0)\]\[\033[38;5;8m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;29m\]\u\[$(tput sgr0)\]\[\033[38;5;8m\]@\[$(tput sgr0)\]\[\033[38;5;35m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;8m\]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;36m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput sgr0)\]\[\033[38;5;250m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
    alias vim='/usr/local/bin/vim'
    export PATH="/usr/local/bin:$PATH"
fi

# ls stuff
LSCOLORS='EXfxgxdxCXFhEhChCgacad'
alias ls='ls -GFlash'

# live updates for mdfiles
# gem install mdlive
mdlive() {
    if [[ $OSTYPE == "darwin"* ]]; then
        fswatch $1 | xargs -n1 -I{} mdcat {};
    else
        while true; do
            inotifywait -q -e close_write $1;
            clear;
            mdless $1 | cat;
        done
    fi
}

# bash stuff
alias bedit='vim ~/.bash_profile'
alias bsource='source ~/.bash_profile'

. ~/.bashrc;

