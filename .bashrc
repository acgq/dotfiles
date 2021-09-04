# export PATH="/usr/bin:$PATH"
PATH="/usr/bin:$PATH"
[[ "$-" != *i* ]] && return

# python encoding
export PYTHONIOENCODING="utf-8"
 
export SHELLOPTS
set -o igncr

eval "$(thefuck --alias)"

# starship
# eval "$(starship init bash)"

# use utf8 in less
export LESSCHARSET=utf-8


# git alias 
alias gp='git push'
alias gk='git checkout'
alias gl='git pull '
alias glp='git pull && git push '

# use up and down to search history start with words typed
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'


# custom functions
#kill all process where grep match input string
ka (){
    content=$1
    start=${content:0:1}
    end=${content:1}
    echo  $(ps aux | grep "[$start]$end" | awk '{print $2}') 
    kill -9 $(ps aux | grep "[$start]$end" | awk '{print $2}')     
}

