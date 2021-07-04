#!/bin/bash

# get the project dir
project_folder=$(git rev-parse --show-toplevel)
# Check if all the programs are running

killAndRestart() {
sudo killall fbi
dd if=/dev/zero of=/dev/fb0
sudo fbi -d /dev/fb0 -T 1 -t 180 -noverbose -u --blend 1000 /home/pi/images/Diashow/*.jpg
}
echo "Project Folder: $project_folder"
if [[ ! $(ps ax | grep '[s]tartDiashow.sh') || ! $(ps ax | grep '[f]bi') ]]; then
  echo "Diashow is not running, restarting."
  sudo killall fbi
  /home/pi/scripte/startDiashow.sh &
fi
