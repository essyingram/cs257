#!/usr/bin/env python3
'''
    api.py
    Essy Ingram 20 April 2025

    Adapted from Jeff Ondich's flask_sample.py, 22 April 2016.
    template_sample.py taken from Professor Jeff Ondich's flask lab.
    HTML files for hello, help, and index adapted from Professor Jeff Ondich's flask lab.

'''
import sys
import argparse
import flask
import json
import csv

app = flask.Flask(__name__)

@app.route('/')
def hello():
    return 'Hello, visitor. Welcome to Harry Potter Wiki!'

@app.route('/alumni-from/<house>')
def get_alumni_from(house):
    ''' Returns the list of Harry Potter characters that match the user-specified Hogwarts house'''
    alumni = []
    house = house.lower()
    houses = {'gryffindor', 'hufflepuff', 'ravenclaw', 'slytherin'}
    if house in houses:
        with open('../data/characters1.csv') as f:
            reader = csv.reader(f, delimiter=';')
            for character_row in reader:
                actual_house = character_row[4].lower()
                if house == actual_house:
                    alum = character_row[1]
                    alumni.append(alum)
    return json.dumps(alumni)

@app.route('/help')
def get_help():
    return flask.render_template('help.html')

if __name__ == '__main__':
    parser = argparse.ArgumentParser('A sample Flask application/API')
    parser.add_argument('host', help='the host on which this application is running')
    parser.add_argument('port', type=int, help='the port on which this application is listening')
    arguments = parser.parse_args()
    app.run(host=arguments.host, port=arguments.port, debug=True)
