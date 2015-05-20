source function.sh 

# rpia=pi@192.168.0.
# rpib=pi@192.168.0.
# rpic=pi@192.168.0.
rpid=pi@192.168.0.154
rpie=pi@192.168.0.140
rpis=($rpid $rpie)

for pi in ${rpis[*]}
do	
	echo "=====>" $pi

	# ssh $pi
	# cpRsaKey $pi
	# installSoft $pi


	ssh $pi 'streamer -f jpeg -s 1920x1080 -o Scripts/$(date +"%y.%m.%d-%H.%M.%S").jpeg; exit'


done

rsync -avz --remove-source-files -e ssh $rpie:~/Scripts/*.jpeg /Users/benoit/Desktop