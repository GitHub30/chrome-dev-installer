#!/usr/bin/env bash

command -v google-chrome-unstable && exit

command -v gdebi || sudo apt-get install -y gdebi
command -v gdebi || exit 1

cd "$(xdg-user-dir DOWNLOAD)"

url='https://dl.google.com/linux/direct/google-chrome-unstable_current_amd64.deb'
filename=$(basename "$url")
wget "$url"
test -f "$filename" && sudo gdebi --non-interactive "$filename"
test -f "$filename" && rm "$filename"
