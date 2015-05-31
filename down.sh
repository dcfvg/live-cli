#!/bin/bash
#set -x


pi=10.10.100.19

rsync --update -rv --exclude-from 'rsync-exclude-list.txt' --delete-excluded -e ssh pi@$pi:~/Scripts/custom/live-cli/content/anim-e ~/Scripts/custom/live-cli/content/
dirframes="content/anim-e/frames"

for pic in `find $dirframes -iname "*.jpg" -type f`
do
    picname=$(basename $pic)
    if [  ! -f content/frames-1920/$picname ]
  	then
			convert -resize 1080 -rotate 90 $pic "content/frames-1920/$picname"
			echo $picname
		fi
done

now=$(date +"%Y%m%d_%H%M%S")


ffmpeg -framerate 25 -f image2 -pattern_type glob -i 'content/frames-1920/*.jpg' -c:v libx264 content/frames-1920/$now.mp4