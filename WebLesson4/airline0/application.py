import os

from flask import Flask, render_template, request
from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker

app = Flask(__name__)

engine = create_engine(os.getenv("DATABASE_URL"))
db = scoped_session(sessionmaker(bind=engine))

@app.route("/")
def index():
    flights = db.execute("SELECT * FROM flight").fetchall()
    return render_template("index.html", flights=flights)

@app.route("/book", methods=["POST"])
def book():
    """Book a flight."""

    # Get form information.
    try:
        flight_id = int(request.form.get("flight_id"))
    except ValueError:
        return render_template("error.html", message="Invalid flight number.")

    # Make sure the flight exists.
    if db.execute("SELECT * FROM flight WHERE id = :flight_id", {"flight_id":flight_id}).rowcount == 0:
        return render_template("error.html", message="No such flight with that id.")

    name = request.form.get("name")
    db.execute("INSERT INTO passenger (name, flight_id) VALUES (:name, :flight_id)",
        {"name":name, "flight_id":flight_id})
    db.commit()
    return render_template("success.html")
