#!/bin/bash
# set -x

source config.sh

for pi in ${rpis[*]}
do	
	echo "=====>" $pi

	# ssh $pi
	# cpRsaKey $pi
	installSoft $pi
	initProject $pi
	
done