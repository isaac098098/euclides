#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '
PS1='\[\e[38;2;129;162;190m\]\W \[\e[0m\]'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias nsxiv='nsxiv -a -b -s f'
alias neofetch="neofetch | sed 's/ with Radeon Graphics//' | sed 's/ Lite Hash Rate'//"
alias tty-clock='tty-clock -c -s -C 4 -S -n'
alias pipes.sh='pipes.sh -r 0'
alias en-croissant='WEBKIT_DISABLE_DMABUF_RENDERER=1 en-croissant'
alias pomotroid='pomotroid --no-gpu-sandbox'
alias spotdl-al='$HOME/.local/bin/venv/bin/spotdl --output "$HOME/Music/{artist}/{album}/{track-number} - {title}.{output-ext}"'
alias spotdl-pl='$HOME/.local/bin/venv/bin/spotdl --output "$HOME/Music/{list-name}/{title}.{output-ext}"'
alias spotdl-so='$HOME/.local/bin/venv/bin/spotdl --output "$HOME/Music/{title}.{output-ext}"'
alias glow='glow -t'
alias lsfonts="fc-list | awk -F: '{print $2}' | awk -F, '{print $1}' | sort -u"

export UNZIP_DISABLE_ZIPBOMB_DETECTION=TRUE
# export GTK_THEME=Adwaita-dark

# export PATH="/usr/local/texlive/2024/bin/x86_64-linux:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:/home/isaac09809/.spicetify
# export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.elan/toolchains/leanprover--lean4---v4.24.0/bin:$PATH"

export CUDA_HOME=/opt/cuda
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH

# export CC=gcc-13
# export CXX=g++-13
