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

alias nsxiv='nsxiv -b'
