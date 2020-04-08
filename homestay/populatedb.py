from homestay.database import Database
import os, sys

def populatedb():
    with open(os.path.join(sys.path[0], 'inserts.sql')) as f:
        query = f.read()
    with Database() as db:
        db.execute(query)

if __name__ == "__main__":
    populatedb()
