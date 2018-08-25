#!/bin/bash

# Script to run on a fresh install to update everything and then install all the
# things that I would normally install one by one as I remember or find out that
# something I need is not installed.
#
# So this way, I can prep a system to have everything ready for me.
#

sudo apt-get update -y
sudo apt-get dist-upgrade -y

installedcheck(){
	clear;
	echo -e "Checking for $APPCHECK";
	echo " ";
	$APPCHECK -v | ROUTPUT="$?";
	if [[ "$ROUTPUT" = 0 ]]
	then
	echo -e "$APPCHECK detected";
	else
	2LIST='"$APPCHECK" $2LIST';
	fi

# w3m
unset APPCHECK;
APPCHECK='w3m';
installedcheck;
unset APPCHECK;

# byobu
APPCHECK='byobu';
installedcheck;
unset APPCHECK;

#sudo apt-get install byobu
