#!/bin/sh
#
#	Configuration to have one history file per terminal
#	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#	@(#)	[MB] de_001_histfile.sh	Version 1.1 du 19/11/06 - 
#

export HISTFILE=$HOME/.history_$TTY
export HISTTIMEFORMAT="%F %T "
