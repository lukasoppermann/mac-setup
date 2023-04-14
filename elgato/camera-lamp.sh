#!/bin/bash
exec log stream --predicate 'process == "UVCAssistant|camera|stream|tccd" && (eventMessage CONTAINS "start stream" || eventMessage CONTAINS "Stop Stream")' |
  /usr/bin/grep -vE --line-buffered '^Filter' | # filter out the informational output at launch
  tee /dev/stderr |                             # output matching events for debugging
  /usr/bin/sed -Eu 's/.*(start|stop).*/\1/' |   # reduce the log message down to a single word identifying the event/state
  while read -r event; do                       # store that word in the $event variable
    echo "Camera $event"
    if [ "$event" = "start" ]; then
      echo "Lamp on"
      sh '/Users/lukasoppermann/Repos/mac-setup/elgato/lights.sh' on &
    else
      echo "Lamp off"
      sh '/Users/lukasoppermann/Repos/mac-setup/elgato/lights.sh' off &
    fi
  done