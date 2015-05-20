#!/bin/bash
# set -x

# http://duff.dreda.org/
# watch -n 10 bash getgdraw.sh 

name=$1
size=$2
url=$3

now=$(date +"%Y%m%d_%H%M%S")
inbox="content/draw-history/"

mkdir -vp $inbox$name

wget -O $inbox$name/$now.png "$url/pub?w=$2&h=$2"
rm `duff -re $inbox$name/`


convert -resize $size -alpha remove \
				-loop 0  -delay 1x3\
				-colors 8 -dither FloydSteinberg \
				"$inbox$name/*.png" $inbox$name/animated.gif

gifsicle -O $inbox$name/animated.gif > $inbox$name/$name-opt.gif
rm $inbox$name/animated.gif