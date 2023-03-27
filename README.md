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

# Arch Linux

Arch Linux is probably installed on a flash drive. Boot from that flash drive in UEFI mode without CSM enabled.

## On Boot

```sh
# Ensure UEFI boot
ls /sys/firmware/efi/efivars 1>/dev/null \
  || echo "Not booted in UEFI mode"

# Set the keymap
loadkeys us

# Set the time zone
timedatectl set-timezone America/Los_Angeles

# Ensure internet connectivity, or connect to internet
# ip link
```

## Partitions

Assuming 2 TB of storage, the below table shows how to partition the drive.

| Mount Point | Type | Size               | Description    |
| ----------- | ---- | ------------------ | -------------- |
| /           | ext4 | 100 GB             | Root partition |
| /data       | ext4 | 1 TB               | Data partition |
| [SWAP]      | swap | 16 GB              | Swap partition |
| /home       | ext4 | 900 GB (remaining) | Home partition |

The above can be achieved with the following fdisk commands:

## WiFi

## Bluetooth

# Basic Setup

# Alacritty

# zsh

# tmux

# neovim

# Package Managers and Runtimes

## pacman

## snap

## Python / pip

## Scala

## Rust / cargo

## JavaScript/Typescript

# Misc Applications

## Chrome

## Discord

## Slack

## Spotify

## Zoom

# notes

flashdrive - /dev/sda
windows: /dev/nvme1n1
