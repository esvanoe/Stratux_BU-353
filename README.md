# Stratux_BU-353
Code to make BU-353 on Stratux work more reliably when also using a newer UATRadio v1.0 rev E.

The two devices basically end up in a race condition for ttyUSB0, and if the GPS unit ends up on ttyUSB1 then it doesn't work, however you will still have two SDR's but no GPS.

This tests for GPS on ttyUSB0, and if it doesn't find it there, it will reset the USB bus on the Raspberry Pi 3, and almost always lands on the right configuration after one reset.

Only tested on a Raspberry Pi 3 with a USB BU-353 GPS unit.

Directions:

Drop the gpsTest.sh file into /opt/ and chmod 755 so it can be run for testing as needed.

add a line item in /etc/crontab to run it at reboot (vi /etc/crontab)
  @reboot root cd /opt/ && ./gpsTest.sh
  
Should work if your GPS unit appears with pl2303 like the BU-353 does.

You should skip the cronjob at first and run it manually to see if it works. 

Uncomment the echo statements for some cheap debugging.
