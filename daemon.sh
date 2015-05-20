#!/bin/bash
# set -x
source config.sh


# make timelapse animation
size=350
target="/Users/benoit/Scripts/custom/live-cli/content/anim-e"

rsync -avz --remove-source-files -e ssh $rpie:~/Scripts/*.jpeg $target 
ssh $rpie 'streamer -f jpeg -s 1920x1080 -o Scripts/$(date +"%y.%m.%d-%H.%M.%S").jpeg; exit'

convert -resize $size \
				-loop 0  -delay 1x25 \
				-colors 8 -dither FloydSteinberg \
				"$target/*.jpeg" $target/animated.gif

gifsicle -O $target/animated.gif > $target/"-opt.gif"