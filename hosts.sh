#!/bin/bash
hostsfile="hosts"
if [ -f $hostsfile ] ; then
	rm $hostsfile
fi

while read line
do
	if [ -n "$line" ] ; then
		start=${line:0:1}
		if [ $start != "#" ] ; then
			echo "127.0.0.1 " $line >> $hostsfile
		fi
	fi
done < config-ads-list

read googleip done < config-google-ip

while read line
do
	if [ -n "$line" ] ; then
		start=${line:0:1}
		if [ $start != "#" ] ; then
			echo $googleip " " $line >> $hostsfile
		fi
	fi
done < config-google-list


