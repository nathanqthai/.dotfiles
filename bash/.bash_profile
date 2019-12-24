export DOTFILES=~/.dotfiles

# macshit
if [[ $OSTYPE == "darwin"* ]]; then
    # mac ps1
    #export PS1="\[\033[38;5;8m\][\[$(tput sgr0)\]\[\033[38;5;23m\]\t\[$(tput sgr0)\]\[\033[38;5;8m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;29m\]\u\[$(tput sgr0)\]\[\033[38;5;8m\]@\[$(tput sgr0)\]\[\033[38;5;35m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;8m\]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;36m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\$txtcyn\]\$git_branch\[\$txtred\]\$git_dirty\[\$txtrst\]\n\[$(tput sgr0)\]\[\033[38;5;250m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
    export PS1="\[\033[38;5;8m\][\[$(tput sgr0)\]\[\033[38;5;23m\]\t\[$(tput sgr0)\]\[\033[38;5;8m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;29m\]\u\[$(tput sgr0)\]\[\033[38;5;8m\]@\[$(tput sgr0)\]\[\033[38;5;35m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;8m\]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;36m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \n\[$(tput sgr0)\]\[\033[38;5;250m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

    # homebrew paths
    alias vim='/usr/local/bin/vim'
    export EDITOR="/usr/local/bin/vim" # this forces the homebrew vim at all times
    export PATH="/usr/local/bin:$PATH"
else
    export GITAWAREPROMPT=${DOTFILES}/bash/git-aware-prompt
    source "${GITAWAREPROMPT}/main.sh"
fi

# ls stuff
if [[ $OSTYPE == "darwin"* ]]; then
    LSCOLORS='EXfxgxdxCXFhEhChCgacad'
    alias ls='ls -GFlash'
else
    alias ls='ls --color=auto -Flash'
fi

# bash stuff
alias bedit='vim ~/.bash_profile'
alias bsource='source ~/.bash_profile'
alias balias='vim ~/.bash_aliases'

# shortcuts
alias svim='sudo vim'
alias create_py3env='python3 -m venv .venv'

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

# compression tools
compress-tar-gz() {
    if [ -z "$1" ]; then
        echo "Usage: compress-tar-gz <target>"
        return 1
    fi

    tar -czvf $1.tar.gz $1
}

decompress-tar-gz() {
    if [ -z "$1" ]; then
        echo "Usage: decompress-tar-gz <target>"
        return 1
    fi

    tar -xzvf $1
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
export PATH="/usr/local/sbin:$PATH"
