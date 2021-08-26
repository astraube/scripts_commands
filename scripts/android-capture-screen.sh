#!/bin/bash

set -e

# Usage:
# bash ./capture-screen.sh
# bash ./capture-screen.sh -s 192.168.0.101

ADB_FLAGS="$@"

CAPTURE_BITRATE=2000000
CAPTURE_HEIGHT=720
CAPTURE_WIDTH="$((($CAPTURE_HEIGHT / 9 * 16)))" # automatically calculate width

SecondString=$(date +%s)

# this call will fail if no single device could be selected
adb ${ADB_FLAGS} shell uptime

screenStream() {
  while true; do
    adb ${ADB_FLAGS} exec-out screenrecord --output-format=h264 --bit-rate ${CAPTURE_BITRATE} --size "${CAPTURE_WIDTH}x${CAPTURE_HEIGHT}" -
  done
}

# Display bits to screen
# screenStream | ffplay -hide_banner -framerate 60 -framedrop -f h264 -i -

# Display to screen
screenStream | ffplay -hide_banner -framerate 60 -framedrop -bufsize 16M -

# Save to file
# screenStream | ffmpeg -i - -s 1024x768 -framerate 30 -bufsize 16M $SecondString.mp4 -