'''
	cli.py
	Essy Ingram, 17 April 2025
	
	NAME: cli.py - command-line interface exercise
	SYNOPSIS: python3 cli.py booksby authorname
	DESCRIPTION: Shows a list of the titles of all the books written by any
	author whose name contains the specified authorname string, case-insensitively.
'''

import sys

for index, argument in enumerate(sys.argv):
    print(f'{index}: /{argument}/')
