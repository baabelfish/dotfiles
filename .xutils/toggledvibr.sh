#!/bin/bash
VALUE=1023
[[ ! $(nvidia-settings -q "DigitalVibrance"|grep "Attribute.*: 0\.$") ]] && VALUE=0
nvidia-settings -a "DigitalVibrance=$VALUE"
