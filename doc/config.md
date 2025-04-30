# Packages

## Media

```
obs-studio
kdenlive
krita
mpv
4kvideodownloader
ffmpeg-thumbnailer
paleta
gpick
scrot
feh
vlc
shotwell
yt-dlp-git
imagemagick
audacity
spotdl
minidlna
gst-plugins-good
gourou
gvfs (virtual filesystem)
```

## Gaming

```
steam
minecraft-launcher
mgba
wine
discord
```

## Productivity

```
obsidian
xournalpp
xournalpp-catppuccin
simple-scan
pdfarranger
texlive
zathura
zathura-pdf-mupdf
zathura-djvu
neovim
gvim
vi
unclutter
scribus
```

## AI

```
stable-diffusion-webui
eccv2022-rife
```

## Browsers

```
brave
archive.org-downloader (https://github.com/MiniGlome/Archive.org-Downloader)
dmenu
torbrowser-launcher
qutebrowser
python-adblock
```

## System

```
xorg
xorg-xserver
xorg-xinit
xorg-xclipboard
xclip
i3-wm
i3status
picom
nvidia
neofetch
kitty
alacritty
eww
papirus-folders
spotify
spotify-adblock (abba23)
spicetify-cli
spicetify-marketplace-bin
bluez
bluez-utils
pulseaudio-bluetooth
tree-sitter-cli
nodejs
python
python-neovim
ripgrep
fd
wget
perl
luarocks
lua51
dunst
libnotify
tree
zenity
unzip
unrar
p7zip
htop
xfce4-settings
rofi
jq
pv
thunar
thunar-archive-plugin
vibrant-cli
```

## Themes
```
phinger-cursors
papirus-icon-theme
```

# Tips and tricks

## Open terminal from file manager

```
ln -s /usr/bin/kitty /usr/bin/xdg-terminal-exec
```

## Set system clock to local

```
timedatectl set-local-rtc 1 --adjust-system-clock
```

## Bluetooth

### Default adapter power state

```
/etc/bluetooth/main.conf

[Policy]
AutoEnable=false
```

### Unblock bluetooth

```
rfkill
rfkill unblock bluetooth
```

### Bluetooth headset

Install the `pulseaudio-bluetooth` package and run `pulseaudio -k`. If not activated, do `systemctl --user enable pulseaudio.service`, make sure to not use `sudo`.

### Pairing

```
bluetoothctl
[bluetooth]# default-agent
[bluetooth]# power on
[bluetooth]# scan on
[bluetooth]# pair [MAC]
[bluetooth]# trust [MAC]
[bluetooth]# connect [MAC]
```

## Test notifications

Requires `libnotify`

```nofity-send [title] [content]```

## Fonts

Print installed fonts names with `fc-list | awk -F: '{print $2}' | awk -F, '{print $1}' | sort -u`.

## Utilities

### Unclutter

```
/etc/default/unclutter

START_UNCLUTTER="false"
```

## Themes

### Dark mode

```
$HOME/.config/gtk-3.0/settings.ini

[Settings]
gtk-application-prefer-dark-theme = true
```

### Custom theme

```
/etc/environment

GTK_THEME=Catppuccin-Mocha-Standard-Lavender-Dark
```

### Cursor

```
$HOME/.config/gtk-3.0/settings.ini

[Settings]
gtk-cursor-theme-name=phinger-cursors-light
```

### telescope.lua

```
local colors = require("catppuccin.palettes").get_palette()

local TelescopeColor = {
    TelescopeMatching = { fg = colors.flamingo },
    TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
    TelescopePromptPrefix = { bg = colors.surface0 },
    TelescopePromptNormal = { bg = colors.surface0 },
    TelescopeResultsNormal = { bg = colors.mantle },
    TelescopePreviewNormal = { bg = colors.mantle },
    TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
    TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
    TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
    TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
    TelescopeResultsTitle = { fg = colors.mantle },
    TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
}

for hl, col in pairs(TelescopeColor) do
    vim.api.nvim_set_hl(0, hl, col)
end
```

## Media

### Nsxiv

Use `xrdb ~/.Xresources` to reload `.Xresources`.

### Menyoki

Requires packages `menyoki` and `slop`. Use LAlt-U to finish record, for consistent record size use `slop` first and pass to `--size` argument.

```menyoki record --root --action-keys LAlt-S,LAlt-U --cancel-keys LControl-D,LControl-F -c 5 --size $(slop) gif --fps 10```

### Screenkey

```screenkey --window -s small  -f "JetBrainsMono NF Bold" --font-color "#1e1e2e" --bg-color "#89b4fa" --opacity 1 --bak-mode normal```

## System

### Change file/directory owner

```chown [user] [filepath]```

## Printer

Run `rm -r /usr/lib/cups/driver/`. Discover printer with `avahi`, then run `lpinfo -v` and fill `cups` Connection field with the output.

## Picom

Disable opacity for hidden windows. Useful so stacked windows do not add their opacity.

```
opacity-rule = [
    "0:_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
]
```

Disable tabbed windows title shadows in `i3`

```
opacity-rule = [
    "class_g = 'i3-frame'"
]
```

### Inkscape dafault document

Move `default.svg` to `$HOME/.config/inkscape/templates`.

### Open neovim in alacritty from file manager

```
/usr/share/applications/nvim.desktop

Exec=alacritty -e nvim %F
Terminal=false
```

### Open nsxiv from file manager

```
/usr/share/applications/nsxiv.desktop

Exec=nsxiv -b %F
```

## Try fix `exfat` volume
```
fsck.exfat /dev/[dev]
```

## Set `minidlna` service
```
/etc/minidlna.conf

user=root
media_dir=V,/absolute/path/to/media
```
```
systemctl edit minidlna.service

[Service]
ProtectHome=read-only
User=root
```

## Resize `i3` window

`i3-msg '[class="class"] resize set [width] [height]'`

## Remove unused packages

```pacman -Qtdq | pacman -Rns -```

## Workaround to fix screen tearing with Intel Drivers

```pacman -Rns xf86-video-intel```

## Reescale image without smoothing

Use `-flip` or `-flop` to mirror horizontally or vertically. Use `-filter point` to copy pixels without interpolation. Nord background color: `#2E3440`.

```
magick [input] -filter point -resize 1920x1080 -gravity center -background "[color]" -extent 1920x1080 -flop [output]
```
