#!/bin/bash

if [ ! -f ~/.ctx/${PREVIOUSCTX}${CTX}/.tool-versions ]; then
	cp ~/.ctx/default/.tool-versions ~/.ctx/${PREVIOUSCTX}/${CTX}/.tool-versions
	cp ~/.ctx/default/.tool-plugins.txt ~/.ctx/${PREVIOUSCTX}/${CTX}/.tool-plugins.txt
fi


make -f /Users/drew.easley/projects/github.com/juneeighteen/asdf/Makefile COMMAND=${@:-bash} shell
