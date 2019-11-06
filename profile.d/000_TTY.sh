#!/bin/sh
#
#    Initialization of the TTY environment variable
#    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
#    @(#)  [MB] de_000_TTY.sh Version 1.1 du 19/11/06 - 
#

tty=`tty`
case "$tty" in
     /dev/tty*)     TTY=`echo $tty | sed 's:/dev/::'`
                    ;;

     /dev/pts/*)    TTY=`echo $tty | sed 's:/dev/::;s:/::'`
                    ;;

     /dev/syscon)   TTY="syscon"
                    ;;

     *)             TTY="unknown"
                    ;;
esac

export TTY
