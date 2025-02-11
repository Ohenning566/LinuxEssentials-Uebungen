#alias definitions

alias ll='ls -l'
alias la='ls -A'
#alias l='ls -CF'
alias l='ls -A1 --group-directories-first'

alias srm='rm -I'
alias smv='mv -i'
alias scp='cp -i'

alias ..='cd ..'
#alias mkd
# alias nimmt keine parameter
mkd() {
  mkdir -p "$1" && cd "$1" ;
}
