from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def index():
    string = "Hello!"
    return render_template("index_with_variable.html", headline = string)

@app.route("/bye")
def bye():
    string = "Goodbye!"
    return render_template("index_with_variable.html", headline = string)
