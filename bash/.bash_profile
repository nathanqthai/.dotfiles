# ls stuff
LSCOLORS='EXfxgxdxCXFhEhChCgacad'
alias ls='ls -GFlash'

# live updates for mdfiles
# gem install mdlive

mdlive() {
    while true; do
        if [[ $OSTYPE == "darwin"* ]]; then
            fswatch -1 $1;
        else
            inotifywait -q -e close_write $1;
        fi
        clear;
        mdless $1 | cat;
    done
}

# bash stuff
alias bedit='vim ~/.bash_profile'
alias bsource='source ~/.bash_profile'

if [[ $OSTYPE == "darwin"* ]]; then
    :
else
    . ~/.bashrc;
fi
