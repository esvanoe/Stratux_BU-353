# Stratux_BU-353
Code to make BU-353 on Stratux Reliable

Drop the gpsTest.sh file into /opt/ and chmod 755 so it can be run for testing is needed.

add a line item in /etc/crontab to run it at reboot
  @reboot root cd /opt/ && ./gpsTest.sh
  
Should work if your GPS unit appears with pl2303 like the BU-353 does.

You should skip the cronjob at first and run it manually to see if it works. Uncomment the echo statements for some cheap debugging.
