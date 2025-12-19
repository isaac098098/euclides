# Packages

## Media

```
obs-studio
kdenlive
krita
mpv
4kvideodownloader
ffmpegthumbnailer
tumbler
paleta
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
qbittorrent
ncmpcpp
mpd
mpc
timidity
```

## Gaming

```
steam
minecraft-launcher
mgba
melonds (aur)
wine
discord
obs-studio-browser (aur)
obs-composite-blur (aur)
```

## Productivity

```
obsidian
xournalpp
xournalpp-catppuccin
simple-scan
pdfarranger
texlive-langspanish
texlive
zathura
zathura-pdf-mupdf
zathura-djvu
zathura-cb
biber
xdotool
neovim
gvim
vi
unclutter
scribus
zoom
libreoffice-still
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

## `dwm`

```
ttf-dejavu
libx11
libxft
libxinerama
xorg-xinit
xorg-server
xorg-xset
xorg-xkbutils
xorg-xclipboard
xorg-xsetroot
xorg-xwininfo
xorg-xprop
xclip
```

### Patches

- https://dwm.suckless.org/patches/notitle/
- https://dwm.suckless.org/patches/smartborders/

## System

```
man
cppman
opengl-man-pages
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
pipewire
pipewire-audio
pipewire-pulse
wireplumber
pipewire-alsa
pipewire-jack
alsa-firmware
gst-plugin-pipewire
brightnessctl
alacritty
rsync
lxappearance
less
pamixer
meson
ninja
cmake
cpio
android-file-transfer
pavucontrol
openrgb-git (aur)
calc
hyperfine
man-pages
pyenv
```

### `i3`

```
xorg
xorg-xserver
xorg-xinit
xorg-xclipboard
xclip
i3-wm
i3status
i3lock-color (aur)
perl-anyevent-i3 (i3-save-tree)
picom
gpick
feh
scrot
flameshot
```

### `wayland`

```
hyprland
hyprlock
hyprpaper
hyprpicker
xdg-desktop-portal-hyprland-git
cliphist
grim
slurp
wofi
waybar
```

To install `hyprgrass` first install `glm meson ninja`. Then

```
hyprpm update
hyprpm add https://github.com/horriblename/hyprgrass
hyprpm enable hyprgrass
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

### Bluetooth headset (`pulseaudio`)

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

```notify-send [title] [content]```

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
    TelescopeMatching       = { fg = colors.flamingo },
    TelescopeSelection      = { fg = colors.text, bg = colors.surface0, bold = true },
    TelescopePromptPrefix   = { bg = colors.surface0 },
    TelescopePromptNormal   = { bg = colors.surface0 },
    TelescopeResultsNormal  = { bg = colors.mantle },
    TelescopePreviewNormal  = { bg = colors.mantle },
    TelescopePromptBorder   = { bg = colors.surface0, fg = colors.surface0 },
    TelescopeResultsBorder  = { bg = colors.mantle, fg = colors.mantle },
    TelescopePreviewBorder  = { bg = colors.mantle, fg = colors.mantle },
    TelescopePromptTitle    = { bg = colors.pink, fg = colors.mantle },
    TelescopeResultsTitle   = { fg = colors.mantle },
    TelescopePreviewTitle   = { bg = colors.green, fg = colors.mantle },
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

## Set Wacom pressure curve

See https://linuxwacom.github.io/bezier.html.
```
xsetwacom --set 19 PressureCurve 30 0 100 100
```

## Sync to external drive without changing permissions, owners and groups

```
rsync -rlDh --delete --itemize-changes --size-only --progress [SOURCE] [DESTINATION]
```

## Only copy files showing progress

```
rsync -rh --itemize-changes --progress [SOURCE] [DESTINATION]
```

## Sync to linux machine

```
rsync -ah --delete --itemize-changes --size-only --progress [SOURCE] [DESTINATION]
```

## Print directory size

```
du -sb [DIR] | awk '{print $1}' | numfmt --to=iec --format="%.4f"

```

## Print directory tree. Use `-L` for depth level. Use `--dirsfirst` to print directories first. Use `-a` to print all files.

```
tree -a -L 1 --dirsfirst [DIR1] [DIR2] ... [DIRN]
```

## Symlink. Do not append `/` in simbolic link.

```
ln -sf [ORIGINAL_DIR] [SYMLINK]
```

## Fix blurry `brave` on `wayland`

Go to `brave://flags` -> `Prefered Ozone platform` -> `Wayland`

```
ln -sf [ORIGINAL_DIR] [SYMLINK]
```

## Change `nautilus` font size

Change `org.gnome.desktop.interface.font-name` with `gsettings` or `dconf-editor`.

## Scale factor for `brave` or `chrome`

```
$HOME/.config/chrome-flags.conf

--force-device-scale-factor=n
```

```
$HOME/.config/brave-flags.conf

--force-device-scale-factor=n
```

## Add minimize and maximize buttons

```
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

```

## Install `papirus catppuccin` icon theme

```
pacman -S papirus-icon-theme
paru -S papirus-folders-catppucin-git
papirus-folders -C cat-[FLAVOR]-[ACCENT] -t Papirus
```

Then go to `lxappearance` -> `Icon Theme` -> `Papirus`. Also run `gsettings set org.gnome.desktop.interface icon-theme "Papirus"`

