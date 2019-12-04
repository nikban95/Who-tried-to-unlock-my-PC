#!/bin/bash

# get current date and time
# %d for date, %m for month, %Y for year, %T for time
dateAndTime=`date +%d-%m-%Y--%T`
imagePath="/var/tmp/loginImage--$dateAndTime.jpg"

# if this file already exists then use another file name
if [ -e $imagePath ]
then
	i=0
	while [ 1 ]
	do
		imagePath="/var/tmp/loginImage--$dateAndTime--$i.jpg"
		if [ -e $imagePath ]
		then
			echo $i
		else
			break
		fi
		i=`expr $i + 1`
	done
fi

# -f videoforlinux2 is library to capture live video in linux
# -s to tell the resolution
# -i to tell the source from where to grab the video
# -frames 1 to gra only one frame that will be a photo
avconv -f video4linux2 -s 640x480 -i /dev/video0 -ss 0:0:1 -frames 1 $imagePath
