from flask import render_template
from homestay import app

@app.route('/')
def home():
    return render_template('home.html')
