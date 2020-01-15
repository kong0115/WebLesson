import os

from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker

engine = create_engine(os.getenv("DATABASE_URL"))
db = scoped_session(sessionmaker(bind=engine))

def main():

    #List all flights
    flights = db.execute("SELECT id, origin, destination, duration FROM flight ORDER BY id").fetchall()
    for flight in flights:
        print(f"Flight {flight.id}: {flight.origin} to {flight.destination}, {flight.duration} minutes.")

    #Prompt user to choose a flight
    flight_id = int(input("\nFlight ID: "))
    flight = db.execute("SELECT * FROM flight WHERE id = :id",
    {"id": flight_id}).fetchone()

    if flight is None:
        print("Error: No such flight.")
        return

    #List all passengers
    print("\nPassengers: ")
    passengers = db.execute("SELECT name FROM passenger WHERE flight_id = :flight_id", {"flight_id": flight_id}).fetchall()
    if len(passengers) == 0:
        print("No passengers.")
    else:
        for passenger in passengers:
            print(passenger.name)

if __name__ == "__main__":
    main()
