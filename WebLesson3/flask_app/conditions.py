import datetime

from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
def index():
    currentDate = datetime.datetime.now()
    is_New_Year = currentDate.month == 1 and currentDate.day == 1
    return render_template("index_with_condition.html", is_New_Year = is_New_Year)
