#! /bin/bash

target=$1
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cat $script_dir/boot.py | sudo tee -a $target/boot/boot.py
sudo cp $script_dir/clocks.py $target/usr/local/share/pynq-venv/lib/python3.10/site-packages/pynq/lib/video/
