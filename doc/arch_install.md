## `tty` internet connection

```
iwctl
device list
device DEVICE set-property Powered off
device DEVICE set-property Powered on
station DEVICE scan
station DEVICE get-networks
station DEVICE connect SSID
exit
```

## Partitions and format

- `efi (1GB)`
- `swap (4GB)`
- `root  (32GB)`

```
fdisk -l
cfdisk
```

```
mkfs.ext4 /dev/root_partition
mkswap /dev/swap_partition
mkfs.fat -F 32 /dev/efi_system_partition

```

## Mount partitions (1/2)

```
mount /dev/root_partition /mnt
swapon /dev/swap_partition
```

## Base packages

```
pacstrap -K /mnt base base-devel linux linux-firmware networkmanager wpa_supplicant grub
```

## Generate `fstab`

```
genfstab -U /mnt >> /mnt/etc/fstab
```

## Change to `/mnt`

```
arch-chroot /mnt
```

## Set time zone

```
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
```

## Generate `etc/adjtime`

```
hwclock --systohc
```

## Set passwords

```
passwd
useradd -m username
passwd username
usermod -aG wheel username
```

```
/etc/sudoers

%wheel ALL=(ALL:ALL) ALL
```

## Localization

```
/etc/locale.gen

en_US
es_MX
```

```
locale-gen
```

## Mount partitions (2/2)

```
mount --mkdir /dev/efi_system_partition /mnt/boot
grub-install --target=x86_64-efi --efi-directory=/mnt/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```

## Hosts

```
echo username > /etc/hostname
```

```
/etc/hosts

127.0.0.1       localhost
::1             localhost
127.0.0.1       username.localhost username
```

## Network manager

```
systemctl start NetworkManager.service
systemctl enable NetworkManager.service
```

```
systemctl start wpa_supplicant.service
systemctl enable wpa_supplicant.service
```

## Connect to internet using `NetworkManager`

```
nmcli radio wifi
nmcli radio wifi on
nmcli dev wifi list
sudo nmcli --ask dev wifi connect SSID
```

## Install `paru` package manager

Run as `user` in `/home/user/`.

```
mkdir repos
cd repos
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin/
makepkg -si

```

## Reboot

```
<C-d>
<C-d>
umount -R /mnt
reboot
```
