#!/bin/bash

#### source rc files
for rc in $(ls ~/.rc.d/*rc)
do
    source $rc
done

####  System wise Environment
EDITOR="vim"
HISTFILESIZE=10000
HN="$(hostname | awk -F '.yahoo' '{print $1}')"
PS1="\[${bgc_228}\]\[${fgc_196}\]\d \t \[${fgc_129}\]\u\[${fgc_18}\] @ \[${bold}\]\[${fgc_12}\]\H \[${nc}\]
\[${bgc_228}\]\[${fgc_196}\]PWD =>\[${nc}\]\[${fgc_46}\] \w\[${nc}\]
\[${bgc_228}\]\[${fgc_196}\]CMD =>\[${nc}\]\[${bold}\] \$ \[${nc}\] \[${bgc_0}\]"

case $TERM in
    xterm*)
    # Set xterm's title
    export TERM="xterm-256color"
    ;;
    screen*)
    # Use path as title
    HOSTTITLE='\[\ek${HN}\e\\\]'
    # Use program name as title
    PS1="${HOSTTITLE}${PS1}"
    ;;
    *)
    ;;
esac

#### Common Used

# alias
alias v='vim'
alias g='grep --color'
alias so='sudo '
alias ..='cd ..'
alias t='tail'
alias tf='tail -f '

OSTYPE=$(uname)
if [[ "$OSTYPE" == 'FreeBSD' || "$OSTYPE" == "Darwin" ]]; then
  alias vi='vim'
  alias cp='cp -i'
  alias ll='ls -l -G -F'
  alias ls='ls -G -F'
  alias mv='mv -i'
  alias rm='rm -i'
elif [[ "$OSTYPE" == 'Linux' ]]; then
  alias vi='vim'
  alias cp='cp -i'
  alias mv='mv -i'
  alias rm='rm -i'
  alias ll='ls -l --color=tty'
  alias ls='ls --color=tty'
  alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
fi

# function
function uppercase() {
    echo $@ | awk '{print toupper($0)}'
}

function lowercase() {
    echo $@ | awk '{print tolower($0)}'
}

#### Network Related
function port_check() {
    host=$1
    port=$2
    echo "" | nc -v $host $port --send-only -4 -w 5
}
alias pc=port_check
