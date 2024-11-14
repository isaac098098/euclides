#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias neofetch="neofetch | sed 's/ with Radeon Graphics//' | sed 's/ Lite Hash Rate'//"

export PATH="/usr/local/texlive/2024/bin/x86_64-linux:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export UNZIP_DISABLE_ZIPBOMB_DETECTION=TRUE

alias nsxiv='nsxiv -b'
alias tty-clock='tty-clock -c -s -C 4 -S -n'
#alias pipes.sh='pipes.sh -r 0'

export PATH=$PATH:/home/isaac09809/.spicetify
