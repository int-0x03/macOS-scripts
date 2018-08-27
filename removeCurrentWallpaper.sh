#!/bin/bash
WALL_PATH="$(osascript -e '
    tell application "Finder"
    set theDesktopPic to desktop picture as alias
    set theName to posix path of theDesktopPic
    end tell')"
echo $WALL_PATH
STATUS=$?

if [[ $STATUS = 0 ]]; then
	mv "${WALL_PATH}" ~/.Trash/
	osascript -e 'display notification "Wallpaper has been moved to trash." with title $WALL_PATH'
else
	osascript -e 'display notification "Wallpaper already removed" with title $WALL_PATH'
fi
