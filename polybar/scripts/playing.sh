#!/bin/bash

PLAYER="playerctld"

artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)
playing="$title - $artist"

if [ ${#playing} -gt 51 ]; then
    playing="${playing:0:51}..."
fi

PLAYERCTL_STATUS=$(playerctl --player=$PLAYER status 2>/dev/null)
EXIT_CODE=$?

NO_PLAYER_MESSAGE="No player is running"

if [ $EXIT_CODE -eq 0 ]; then
    STATUS=$PLAYERCTL_STATUS
else
    STATUS=$NO_PLAYER_MESSAGE
fi

if [ "$STATUS" = "Stopped" ]; then
    echo "No music is playing"
elif [ "$STATUS" = "Paused" ]; then
    echo "$playing"
elif [ "$STATUS" = "$NO_PLAYER_MESSAGE" ]; then
    echo "$STATUS"
else
    echo "$playing"
fi
