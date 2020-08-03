export DOTFILES=~/.dotfiles


# bash stuff
alias bedit='vim ~/.bash_profile'
alias bsource='source ~/.bash_profile'
alias balias='vim ~/.bash_aliases'

# shortcuts
alias svim='sudo vim'
alias pyenv='python3 -m venv .venv'

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
