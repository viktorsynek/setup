#!/bin/bash

# Set default output device
pactl set-default-sink alsa_output.usb-HP__Inc_HyperX_Virtual_Surround_Sound_00000000-00.analog-stereo

# Set default input device
pactl set-default-source alsa_input.usb-FIFINE_683_Microphone_FIFINE_683_Microphone-00.analog-stereo
