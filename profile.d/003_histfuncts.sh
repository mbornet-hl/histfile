#!/bin/bash
#
# Copyright (C) 2019, Martial Bornet
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#	@(#)	[MB] de_003_histfuncts.sh	Version 1.2 du 20/07/31 - 
#

# Generic function to call history colorization scripts
generic_hist()
{
	if [ "$1" = "" ]; then
		echo "This function should not be called without a meaningful argument !"
	else
		func="$1"
		shift

		if [ "$1" = "" ]; then
			history | command "$func"
		else
			command "$func" "$@"
		fi
	fi
}

# History colorized by year
hY()
{
	generic_hist hY "$@"
}

# History colorized by month
hm()
{
	generic_hist hm "$@"
}

# History colorized by week
hW()
{
	generic_hist hW "$@"
}

# History colorized by day
hD()
{
	generic_hist hD "$@"
}

# History colorized by hour
hH()
{
	generic_hist hH "$@"
}

# History colorized by minute
hM()
{
	generic_hist hM "$@"
}

hYg()
{
	hY ~/.hist* | grep "$1"
}

hmg()
{
	hm ~/.hist* | grep "$1"
}

hWg()
{
	hW ~/.hist* | grep "$1"
}

hDg()
{
	hD ~/.hist* | grep "$1"
}

hHg()
{
	hH ~/.hist* | grep "$1"
}

hMg()
{
	hM ~/.hist* | grep "$1"
}
