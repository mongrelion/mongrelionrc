#!/usr/bin/env bash

source "$(dirname $0)/base.sh"

avrdude -p atmega32u4 -c avr109 -P /dev/cu.usbmodem141201 -U flash:w:"${BUILDIR}/lets_split_rev2_${KEYMAP}.hex"
