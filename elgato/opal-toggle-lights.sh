#!/bin/bash
# declare ip addresses of all elgato lights
Light_1="192.168.178.22"
Light_2="192.168.178.28"
CAMERA_NAME="Opal C1"
LAST_EVENT=""

exec log stream | grep -E --line-buffered 'UVCAssistant' | # filter for UVCAssistant so BT stream is ignored
grep -E --line-buffered '(stop|start) stream' | # filter log events
  # tee /dev/stderr |                           # output matching events for debugging
  sed -Eu 's/.*(start|stop).*/\1/' | # reduce the log message down to a single word identifying the event/state
  while read -r event; do                     # store that word in the $event variable
    # Skip if this is the same event as before (debounce)
    if [ "$event" = "$LAST_EVENT" ]; then
      continue
    fi
    LAST_EVENT="$event"
    
    echo "Camera state has changed to: $event"
    if [ "$event" = "start" ]; then
      # echo "Keylight on"
      keylight on --elgato-ip "$Light_1" --number-of-lights 1
      keylight on --elgato-ip "$Light_2" --number-of-lights 1
      say -v Samantha "Adjust your microphone" &
      osascript -e 'beep' -e 'display dialog "🎙️ Adjust your microphone!" buttons {"OK"} default button 1 with title "Adjust microphone" with icon file "System:Library:CoreServices:CoreTypes.bundle:Contents:Resources:AlertStopIcon.icns" giving up after 20'
    else
      # echo "Keylight off"
      keylight off --elgato-ip "$Light_1" --number-of-lights 1
      keylight off --elgato-ip "$Light_2" --number-of-lights 1
    fi
  done