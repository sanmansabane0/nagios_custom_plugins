#!/usr/bin/env bash
# A script to check whether volumes are mounted with volume_name and filesystem_type as iinput variables

source common_things.sh
volume_name=$1
filesystem_type=$2
grep_output=`mount | grep -e $volume_name | grep -e $filesystem_type`
exit_status=`echo  $?`
echo $grep_output
echo $exit_status
if [ $exit_status = "0" ]
then
	echo "$volume_name : is mounted"
	exit $OK
else
	echo "Critical Error."
	exit $CRITICAL
fi