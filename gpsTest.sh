#!/bin/bash

#let everything settle down after boot

sleep 60

#Grab out a known value from  dmesg to determine which device ended up on ttyUSB0

gpsNoun=$(dmesg | grep attached |grep ttyUSB0 |tail -n 1 | cut -d ":" -f 2| cut  -d " " -f 2)

#If the GPS ended up on ttyUSB0 where we want it, quit.
if  [ "$gpsNoun" == "pl2303" ]; then
	echo "GPS Already Good"
	exit
fi

#If it did not we will cycle bus power to USB which should get us where we want to be.
#It will iterate through it until it lands there, but usually good on the first try

while [ "$gpsNoun" != "pl2303" ]; do
#	echo $gpsNoun
#	echo "Resetting the USB Bus"
	echo "0" > /sys/devices/platform/soc/3f980000.usb/buspower
	sleep 5
	echo "1" > /sys/devices/platform/soc/3f980000.usb/buspower
	sleep 5
	gpsNoun=$(dmesg | grep attached |grep ttyUSB0 |tail -n 1 | cut -d ":" -f 2|cut  -d " " -f 2)
#	echo "Reset gpsNoun to: $gpsNoun"
done
