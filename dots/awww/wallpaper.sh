#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/.config/awww/wallpapers"

shopt -s nullglob
WALLPAPERS=("$WALLPAPER_DIR"/*.gif)

if [ ${#WALLPAPERS[@]} -eq 0 ]; then
    exit 1
fi

# Extract the active wallpaper path directly from the running awww daemon
CURRENT=$(awww query | grep -oP 'image: \K.*' | head -n 1)

NEXT_INDEX=0
for i in "${!WALLPAPERS[@]}"; do
    if [[ "${WALLPAPERS[$i]}" == "$CURRENT" ]]; then
        NEXT_INDEX=$(( (i + 1) % ${#WALLPAPERS[@]} ))
        break
    fi
done

awww img "${WALLPAPERS[$NEXT_INDEX]}" --transition-type wipe --transition-fps 60
