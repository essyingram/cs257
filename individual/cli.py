'''
cli.py
Essy Ingram, 17 April 2025
Adapted from sample code provided by Professor Ondich

NAME: cli.py - command-line interface exercise
SYNOPSIS: python3 cli.py hogwartshouse
DESCRIPTION: Shows a list of the names of all of the people belonging
to the specified hogwartshouse string from the Harry Potter series, case-insensitively.
'''

import csv
import argparse

def get_parsed_arguments():
    parser = argparse.ArgumentParser(description='Lists the Harry Potter characters who belong to a user-specified Hogwarts House.')
    parser.add_argument('house', help='A Hogwarts house whose members you wish to identify')
    return parser.parse_args()

def main():
    arguments = get_parsed_arguments()
    house = arguments.house.lower()
    houses = {'gryffindor', 'hufflepuff', 'ravenclaw', 'slytherin'}
    
    if house in houses:
        with open('../data/characters1.csv') as f:
            reader = csv.reader(f, delimiter=';')
            for character_row in reader:
                actual_house = character_row[4].lower()
                if house == actual_house:
                    name = character_row[1]
                    print(name)
    else:
        print("The house you have entered does not exist in the Harry Potter universe.")

if __name__ == '__main__':
    main()