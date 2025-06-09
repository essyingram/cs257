'''
    app.py
    Essy Ingram, 20 May 2025

    A small Flask application that provides a website 
    with a tiny API to support the website.
'''
import flask
import argparse
import api

app = flask.Flask(__name__, static_folder='static', template_folder='templates')
app.register_blueprint(api.api, url_prefix='/api')

# Route to home!
@app.route('/') 
def home():
    return flask.render_template('index.html')

# Help page for endpoint examples
@app.route('/api/help')
def help():
    return flask.render_template('help.html')

if __name__ == '__main__':
    parser = argparse.ArgumentParser('A Harry Potter web application')
    parser.add_argument('host', help='the host to run on')
    parser.add_argument('port', type=int, help='the port to listen on')
    arguments = parser.parse_args()
    app.run(host=arguments.host, port=arguments.port, debug=True)