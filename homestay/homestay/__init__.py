from flask import Flask
import psycopg2

app = Flask(__name__)

conn = psycopg2.connect(
    database = 'postgres',
    user = 'postgres',
    password = 'postgres',
    host = 'localhost',
)
