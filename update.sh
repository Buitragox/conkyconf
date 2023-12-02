#!/usr/bin/env bash

if (( $# != 1 ))
then
	echo "Usage: ./update.sh <path/to/new/config>"
	exit 1
fi

sudo cp $1 /etc/conky/conky.conf
