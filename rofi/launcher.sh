#!/bin/bash

dir="$HOME/.config/rofi"
theme="everforest-dark"

selected=$(rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi \
    -drun-print-desktop \
    -print-to-stdout \
    2>/dev/null)
