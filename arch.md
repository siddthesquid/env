# Development Environment

```sh
git clone git@github.com:siddthesquid/env.git
```

This document describes step-by-step instructions for setting up a development environment. What we want is

- Arch Linux
- Alacritty
- zsh
- tmux
- neovim
- package managers
- some other misc applications

Here are some general principles:

- Optimize for keyboard usage, minimize mouse usage
  - we can assume function keys exist
  - ctrl + alt + shift + windows
  - deprioritize arrow and function key assignments
- Install from source as much as possible
- Install locally as much as possible
- We assume Arch Linux but notes should ideally be as generic as possible (hopefully also including OSX)
- Configuration should be declarative and version controlled (in this repo)

There's also some installation instructions for OSX when we are installing applications.

# Preparation

## Computer

We should wipe the drive (or prepare it however) that we would like to use. This isn't really required, but it has caused issues for me before to not do it, so might as well.

```sh
# Identify the drive
lsblk
INSTALL_DESTINATION_DRIVE=/dev/nvme1n1

# Wipe the drive
wipefs -a $INSTALL_DESTINATION_DRIVE
```

## Installation drive

```sh
# Identify the drive
lsblk
LIVE_INSTALL_DRIVE=/dev/sda

# Wipe the drive
umount ${LIVE_INSTALL_DRIVE}1
sudo wipefs -a $LIVE_INSTALL_DRIVE

# Copy the Arch Linux ISO to the drive
ARCH_ISO_PATH=~/Downloads/archlinux-x86_64.iso
sudo dd bs=4M if=$ARCH_ISO_PATH of=$LIVE_INSTALL_DRIVE status=progress oflag=direct
```

# Arch Linux Installation

Arch Linux is probably installed on a flash drive. Boot from that flash drive in UEFI mode without CSM enabled.

## First steps

Simple keyboard settings and UEFI check.

```sh
# Check if booted in UEFI mode
ls /sys/firmware/efi/efivars 1>/dev/null \
  || echo "Not booted in UEFI mode"

# Set the keymap
loadkeys us

# Set the time zone
timedatectl set-timezone America/Los_Angeles
```

## Partitions

Assuming 2 TB of storage, the below table shows how to partition the drive.

| Mount Point | Type | Size               | Description    |
| ----------- | ---- | ------------------ | -------------- |
| [BOOT]      | EFI  | 1 GB               | Boot partition |
| /           | ext4 | 200 GB             | Root partition |
| /data       | ext4 | 1 TB               | Data partition |
| [SWAP]      | swap | 16 GB              | Swap partition |
| /home       | ext4 | 800 GB (remaining) | Home partition |

The above can be achieved with the following parted command:

```sh
parted /dev/nvme1n1 \
  mklabel gpt \
  mkpart ESP fat32 1MiB 512MiB \
  set 1 boot on \
  name 1 boot \
  mkpart primary ext4 512MiB 250GiB \
  name 2 root \
  mkpart primary ext4 250GiB 1250GiB \
  name 3 data \
  mkpart primary linux-swap 1250GiB 1266GiB \
  name 4 swap \
  mkpart primary ext4 1266GiB 100% \
  name 5 home
```

Let's record the partitions into variables:

```sh
BOOT_PARTITION=/dev/nvme1n1p1
ROOT_PARTITION=/dev/nvme1n1p2
DATA_PARTITION=/dev/nvme1n1p3
SWAP_PARTITION=/dev/nvme1n1p4
HOME_PARTITION=/dev/nvme1n1p5
```

Format the partitions:

```sh
mkfs.fat -F32 /dev/$BOOT_PARTITION
mkfs.ext4 /dev/$ROOT_PARTITION
mkfs.ext4 /dev/$DATA_PARTITION
mkswap /dev/$SWAP_PARTITION
mkfs.ext4 /dev/$HOME_PARTITION
```

Mount the partitions:

```sh
mount $ROOT_PARTITION /mnt
mount -m $BOOT_PARTITION /mnt/boot
mount -m $DATA_PARTITION /mnt/data
mount -m $HOME_PARTITION /mnt/home
swapon $SWAP_PARTITION
```

## OS Bootstrapping

Replace `/etc/pacman.d/mirrorlist` with a mirrors from US academic institutions:

```sh
echo 'Server = https://mirrors.ocf.berkeley.edu/archlinux/$repo/os/$arch
Server = https://mirrors.mit.edu/archlinux/$repo/os/$arch
Server = https://plug-mirror.rcac.purdue.edu/archlinux/$repo/os/$arch
Server = https://mirrors.rutgers.edu/archlinux/$repo/os/$arch
Server = https://mirror.umd.edu/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
```

Bootstrap (or `pacstrap`) the system:

```sh
pacstrap /mnt \
  base \
  base-devel \
  linux \
  linux-firmware \
  vim
```

Generate the `fstab` file and chroot:

```sh
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
```

Timezone and hardware clock:

```sh
ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
hwclock --systohc
```

Locale

```sh
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
```

Keyboard `vconsole`

```sh
echo KEYMAP=us > /etc/vconsole.conf
```

## User setup

Set the root password:

```sh
passwd
# Enter password
```

Create a new user:

```sh
useradd -m -G wheel -s /bin/zsh sidd
passwd sidd
# Enter password
```

## Network

Set the hostname:

```sh
HOSTNAME=woofnet
echo $HOSTNAME > /etc/hostname
```

## Bootloader

```sh
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```

## Reboot

```sh
exit
umount -R /mnt
reboot
```

# Hardware Configuration

In this section, we'll make sure all the hardware is configured properly, along with their drivers. Some things we may want to configure:

- Network
- Keyboard
- Mouse
- WiFi
- Bluetooth
- Audio Out
  - Audio interface
  - Wireless Headphones
  - Wired Headphones
  - Speakers
- Microphone
- Webcam/Camera
- Chassis Fans/Lights
- GPU
- Monitors

## WiFi

## Bluetooth

# Basic Setup

# Alacritty

# zsh

# tmux

# neovim

# Core Developer Tools

This includes things like compilers, package managers, build tools, and LSPs. We will try to build from source as much as possible.

When looking at package managers, we care about how to

- install, remove, and update package
- list all packages we have
- search for new packages
- locate packages in our filesystem for debugging

When looking at programming languages and compilers, we care about how to

- install, remove, and update the the corresponding tools
- setup our PATHs and environment variables
- manage multiple versions
- install and run any LSPs
- run the REPL or simple scripts, if applicable
- work in a virtual environment
- start and configure a new project
- compile and run programs
- publish the project to a package registry

## pacman

## brew

## snap

## C / C++ / CMake / Conan

## Java / Maven

## Python / pip

## Scala / sbt

## JavaScript / node / npm

## Rust / cargo

## golang

## Haskell / cabal

## Swift / Xcode

## Kotlin / Gradle

## Agda

# More LSPs

## sh / zsh

## json

## yaml

## toml

## xml

## html

## css

## ini

## markdown

## latex

## HCL

# Other Tools

## VirtualBox

## Docker

## kubectl

## minikube

## Terraform

## Helm

## AWS

## GCP

## Azure

## VPN

# UI Applications

Everything we have covered has mostly only involved the terminal. However, there are a few UI applications worth installing, along with managing native OS notifications.

## Chrome

https://aur.archlinux.org/packages/google-chrome

## Discord

## Slack

## Spotify

## Zoom

# notes

flashdrive - /dev/sda
windows: /dev/nvme1n1
