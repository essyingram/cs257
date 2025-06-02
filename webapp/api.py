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

    # Searches names of characters, then spells, then potions
    ilike_argument = '%' + search_text + '%'
    query = ''' SELECT given_name, surname
                FROM characters
                WHERE surname ILIKE %s
                OR given_name ILIKE %s 
                ORDER BY surname, given_name '''
    
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, (ilike_argument, ilike_argument))

        for row in cursor:
            character = {'given_name':row[0] if row[0] is not None else '',
                         'surname':row[1] if row[1] is not None else ''}
            characters_spells_potions.append(character)
            
        cursor.close()
        connection.close()

    except Exception as e:
        print(e, file=sys.stderr)

    query = ''' SELECT incantation, informal_name
                FROM spells
                WHERE incantation ILIKE %s
                OR informal_name ILIKE %s 
                ORDER BY incantation, informal_name '''
    
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, (ilike_argument, ilike_argument))

        for row in cursor:
            spell ={'incantation':row[0] if row[0] is not None else '',
                    'informal_name':row[1] if row[1] is not None else ''}
            characters_spells_potions.append(spell)
            
        cursor.close()
        connection.close()

    except Exception as e:
        print(e, file=sys.stderr)

    query = ''' SELECT name
                FROM potions
                WHERE name ILIKE %s
                ORDER BY name '''
    
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, (ilike_argument, ilike_argument))

        for row in cursor:
            potion ={'name':row[0] if row[0] is not None else ''}
            characters_spells_potions.append(potion)
            
        cursor.close()
        connection.close()

    except Exception as e:
        print(e, file=sys.stderr)

    return json.dumps(characters_spells_potions)


@api.route('/characters-spells/<search_text>')
def get_characters_spells(search_text):
    ''' Returns a list of characters and spells in our database that 
        match the search string. By default, the results are presented in 
        alphabetical order by name.
    '''
    characters_spells = []

    # Searches names of characters, then spells
    ilike_argument = '%' + search_text + '%'
    query = ''' SELECT given_name, surname
                FROM characters
                WHERE surname ILIKE %s
                OR given_name ILIKE %s 
                ORDER BY surname, given_name '''
    
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, (ilike_argument, ilike_argument))

        for row in cursor:
            character = {'given_name':row[0] if row[0] is not None else '',
                         'surname':row[1] if row[1] is not None else ''}
            characters_spells.append(character)
            
        cursor.close()
        connection.close()

    except Exception as e:
        print(e, file=sys.stderr)

    query = ''' SELECT incantation, informal_name
                FROM spells
                WHERE incantation ILIKE %s
                OR informal_name ILIKE %s 
                ORDER BY incantation, informal_name '''
    
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, (ilike_argument, ilike_argument))

        for row in cursor:
            spell ={'incantation':row[0] if row[0] is not None else '',
                    'informal_name':row[1] if row[1] is not None else ''}
            characters_spells.append(spell)
            
        cursor.close()
        connection.close()

    except Exception as e:
        print(e, file=sys.stderr)

    return json.dumps(characters_spells)


@api.route('/characters-potions/<search_text>')
def get_characters_potions(search_text):
    ''' Returns a list of characters and potions in our database that 
        match the search string. By default, the results are presented in 
        alphabetical order by name.
    '''
    characters_potions = []

    # Searches names of characters, then potions
    ilike_argument = '%' + search_text + '%'
    query = ''' SELECT given_name, surname
                FROM characters
                WHERE surname ILIKE %s
                OR given_name ILIKE %s 
                ORDER BY surname, given_name '''
    
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, (ilike_argument, ilike_argument))

        for row in cursor:
            character = {'given_name':row[0] if row[0] is not None else '',
                         'surname':row[1] if row[1] is not None else ''}
            characters_potions.append(character)
            
        cursor.close()
        connection.close()

    except Exception as e:
        print(e, file=sys.stderr)

    query = ''' SELECT name
                FROM potions
                WHERE name ILIKE %s
                ORDER BY name '''
    
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, (ilike_argument, ilike_argument))

        for row in cursor:
            potion ={'name':row[0] if row[0] is not None else ''}
            characters_potions.append(potion)
            
        cursor.close()
        connection.close()

    except Exception as e:
        print(e, file=sys.stderr)

    return json.dumps(characters_potions)


