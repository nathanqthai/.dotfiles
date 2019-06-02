export DOTFILES=~/.dotfiles
export GITAWAREPROMPT=${DOTFILES}/bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

# macshit
if [[ $OSTYPE == "darwin"* ]]; then
    # mac ps1
    export PS1="\[\033[38;5;8m\][\[$(tput sgr0)\]\[\033[38;5;23m\]\t\[$(tput sgr0)\]\[\033[38;5;8m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;29m\]\u\[$(tput sgr0)\]\[\033[38;5;8m\]@\[$(tput sgr0)\]\[\033[38;5;35m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;8m\]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;36m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\$txtcyn\]\$git_branch\[\$txtred\]\$git_dirty\[\$txtrst\]\n\[$(tput sgr0)\]\[\033[38;5;250m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
    # homebrew paths
    alias vim='/usr/local/bin/vim'
    export EDITOR="/usr/local/bin/vim" # this forces the homebrew vim at all times
    export PATH="/usr/local/bin:$PATH"
fi

# ls stuff
if [[ $OSTYPE == "darwin"* ]]; then
    LSCOLORS='EXfxgxdxCXFhEhChCgacad'
    alias ls='ls -GFlash'
else
    alias ls='ls --color=auto -Flash'
fi

# live updates for mdfiles
# gem install mdlive
mdlive() {
    if [ -z "$1" ]; then
        echo "Usage: mdlive <markdown file>"
        return 1
    fi

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

# encryption tools
encrypt() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: encrypt <input file> <output name>"
        return 1
    fi

    openssl enc -aes-256-cbc -salt -in $1 -out $2
}
decrypt() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: decrypt <input file> <output name>"
        return 1
    fi

    openssl enc -aes-256-cbc -d -in $1 -out $2
}

# ip stuff
pub_ip() {
    echo $(dig +short myip.opendns.com @resolver1.opendns.com)
}

inf_ip() {
    if [ -z "$1" ]; then
        echo "Usage: inf_ip <interface>"
        return 1
    fi

    ip=$(/sbin/ifconfig ${1} | awk '/inet/ { print $2 } ' |
      sed -e s/addr://)
    echo ${ip:-"Not Connected"}
}

. ~/.bashrc
