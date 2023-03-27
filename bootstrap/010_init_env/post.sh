#!/bin/bash
ls /sys/firmware/efi/efivars 1>/dev/null \
  || (echo "Not booted in UEFI mode" && exit 1)