#!/bin/bash
find . -type f |
shuf |
nl -n rz |
while read -r number name; do
  ext=${name##*/}
  case $ext in
    *.*) ext=.${ext##*.};;
    *) ext=;;
  esac
  mv "$name" "./randomized/${name%/*}/$number$ext"
done
