#!/usr/bin/env python3
'''
    convert.py
    Essy Ingram, 25 April,

    Adapted from Jeff Ondich's csv2tables.py
    Used split() method found at: https://www.geeksforgeeks.org/python-print-the-last-word-in-a-sentence/

    This program converts three CSVs with the formats

        full-name,species,gender,hair-color,eye-color,hogwarts-house,occupation,blood-status,wand,patronus,skills
        
        informal_name,incantation,type,effect,light

        name,known-ingredients,effect,qualitative-traits,difficulty

    into CSV files with the following formats, respectively:

        characters.csv: id,surname,given_name,species,gender,hair_color,eye_color,house,occupation,blood_status,wand,patronus,skills
        
        spells.csv: id,informal_name,incantation,type,effect,light

        potions.csv: id,name,known_ingredients,effect,qualitative_traits,difficulty
'''

import sys
import csv

def main(input_file_name1,input_file_name2,input_file_name3):
    # Collect the data and assign ids to characters, spells and potions
    characters = {}
    spells = {}
    potions = {}

    with open(input_file_name1) as f:
        reader = csv.reader(f)
        for character_row in reader:
            full_name = character_row[0]    # Separate given names and surnames
            if len(full_name.split()) == 1:
                surname = 'NULL'
                given_name = full_name
            else:
                surname = full_name.split()[-1]
                given_name = ' '.join(full_name.split()[:-1])
            species = character_row[1]
            gender = character_row[2]
            hair_color = character_row[3] if character_row[3] else 'NULL'
            eye_color = character_row[4] if character_row[4] else 'NULL'
            house = character_row[5] if character_row[5] else 'NULL'
            occupation = character_row[6] if character_row[6] else 'NULL'
            blood_status = character_row[7] if character_row[7] else 'NULL'
            wand = character_row[8] if character_row[8] else 'NULL'
            patronus = character_row[9] if character_row[9] else 'NULL'
            skills = character_row[10] if character_row[10] else 'NULL'
            character_key = f'{surname}+{given_name}'
            
            characters[character_key] = {'id': len(characters),
                                         'surname': surname,
                                         'given_name': given_name,
                                         'species': species,
                                         'gender': gender,
                                         'hair_color': hair_color,
                                         'eye_color': eye_color,
                                         'house': house,
                                         'occupation': occupation,
                                         'blood_status': blood_status,
                                         'wand': wand,
                                         'patronus': patronus,
                                         'skills': skills}

    with open(input_file_name2) as f:
        reader = csv.reader(f)
        for spell_row in reader:
            informal_name = spell_row[0]
            incantation = spell_row[1] if spell_row[1] else 'NULL'
            type = spell_row[2]
            effect = spell_row[3] if spell_row[3] else 'NULL'
            light = spell_row[4] if spell_row[4] else 'NULL'
            spell_key = f'{incantation}+{informal_name}'
            
            spells[spell_key] = {'id': len(spells),
                                 'informal_name': informal_name,
                                 'incantation': incantation,
                                 'type': type,
                                 'effect': effect,
                                 'light': light}
            
    with open(input_file_name3) as f:
        reader = csv.reader(f)
        for potion_row in reader:
            name = potion_row[0]
            known_ingredients = potion_row[1] if potion_row[1] else 'NULL'
            effect = potion_row[2] if potion_row[2] else 'NULL'
            qualitative_traits = potion_row[3] if potion_row[3] else 'NULL'
            difficulty = potion_row[4] if potion_row[4] else 'NULL'
            potion_key = f'{name}'

            potions[potion_key] = {'id': len(potions),
                                   'name': name,
                                   'known_ingredients': known_ingredients,
                                   'effect': effect,
                                   'qualitative_traits': qualitative_traits,
                                   'difficulty': difficulty}

    # Write to the table files
    with open('characters.csv', 'w') as f:
        writer = csv.writer(f)
        for character_key in characters:
            character = characters[character_key]
            row = (character['id'], character['surname'], character['given_name'], character['species'], character['gender'], character['hair_color'], character['eye_color'], character['house'], character['occupation'], character['blood_status'], character['wand'], character['patronus'], character['skills'])
            writer.writerow(row)

    with open('spells.csv', 'w') as f:
        writer = csv.writer(f)
        for spell_key in spells:
            spell = spells[spell_key]
            row = (spell['id'], spell['informal_name'], spell['incantation'], spell['type'], spell['effect'], spell['light'])
            writer.writerow(row)

    with open('potions.csv', 'w') as f:
        writer = csv.writer(f)
        for potion_key in potions:
            potion = potions[potion_key]
            row = (potion['id'], potion['name'], potion['known_ingredients'], potion['effect'], potion['qualitative_traits'], potion['difficulty'])
            writer.writerow(row)

if len(sys.argv) != 4:
    print(f'Usage: {sys.argv[0]} character_csv_file spell_csv_file potion_csv_file', file=sys.stderr)
    exit()

main(sys.argv[1])
