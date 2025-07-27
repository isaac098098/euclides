#!/bin/bash

cp -r ~/.mpv/config ~/euclides/home/.mpv/
cp -r ~/.config/alacritty ~/euclides/.config/
cp -r ~/.config/awesome ~/euclides/.config/
cp -r ~/.config/dunst ~/euclides/.config/
cp -r ~/.config/gtk-3.0/ ~/euclides/.config/
cp -r ~/.config/gtk-4.0/ ~/euclides/.config/
cp -r ~/.config/hypr ~/euclides/.config/
cp -r ~/.config/i3 ~/euclides/.config/
cp -r ~/.config/i3status ~/euclides/.config/
cp -r ~/.config/nvim ~/euclides/.config/
cp -r ~/.config/picom ~/euclides/.config/
cp -r ~/.config/rofi/ ~/euclides/.config/
cp -r ~/.config/sxhkd ~/euclides/.config/
cp -r ~/.config/zathura ~/euclides/.config/
cp -r ~/.config/inkscape/templates/default.svg ~/euclides/.config/inkscape/templates

cp -r ~/.Xresources ~/euclides/home
cp -r ~/.bash_profile ~/euclides/home
cp -r ~/.bashrc ~/euclides/home
cp -r ~/.vimrc ~/euclides/home
cp -r ~/.xinitrc ~/euclides/home

rsync -a --delete --itemize-changes --no-links --exclude 'bib' ~/notes/ ~/euclides/backup/notes/
