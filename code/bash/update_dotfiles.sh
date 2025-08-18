#!/bin/bash

cp -r ~/.mpv/config ~/euclides/home/.mpv/
cp -r ~/.config/alacritty ~/euclides/.config/
cp -r ~/.config/awesome ~/euclides/.config/
cp -r ~/.config/dunst ~/euclides/.config/
cp ~/.config/gtk-3.0/settings.ini ~/euclides/.config/gtk-3.0/
cp -r ~/.config/gtk-4.0/ ~/euclides/.config/
cp -r ~/.config/hypr ~/euclides/.config/
cp -r ~/.config/i3 ~/euclides/.config/
cp -r ~/.config/i3status ~/euclides/.config/
rsync -aH --delete --itemize-changes  --exclude 'lazy-lock.json' ~/.config/nvim/ ~/euclides/.config/nvim/
cp -r ~/.config/picom ~/euclides/.config/
rsync -aH --delete --itemize-changes ~/.config/rofi/ ~/euclides/.config/rofi/
cp -r ~/.config/sxhkd ~/euclides/.config/
cp -r ~/.config/zathura ~/euclides/.config/
cp -r ~/.local/share/zathura ~/euclides/home/.local/share/

cp -r ~/.Xresources ~/euclides/home
cp -r ~/.bash_profile ~/euclides/home
cp -r ~/.bashrc ~/euclides/home
cp -r ~/.vimrc ~/euclides/home
cp -r ~/.xinitrc ~/euclides/home

rsync -a --delete --itemize-changes --no-links --exclude 'bib' ~/notes/ ~/euclides/backup/notes/