## Set `gtk` theme and font

```
gsettings set org.gnome.desktop.interface gkt-theme "[THEME]"
gsettings set org.gnome.desktop.interface font-name "[FONT] [SIZE]"
```

## `SSH` auth for cloned `git`

```
ssh-keygen -t ed25519 -C "email@example.com"
```

Copy the public key

```
cat ~/.ssh/id_ed25519.pub
```

Go to **GitHub** > **Settings** > **SSH and GPG keys** > **New SSH key** and save the key.

Test `ssh` connection

```
ssh -T git@github.com
```

Change repo `URL`

```
git remote set-url origin git@github.com:[USERNAME]/[REPO NAME].git
```

Now `git pull` should not ask for credentials.

## Change `dns`

Identify bad `dns`

```
dig archlinux.org
dig archlinux.org @1.1.1.1
dig archlinux.org @8.8.8.8
```

Replace `dns`

```
/etc/resolv.conf

nameserver 1.1.1.1
nameserver 8.8.8.8

```

Write-protect `/etc/resolv.conf`


```
sudo chattr +i /etc/resolv.conf
```

## Use fingerprint auth with `hyprlock`

Enroll without an authentication agent

```
sudo fprintd-enroll [user to unlock hyprland]
```

Add `pam_fprintd.so` as sufficient to the top of the `auth` section of `/etc/pam.d/hyprlock`

```
auth    sufficient  pam_fprintd.so
```

Modify `hyprlock.conf`

```
auth {
    pam.module = hyprlock
    fingerprint.enabled = true
}
```

To delete fingerprint use, for example `sudo fprintd-delete root`. To list user fingerprints use `sudo fprintd-list [user]`.

## `archive.org`

```
hogadom554@exitbit.com

python3 archive-org-downloader.py -e myemail@tempmail.com -p Passw0rd -r 0 -u https://archive.org/details/IntermediatePython
```

## `pdf` files

```
pdfjam --paper [letter, a4paper, etc.] --outfile output.pdf input.pdf

```

Custom papersize in `pt`

```
pdfjam --papersize '{[width]pt, [height]pt}' --outfile output.pdf input.pdf

```

Get rid of white borders

```
pdfjam --papersize '{[width]pt, [height]pt}' --scale 1.03 --outfile output.pdf input.pdf

```

Extract page interval

```
pdfjam input.pdf '[first]-[last]' -o output.pdf
```

Merge two files

```
pdfjam file1.pdf file2.pdf -o output.pdf

```

Convert `djvu` to `pdf`, requires `djvulibre`

```
ddjvu -format=pdf -quality=85 input.djvu ouput.pdf

```

## Litematica

### Replace blocks keybind `right click + [keybind]`

```
schematicEditReplaceAll

```

### Remove blocks keybind `right click + [keybind]`

```
schematicEditBreakPlaceAll

```

## Trust host after reinstalling OS

```
ssh-keygen -R [IP]
```

## `krita` shortcuts

- Deselect: `shift + a`
- Undo: `d`
- Redo: `w`
- Add vector layer: `v`
- Add paint layer: `n`
- Eraser mode: `e`
- Reference images tool: `shift + r`
- Show reference images: `r`
- Zoom out: `a`
- Zoom in: `j`
- Freehand selection tool: `q`
- Freehand brush tool: `b`
- Fit canvas: `2`

## Persitent `ip` device assignment

```
nmcli con add type ethernet ifname [eth-dev] con-name [name] ip4 [ip4/br] autoconnect yes
nmcli con mod euclides ipv4.method manual
nmcli con mod [name] ipv4adresses [ip]
```

Activate connection `[name]`

```
nmcli con up [name]
```

## `7z` + `aes-256` + `lzma2` compression with encrypted file and headers

```
7z a -t7z -mx=7 -mhe=on -p dir_compressed.7z dir/
```

Change `mx` from `0` to `9` to change the compression level, being `0` fast and `9` slow.

## Synchronize clock with internet

```
sudo timedatectl set-ntp true
```

## `sudo` not accepting password

```
faillock --reset
```

## Krita minimal view

- Disable all `Settings -> Dockers`
- Disable `View -> Show Status Bar`
- Enable `Settings -> Configure Krita -> Display -> Miscellaneous -> Hide Canvas Scrollbars`
- Disable `Settings -> Toolbars Shown -> Brushes and Stuff`
- Change `Settings -> General -> Window -> Multiple Document Mode -> Subwindows`
- Disable `Settings -> General -> Window -> Show on-canvas popup messages`
- Add `Tools -> Script -> Ten Scripts -> Ctrl + Shift + 1 -> ~/euclides/code/python/krita_toggle.py`

## Disable `bluetooth` power management

```
sudo vim /etc/modprobe.d/bluetooth_disable_pm.conf

options btusb enable_autosuspend=0
options bluetooth disable_ertm=1
```

## Mount device as owned by user
```
id
mount -o uid=[uid],gid=[gid] [dev] [mount_point]
```

## `thunar` open terminal in folder

```
Edit -> Configure custom actions -> Open Terminal Here -> Command

cd %f && st
```

## `pipewire`

```
$HOME/.config/pipewire/pipewire.conf.d/99-samplerate.conf
```