@api.route('/spells-potions/<search_text>')
def get_spells_potions(search_text):
    ''' Returns a list of spells and potions in our database that 
        match the search string. By default, the results are presented in 
        alphabetical order by name.
    '''
    spells_potions = []

    # Searches names of spells, then potions
    ilike_argument = '%' + search_text + '%'
    query = ''' SELECT incantation, informal_name
                FROM spells
                WHERE incantation ILIKE %s
                OR informal_name ILIKE %s 
                ORDER BY incantation, informal_name '''
    
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, (ilike_argument, ilike_argument))

        for row in cursor:
            spell ={'incantation':row[0] if row[0] is not None else '',
                    'informal_name':row[1] if row[1] is not None else ''}
            spells_potions.append(spell)
            
        cursor.close()
        connection.close()

    except Exception as e:
        print(e, file=sys.stderr)

    query = ''' SELECT name
                FROM potions
                WHERE name ILIKE %s
                ORDER BY name '''
    
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, (ilike_argument, ilike_argument))

        for row in cursor:
            potion ={'name':row[0] if row[0] is not None else ''}
            spells_potions.append(potion)
            
        cursor.close()
        connection.close()

    except Exception as e:
        print(e, file=sys.stderr)

    return json.dumps(spells_potions)


@api.route('/characters/<search_text>')
def get_characters(search_text):
    ''' Returns a list of characters in our database that 
        match the search string. By default, the results are presented in 
        alphabetical order by surname, then given_name.
    '''
    characters_potions = []

    # Searches names of characters
    ilike_argument = '%' + search_text + '%'
    query = ''' SELECT given_name, surname
                FROM characters
                WHERE surname ILIKE %s
                OR given_name ILIKE %s 
                ORDER BY surname, given_name '''
    
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, (ilike_argument, ilike_argument))

        for row in cursor:
            character = {'given_name':row[0] if row[0] is not None else '',
                         'surname':row[1] if row[1] is not None else ''}
            characters_potions.append(character)
            
        cursor.close()
        connection.close()

    except Exception as e:
        print(e, file=sys.stderr)

    return json.dumps(characters_potions)



@api.route('/spells/<search_text>')
def get_spells(search_text):
    ''' Returns a list of spells in our database that 
        match the search string. By default, the results are presented in 
        alphabetical order.
    '''
    spells = []

    # Searches names of spells
    ilike_argument = '%' + search_text + '%'
    query = ''' SELECT incantation, informal_name
                FROM spells
                WHERE incantation ILIKE %s
                OR informal_name ILIKE %s 
                ORDER BY incantation, informal_name '''
    
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, (ilike_argument, ilike_argument))

        for row in cursor:
            spell ={'incantation':row[0] if row[0] is not None else '',
                    'informal_name':row[1] if row[1] is not None else ''}
            spells.append(spell)
            
        cursor.close()
        connection.close()

    except Exception as e:
        print(e, file=sys.stderr)

    return json.dumps(spells)



@api.route('/potions/<search_text>')
def get_potions(search_text):
    ''' Returns a list of potions in our database that 
        match the search string. By default, the results are presented in 
        alphabetical order.
    '''
    potions = []

    # Searches names of potions
    ilike_argument = '%' + search_text + '%'
    query = ''' SELECT name
                FROM potions
                WHERE name ILIKE %s
                ORDER BY name '''
    
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query, (ilike_argument, ilike_argument))

        for row in cursor:
            potion ={'name':row[0] if row[0] is not None else ''}
            potions.append(potion)
            
        cursor.close()
        connection.close()

    except Exception as e:
        print(e, file=sys.stderr)

    return json.dumps(potions)
