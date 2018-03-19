#!/bin/bash

hc() { "${herbstclient_command[@]:-herbstclient}" "$@" ;}
monitor=${1:-0}
geometry=( $(herbstclient monitor_rect "$monitor") )
if [ -z "$geometry" ] ;then
	echo "Invalid monitor $monitor"
	exit 1
fi
# geometry has the format W H X Y
x=${geometry[0]}
y=${geometry[1]}
panel_width=${geometry[2]}
panel_height=16
font="-*-fixed-medium-*-*-*-12-*-*-*-*-*-*-*"
bgcolor=$(hc get frame_border_normal_color)
selbg=$(hc get window_border_active_color)
selfg='#101010'


uniq_linebuffered() {
	awk '$0 != l { print ; l=$0 ; fflush(); }' "$@"
}

echo "test"

right="$($HOME/.config/herbstluftwm/hl_panel_content.py) $date"
echo $right
right_text_only=$(echo -n "$right" | sed 's.\^[^(]*([^)]*)..g')
echo $right_text_only

width=$(textwidth "$font" "$right_text_only	")
echo $width

len=$(expr $(echo -n "$right" | wc -c) / 3)
echo $len
