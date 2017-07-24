#!/bin/sh --norc
if [ -e $PROTEUMIMHOME/interface/proteumIM ]; then
	export PATH=$PROTEUMIMHOME:$PATH
	export wish=`which wish`
	$wish $PROTEUMIMHOME/interface/proteumIM -- $1 
else
	echo "Tcl/Tk PROTEUM/IM interface not found in $PROTEUMIMHOME/interface"
	echo "Install it or run Proteum through the command line"
fi


