#!/bin/bash
# set -x

source config.sh

for pi in ${rpis[*]}
do	
	#echo "=====" $pi "=====" 
 	ping -c 1 $pi 

	#ssh pi@$pi
	#cpRsaKey $pi
	#installSoft $pi
	#initProject $pi
	#updateProjet $pi

done