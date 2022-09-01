#!/bin/bash
set -e

echo "Checking ASDF Plugins and Tools"

cat ~/plugins.txt  | while read -r line; do
	PLUGIN_NAME=$(echo ${line} | awk '{print $1}')
	if [ ! -d ~/.asdf/plugins/${PLUGIN_NAME} ]; then
		echo "asdf plugin-add ${line}"
		asdf plugin-add ${line};
	fi

done

