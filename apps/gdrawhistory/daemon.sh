#!/bin/bash
#set -x

server=$1

bash getgdraw.sh "main" "../../content/draw-history/" 1000 \
		 "https://docs.google.com/drawings/d/15b1lUUE1S0mQIukwp6-t5wvYep1MiUw-XC6ixeEVTiM"

bash getgdraw.sh "dcfvg" "../../content/draw-history/" 1000 \
			"https://docs.google.com/drawings/d/1EdyCe0d2GIS_ZrYOzA8P0gOO9Yv3xLwpEgZPR4peHGE"

rsync --update -raz ~/Scripts/custom/live-cli/content/draw-history/main/*.gif -e ssh $server:~/www/live.dcfvg.com/content/7-teletext/ 
