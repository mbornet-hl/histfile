#!/bin/sh
#
#	Definition of alias 'H'
#	~~~~~~~~~~~~~~~~~~~~~~~
#
#	@(#)	[MB] de_005_histgrep.sh	Version 1.1 du 19/11/06 - 
#

H()
{
	history | egrep --color=auto "$1" | hl "$1"
}

