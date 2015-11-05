err() {
  echo "$1"
  exit 1
}

AMOUNT=2

if [[ "$1" == "inc" ]]; then
    ponymix -N increase $AMOUNT
elif [[ "$1" == "dec" ]]; then
    ponymix -N decrease $AMOUNT
elif [[ "$1" == "toggle" ]]; then
    ponymix -N toggle
elif [[ "$1" == "pause" ]]; then
    playerctl play-pause
elif [[ "$1" == "next" ]]; then
    playerctl next
elif [[ "$1" == "prev" ]]; then
    playerctl previous
fi

