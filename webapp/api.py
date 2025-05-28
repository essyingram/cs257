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

@api.route('/characters/')
def get_characters():
    ''' Returns a list of all the characters in our database. See
        get_author_by_id below for description of the author
        resource representation.

        By default, the list is presented in alphabetical order
        by surname, then given_name.
    '''

    query =  '''SELECT given_name, surname, house FROM characters
                ORDER BY surname, given_name'''
    
    characters = []
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query)
        for row in cursor:
            character = {'given_name':row[0],
                         'surname':row[1],
                         'house':row[2]}
            characters.append(character)
        cursor.close()
        connection.close()
    except Exception as e:
        print(e, file=sys.stderr)

    return json.dumps(characters)


@api.route('/spells/')
def get_spells():
    ''' Returns a list of all the spells in the database 
        ordered by incantation name.'''

    query =  '''SELECT informal_name, incantation, type, effect FROM spells'''
    
    spells = []
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query)
        for row in cursor:
            spells.append({'informal_name':row[0],
                           'incantation':row[1],
                           'type':row[2],
                           'effect':row[3]})
        cursor.close()
        connection.close()
    except Exception as e:
        print(e, file=sys.stderr)

    return json.dumps(spells)
    
@api.route('/potions/')
def get_potions():
    ''' Returns a list of all the potions in the database that match GET parameters, 
        ordered by potion name.'''

    query = "SELECT name, effect, known_ingredients FROM potions"
    
    potions = []
    
    try:
        connection = get_connection()
        cursor = connection.cursor()
        cursor.execute(query)
        for row in cursor:
            potions.append({'name':row[0],
                            'effect':row[1],
                            'known_ingredients':row[2]})

        cursor.close()
        connection.close()
    except Exception as e:
        print(e, file=sys.stderr)

    return json.dumps(potions)