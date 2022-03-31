#!/bin/bash

set -x
set -e

target=$1
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sed -i "s|mmcblk0p1|mmcblk1p1|g" $target/usr/local/bin/resizefs.sh
echo "/dev/mmcblk1p1 /boot auto defaults 0 0" | sudo tee -a $target/etc/fstab
