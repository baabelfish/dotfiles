#!/bin/bash
curl -X PUT \
    -H 'Content-Type: application/json;charset=UTF-8' \
    -H "x-token: $MY_HUE_LIGHTS" \
    -d "$2" \
    "https://client-eastwood-dot-hue-prod-us.appspot.com/api/0/lights/${1}/state"
