#!/usr/bin/env python3
'''
    api.py
    Essy Ingram 20 April 2025, 10 May 2025

    extend() list method found at https://www.geeksforgeeks.org/append-extend-python/

    Adapted from Jeff Ondich's flask_sample.py, psycopg2-sample.py
'''
import sys
import argparse
import flask

import psycopg2
import config

app = flask.Flask(__name__)

def get_connection():
    ''' Returns a database connection object with which you can create cursors,
        issue SQL queries, etc. This function is extremely aggressive about
        failed connections--it just prints an error message and kills the whole
        program. Sometimes that's the right choice, but it depends on your
        error-handling needs. '''
    try:
        return psycopg2.connect(database=config.database,
                                user=config.user,
                                password=config.password)
    except Exception as e:
        print(e, file=sys.stderr)
        exit()

@app.route('/')
def hello():
    return 'Hello, visitor. Welcome to Harry Potter Wiki!'

@app.route('/help')
def get_help():
    return flask.render_template('help.html')

@app.route('/characters')
def get_characters():
    ''' Returns the list of characters in the database that match GET parameters:
            search_text, text: reject any character whose given name or surname
                does not match the specified string (case insensitively)
            house, text: reject any character whose house does not match the
                specified house
            gender, text: reject any characters who don't belong to the 
                specified gender
            limit, int: limit output of the specified number of characters
        
        If a GET parameter is absent, then any character is treated as though
        it meets the corresponding constraint.
        
        Each character is represented by a dictionary with keys "given_name"
        and "surname". '''
    
    characters = []
    search_text = flask.request.args.get('search_text')
    house = flask.request.args.get('house')
    gender = flask.request.args.get('gender')
    limit = flask.request.args.get('limit', default=145, type=int)

    try:
        connection = get_connection()
        cursor = connection.cursor()

        query = "SELECT given_name, surname FROM characters"
        where = False
        
        params = []
        if search_text:
            if not where:
                query += " WHERE"
                where = True
            else:
                query += " AND"
            query += " surname ILIKE CONCAT('%%', %s, '%%') OR given_name ILIKE CONCAT('%%', %s, '%%')"
            params.extend([search_text, search_text])

        if house:
            if not where:
                query += " WHERE"
                where = True
            else:
                query += " AND"
            query += " house ILIKE %s"
            params.append(house)

        if gender:
            if not where:
                query += " WHERE"
                where = True
            else:
                query += " AND"
            query += " gender ILIKE %s"
            params.append(house)

        query += " ORDER BY surname, given_name"

        if limit:
            query += " LIMIT %s"
            params.append(limit)

        cursor.execute(query, params)

        for row in cursor:
            characters.append({'given_name':row[0], 'surname':row[1]})
            

    except Exception as e:
        print(e, file=sys.stderr)

    connection.close()
    return characters      # Returns a list of dictionaries representing characters
    
@app.route('/spells')
def get_spells():
    ''' Returns a list of all the spells in the database that match GET parameters, 
        ordered by incantation name.

        search_text, text: reject any spell whose incantation or name does not contain 
            the search string
        type, text: reject any spell that does not match the specified type
            (e.g. hex, jinx, curse, etc.)
        limit, int: limit output of the specified number of spells

        Each spell is represented by a dictionary with keys "informal_name",
        "incancation", "type" and "effect". '''
    
    spells = []
    search_text = flask.request.args.get('search_text')
    type = flask.request.args.get('type')
    limit = flask.request.args.get('limit', default=500, type=int)

    try:
        connection = get_connection()
        cursor = connection.cursor()

        query = "SELECT informal_name, incantation, type, effect FROM spells"
        where = False
        
        params = []
        if search_text:
            if not where:
                query += " WHERE"
                where = True
            else:
                query += " AND"
            query += " informal_name ILIKE CONCAT('%%', %s, '%%') OR incantation ILIKE CONCAT('%%', %s, '%%')"
            params.extend([search_text, search_text])

        if type:
            if not where:
                query += " WHERE"
                where = True
            else:
                query += " AND"
            query += " type ILIKE %s"
            params.append(type)

        query += " ORDER BY incantation, informal_name"

        if limit:
            query += " LIMIT %s"
            params.append(limit)

        cursor.execute(query, params)

        for row in cursor:
            spells.append({'informal_name':row[0], 'incantation':row[1], 'type':row[2], 'effect':row[3]})
            

    except Exception as e:
        print(e, file=sys.stderr)

    connection.close()
    return spells      # Returns a list of dictionaries representing spells
    
@app.route('/potions')
def get_potions():
    ''' Returns a list of all the potions in the database that match GET parameters, 
        ordered by potion name.

        search_text, text: reject any potion whose name or effect does not contain the search string
        limit, int: limit output of the specified number of potions

        Each potion is represented by a dictionary with keys "name", "effect", and "known_ingredients". '''
    
    potions = []
    search_text = flask.request.args.get('search_text')
    limit = flask.request.args.get('limit', default=500, type=int)

    try:
        connection = get_connection()
        cursor = connection.cursor()

        query = "SELECT name, effect, known_ingredients FROM potions"
        where = False
        
        params = []
        if search_text:
            if not where:
                query += " WHERE"
                where = True
            else:
                query += " AND"
            query += " name ILIKE CONCAT('%%', %s, '%%') OR effect ILIKE CONCAT('%%', %s, '%%')"
            params.extend([search_text, search_text])

        query += " ORDER BY name, effect"

        if limit:
            query += " LIMIT %s"
            params.append(limit)

        cursor.execute(query, params)

        for row in cursor:
            potions.append({'name':row[0], 'effect':row[1], 'known_ingredients':row[2]})
            

    except Exception as e:
        print(e, file=sys.stderr)

    connection.close()
    return potions      # Returns a list of dictionaries representing potions


if __name__ == '__main__':
    parser = argparse.ArgumentParser('Essy Ingram\'s API implementation')
    parser.add_argument('host', help='the host on which this application is running')
    parser.add_argument('port', type=int, help='the port on which this application is listening')
    arguments = parser.parse_args()
    app.run(host=arguments.host, port=arguments.port, debug=True)
