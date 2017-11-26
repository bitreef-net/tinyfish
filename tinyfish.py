from time import gmtime, strftime

from flask import Flask

app = Flask(__name__)

def get_date():
	return strftime("%A, %B %d, %Y", gmtime())

@app.route("/")
def hello():
	return "Hello World on this date {}.".format(get_date())

if __name__ == '__main__':
    app.run(host='0.0.0.0')
