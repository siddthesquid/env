#!/bin/bash
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