import psycopg2

class Database:
    def __init__(self):
        self.conn = psycopg2.connect(
            database = 'postgres',
            user = 'postgres',
            password = 'postgres',
            host = 'localhost',
        )
        self.cur = self.conn.cursor()
    
    def __enter__(self):
        return self.cur
    
    def __exit__(self, type, val, trace):
        if trace is None:
            self.conn.commit()
        self.cur.close()
        self.conn.close()
