#!/bin/bash
# set -x

source config.sh

# for pi in ${rpistrans[*]}
# do	
# 	echo "=====" $pi "=====" 
# 	cpRsaKey $pi
# done

while true; do

	now=$(date +"%Y%m%d_%H%M%S")

	t="content/anim-e/"
	
	mkdir -vp $t/$now
	mkdir -vp $t/frames

	for pi in ${rpistrans[*]}
	do	
		echo "=====" $pi "=====" 
		ssh pi@$pi 'fswebcam -r 1920x1080 --frames 1 --no-banner Scripts/$HOSTNAME-$(date +"%y.%m.%d-%H.%M.%S").jpg; exit'
		rsync -avz --remove-source-files -e ssh pi@$pi:~/Scripts/*.jpg $t/$now/
	done

	convert -rotate -90 "$t/$now/rpi-a*.jpg" $t/$now/a.jpg
	convert -rotate  90 "$t/$now/rpi-b*.jpg" $t/$now/b.jpg
	convert -rotate -90 "$t/$now/rpi-c*.jpg" $t/$now/c.jpg
	convert -rotate  90 "$t/$now/rpi-d*.jpg" $t/$now/d.jpg

	convert -size 2160x3840 xc:black $t/$now.jpg

	composite -geometry +1080+1920  $t/$now/a.jpg $t/$now.jpg $t/$now.jpg
	composite -geometry +0+1920 		$t/$now/b.jpg $t/$now.jpg $t/$now.jpg
	composite -geometry +1080+0 		$t/$now/c.jpg $t/$now.jpg $t/$now.jpg
	composite -geometry +0+0 				$t/$now/d.jpg $t/$now.jpg $t/frames/$now.jpg

	rm $t/$now/a.jpg $t/$now/b.jpg $t/$now/c.jpg $t/$now/d.jpg

	convert -resize 50% $t/frames/$now.jpg $t/live.jpg

done