
source config.sh

size=300
t="content/amin-e/"

convert -resize $size \
				-loop 0  -delay 1x25 \
				-colors 8 -dither FloydSteinberg \
				"$t/frames/*.jpg" $t/animated.gif

gifsicle -O $t/animated.gif > $t/"live.gif"

# rsync --update -raz /home/pi/Scripts/custom/live-cli/content/anim-e/live.* -e ssh $1:~/www/live.dcfvg.com/content/2-webcams/