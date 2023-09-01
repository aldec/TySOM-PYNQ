#!/bin/bash

set -x
set -e

target=$1
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo sed -i "s|mmcblk0|mmcblk1|g" $target/usr/local/bin/resizefs.sh
sudo touch $target/etc/fstab
