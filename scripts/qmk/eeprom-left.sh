#!/usr/bin/env bash

avrdude -p atmega32u4 -c avr109 -P /dev/cu.usbmodem14201 -U eeprom:w:"./quantum/split_common/eeprom-lefthand.eep"
