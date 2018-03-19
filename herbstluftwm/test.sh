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
{
 while true ; do
	# "date" output is checked once a second, but an event is only
 	# generated if the output changed compared to the previous run.
	date +$'date\t^fg(#efefef)%H:%M^fg(#909090), %Y-%m-^fg(#efefef)%d'
 	sleep 1 || break
 done > >(uniq_linebuffered)
 } 2> /dev/null | {
	echo "lul"
	 IFS=$'\t' read -ra tags <<< "$(hc tag_status $monitor)"
 visible=true
 date=""
 windowtitle=""
 }
