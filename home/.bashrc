#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias neofetch="neofetch | sed 's/ with Radeon Graphics//' | sed 's/ Lite Hash Rate'//"
alias nsxiv="nsxiv -b"

export PATH="/usr/local/texlive/2024/bin/x86_64-linux:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export UNZIP_DISABLE_ZIPBOMB_DETECTION=TRUE
export GTK_THEME=Adwaita-dark

alias nsxiv='nsxiv -b'
alias tty-clock='tty-clock -c -s -C 4 -S -n'
alias pipes.sh='pipes.sh -r 0'
alias en-croissant='WEBKIT_DISABLE_DMABUF_RENDERER=1 en-croissant'
alias pomotroid='pomotroid --no-gpu-sandbox'
alias spotdl='spotdl --output "{artist}/{album}/{track-number} - {title}.{output-ext}"'

export PATH=$PATH:/home/isaac09809/.spicetify
