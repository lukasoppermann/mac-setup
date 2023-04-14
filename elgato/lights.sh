# declare ip addresses of all elgato lights
lights=(
  "192.168.178.40:9123" 
  "192.168.178.42:9123"
)

#  fn to toggle lights (1 = on, 0 = off)
toggleLights () {
  for i in "${lights[@]}"
  do
      curl -X PUT \
      "$i/elgato/lights" \
      --header 'Content-Type: application/json' \
      --data-raw "{
      \"lights\": [
        {
          \"on\": $1
        }
      ]
    }"
    # or do whatever with individual element of the array
  done
}


# turn lights on or off
if [ -z "$1" ] || [[ "$1" = "on" ]];
then
  toggleLights 1
else
  toggleLights 0
fi

