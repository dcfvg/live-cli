source config.sh

for pi in ${rpis[*]}
do	
	echo "=====>" $pi

	# ssh $pi
	# cpRsaKey $pi
	installSoft $pi
	initProject $pi

	ssh $pi 'streamer -f jpeg -s 1920x1080 -o Scripts/$(date +"%y.%m.%d-%H.%M.%S").jpeg; exit'
	
done