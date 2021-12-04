#bin/sh

setxkbmap -option caps:none
xmodmap -e "keycode 66 = F12"
xmodmap -e "keycode 49 = grave asciitilde grave asciitilde grave asciitilde"
xmodmap -e "keycode  48 = apostrophe quotedbl apostrophe quotedbl apostrophe quotedbl"
xmodmap -e "keycode  15 = 6 asciicircum 6 asciicircum 6 asciicircum"
