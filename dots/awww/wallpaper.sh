#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/.config/awww/wallpapers"

shopt -s nullglob
WALLPAPERS=("$WALLPAPER_DIR"/*.gif)

if [ ${#WALLPAPERS[@]} -eq 0 ]; then
    exit 1
fi

# Extract the active .gif path regardless of surrounding labels/text
CURRENT_PATH=$(awww query | grep -oE '/[^,[:space:]]+\.gif' | head -n 1)
CURRENT_NAME=$(basename "$CURRENT_PATH" 2>/dev/null)

NEXT_INDEX=0
for i in "${!WALLPAPERS[@]}"; do
    if [[ "$(basename "${WALLPAPERS[$i]}")" == "$CURRENT_NAME" ]]; then
        NEXT_INDEX=$(( (i + 1) % ${#WALLPAPERS[@]} ))
        break
    fi
done

awww img "${WALLPAPERS[$NEXT_INDEX]}" --transition-type wipe --transition-fps 60
