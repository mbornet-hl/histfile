/*
 * Copyright (C) 2019, Martial Bornet
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 *	@(#)	[MB] de_ts_to_date.l	Version 1.3 du 19/11/03 - 
 *
 */

%{
#include	<stdio.h>
#include	<time.h>

int			ts_displayed			= 0;

%}

timestamp		(#[0-9]{10}\n)
cmd			([^#\n][^\n]*\n)

%%

{timestamp}	{
				time_t			 _ts;
				struct tm			*_tm;

				if (ts_displayed) {
					printf("\n");
				}

				_ts				=  atol(yytext + 1);
				_tm				= localtime(&_ts);
				printf("%04d-%02d-%02d %02d:%02d:%02d ",
				       _tm->tm_year + 1900,
					  _tm->tm_mon + 1,
					  _tm->tm_mday,
					  _tm->tm_hour,
					  _tm->tm_min,
					  _tm->tm_sec);

				ts_displayed		= 1;
			}

{cmd}		{
				printf("%s", yytext);
				ts_displayed		= 0;
			}

\n			{
				printf("\n");
				ts_displayed		= 0;
			}

%%

/******************************************************************************

					MAIN

******************************************************************************/
int main(int argc, char *argv[])
{
	int				 _i;
	FILE				*_fp;

	if (argc > 1) {
		for (_i = 1; _i < argc; _i++) {
			if (access(argv[_i], 0) == 0) {
				if ((_fp = fopen(argv[_i], "r")) == 0) {
					fprintf(stderr, "%s: cannot open \"%s\" !\n",
						   argv[0], argv[_i]);
				}
				else {
					// fprintf(stderr, "Opening \"%s\" ...\n", argv[_i]);
					yyrestart(_fp);
					yylex();
				}
			}
			else {
				fprintf(stderr, "%s: cannot access \"%s\" !\n",
					   argv[0], argv[_i]);
			}
		}
	}
	else {
		yylex();
	}

	return 0;
}

/******************************************************************************

					YYWRAP

******************************************************************************/
int yywrap()
{
	return 1;
}

/******************************************************************************

					REMOVE_WARN_UNUSED

******************************************************************************/
static void remove_warn_unused(int always_false)
{
	if (always_false == 1) {
		yyunput(0, 0);
		input();
	}
}

/******************************************************************************

					YYERROR

******************************************************************************/
void yyerror(char *errmsg)
{
	fprintf(stderr, "Parser error : %s !\n", errmsg);
	remove_warn_unused(0);
	exit(1);
}
