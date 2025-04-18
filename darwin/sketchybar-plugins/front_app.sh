#!/bin/bash

ICON_PADDING_RIGHT=5

case $INFO in
"Alacritty")
    ICON_PADDING_RIGHT=4
    ICON=
    ;;
"Calendar")
    ICON_PADDING_RIGHT=3
    ICON=
    ;;
"Discord")
    ICON=󰙯
    ;;
"Finder")
    ICON=
    ;;
"Firefox")
    ICON_PADDING_RIGHT=4
    ICON=
    ;;
"Google Chrome")
    ICON_PADDING_RIGHT=7
    ICON=
    ;;
"IINA")
    ICON_PADDING_RIGHT=4
    ICON=󰕼
    ;;
"Slack")
    ICON=
    ;;
"Preview")
    ICON_PADDING_RIGHT=3
    ICON=
    ;;
"TextEdit")
    ICON_PADDING_RIGHT=4
    ICON=
    ;;
*)
    ICON=
    ;;
esac

sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT
sketchybar --set $NAME.name label="$INFO"
