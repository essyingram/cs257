#!/usr/bin/env python3
'''
    api.py
    Essy Ingram 20 April 2025, 10 May 2025

    Adapted from Jeff Ondich's flask_sample.py, psycopg2-sample.py

    Tiny Flask API to support Harry Potter characters web application.
'''
import sys
import flask
import json
import psycopg2
import config

api = flask.Blueprint('api', __name__)

def get_connection():
    ''' Returns a database connection object with which you can create cursors,
        issue SQL queries, etc.'''
    return psycopg2.connect(database=config.database,
                            user=config.user,
                            password=config.password)

@api.route('/characters-spells-potions/<search_text>')
def get_characters_spells_potions(search_text):
    ''' Returns a list of characters, spells, and potions in our database that 
        match the search string. By default, the results are presented in 
        alphabetical order by name.
    '''
    characters_spells_potions = []
    characters_spells_potions = characters_query_helper(search_text, characters_spells_potions)
    characters_spells_potions = spells_query_helper(search_text, characters_spells_potions)
    characters_spells_potions = potions_query_helper(search_text, characters_spells_potions)

    return json.dumps(characters_spells_potions)

@api.route('/characters-spells/<search_text>')
def get_characters_spells(search_text):
    ''' Returns a list of characters and spells in our database that 
        match the search string. By default, the results are presented in 
        alphabetical order by name.
    '''
    characters_spells = []
    characters_spells = characters_query_helper(search_text, characters_spells)
    characters_spells = spells_query_helper(search_text, characters_spells)
    
    return json.dumps(characters_spells)

@api.route('/characters-potions/<search_text>')
def get_characters_potions(search_text):
    ''' Returns a list of characters and potions in our database that 
        match the search string. By default, the results are presented in 
        alphabetical order by name.
    '''
    characters_potions = []
    characters_potions = characters_query_helper(search_text, characters_potions)
    characters_potions = potions_query_helper(search_text, characters_potions)
    
    return json.dumps(characters_potions)

@api.route('/spells-potions/<search_text>')
def get_spells_potions(search_text):
    ''' Returns a list of spells and potions in our database that 
        match the search string. By default, the results are presented in 
        alphabetical order by name.
    '''
    spells_potions = []
    spells_potions = spells_query_helper(search_text, spells_potions)
    spells_potions = potions_query_helper(search_text, spells_potions)

    return json.dumps(spells_potions)

@api.route('/characters/<search_text>')
def get_characters(search_text):
    ''' Returns a list of characters in our database that 
        match the search string. By default, the results are presented in 
        alphabetical order by surname, then given_name.
    '''
    characters = []
    characters = characters_query_helper(search_text, characters)

    return json.dumps(characters)

@api.route('/spells/<search_text>')
def get_spells(search_text):
    ''' Returns a list of spells in our database that 
        match the search string. By default, the results are presented in 
        alphabetical order.
    '''
    spells = []
    spells = spells_query_helper(search_text, spells)

    return json.dumps(spells)

@api.route('/potions/<search_text>')
def get_potions(search_text):
    ''' Returns a list of potions in our database that 
        match the search string. By default, the results are presented in 
        alphabetical order.
    '''
    potions = []
    potions = potions_query_helper(search_text, potions)

    return json.dumps(potions)

def characters_query_helper(search_text, dictList):
    ''' This helper function queries the database for a list 
    of characters that match the user's search string. 
    Appends matching dictionarys to the given list of dictionaries and returns it.
    '''
    # Searches names of characters for matches
    ilike_argument = '%' + search_text + '%'
    query = ''' SELECT id, given_name, surname, species, gender, hair_color, eye_color, house, blood_status, wand, patronus, skills
                FROM characters
                WHERE surname ILIKE %s
                OR given_name ILIKE %s 
                ORDER BY surname, given_name '''
    
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, (ilike_argument, ilike_argument))

        for row in cursor:
            character = {'id': row[0],
                         'given_name':row[1] if row[1] is not None else '',
                         'surname':row[2] if row[2] is not None else '',
                         'species':row[3] if row[3] is not None else '',
                         'gender':row[4] if row[4] is not None else '',
                         'hair_color':row[5] if row[5] is not None else '',
                         'eye_color':row[6] if row[6] is not None else '',
                         'house':row[7] if row[7] is not None else '',
                         'blood_status':row[8] if row[8] is not None else '',
                         'wand':row[9] if row[9] is not None else '',
                         'patronus':row[10] if row[10] is not None else '',
                         'skills':row[11] if row[11] is not None else ''}
            dictList.append(character)
            
        cursor.close()
        connection.close()

    except Exception as e:
        print(e, file=sys.stderr)

    # returns updated dictionary list
    return dictList

def spells_query_helper(search_text, dictList):
    ''' This helper function queries the database for a list 
    of spells that match the user's search string. 
    Appends matching dictionarys to the given list of dictionaries and returns it.
    '''
    # Searches names of spells for matches
    ilike_argument = '%' + search_text + '%'
    query = ''' SELECT id, incantation, informal_name, type, effect, light
                FROM spells
                WHERE incantation ILIKE %s
                OR informal_name ILIKE %s 
                ORDER BY incantation, informal_name '''
    
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, (ilike_argument, ilike_argument))

        for row in cursor:
            spell ={'id':row[0],
                    'incantation':row[1] if row[1] is not None else '',
                    'informal_name':row[2] if row[2] is not None else '',
                    'type':row[3] if row[3] is not None else '',
                    'effect':row[4] if row[4] is not None else '',
                    'light':row[5] if row[5] is not None else ''}
            dictList.append(spell)
            
        cursor.close()
        connection.close()

    except Exception as e:
        print(e, file=sys.stderr)

    # returns updated dictionary list
    return dictList

def potions_query_helper(search_text, dictList):
    ''' This helper function queries the database for a list 
    of potions that match the user's search string. 
    Appends matching dictionaries to the given list of dictionaries and returns it.
    '''
    # Searches names of potions for matches
    ilike_argument = '%' + search_text + '%'
    query = ''' SELECT id, name, effect, known_ingredients, difficulty
                FROM potions
                WHERE name ILIKE %s
                ORDER BY name '''
    
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, (ilike_argument,))

        for row in cursor:
            potion ={'id':row[0],
                     'name':row[1] if row[1] is not None else '',
                     'effect':row[2] if row[2] is not None else '',
                     'known_ingredients':row[3] if row[3] is not None else '',
                     'difficulty':row[4] if row[4] is not None else ''}
            dictList.append(potion)
            
        cursor.close()
        connection.close()

    except Exception as e:
        print(e, file=sys.stderr)

    # returns updated dictionary list
    return dictList