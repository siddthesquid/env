#!/bin/bash
echo "Server = https://mirrors.ocf.berkeley.edu/archlinux/$repo/os/$arch
Server = https://mirrors.mit.edu/archlinux/$repo/os/$arch
Server = https://plug-mirror.rcac.purdue.edu/archlinux/$repo/os/$arch
Server = https://mirrors.rutgers.edu/archlinux/$repo/os/$arch
Server = https://mirror.umd.edu/archlinux/$repo/os/$arch" > /etc/pacman.d/mirrorlist
