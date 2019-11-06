#
#	@(#)	[MB] de_Makefile	Version 1.3 du 19/11/04 - 
#

CC			= gcc
CFLAGS		= -Werror -Wall
LEX			= lex

all			: hY hm hW hD hH hM ts_to_date

hY			: hist_colorize
			ln -s hist_colorize hY

hm			: hist_colorize
			ln -s hist_colorize hm

hW			: hist_colorize
			ln -s hist_colorize hW

hD			: hist_colorize
			ln -s hist_colorize hD

hH			: hist_colorize
			ln -s hist_colorize hH

hM			: hist_colorize
			ln -s hist_colorize hM

ts_to_date	: ts_to_date.l
			$(LEX) -t ts_to_date.l > ts_to_date.c
			$(CC) $(CFLAGS) -c -o ts_to_date.o ts_to_date.c
			$(CC) ts_to_date.o -o ts_to_date
			rm ts_to_date.[co]
			strip ts_to_date
