from flask import render_template, request, redirect, url_for, session
from psycopg2 import IntegrityError
from homestay import app
from homestay.database import Database
from hashlib import pbkdf2_hmac
from os import urandom

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        guest_id = urandom(16).hex()
        first_name = request.form['first_name']
        last_name = request.form['last_name']
        street_address = request.form['street_address']
        city = request.form['city']
        state_province = request.form['state_province']
        country = request.form['country']
        email = request.form['email']
        phone = request.form['phone']
        salt = urandom(32)
        password_hash = pbkdf2_hmac(
            'sha256', bytes(request.form['password'], 'utf-8'),
            salt, 100000
        )
        try:
            with Database() as db:
                db.execute(
                    """
                    INSERT INTO homestay.guest VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);
                    """,
                    (guest_id, first_name, last_name, street_address,
                    city, state_province, country, email, phone,
                    password_hash.hex(), salt.hex())
                )
            return redirect(url_for('login'))
        except IntegrityError:
            return render_template('register.html', bad_input=True)
    else:
        return render_template('register.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if 'guest_id' in session:
        return redirect(url_for('profile'))
    if request.method == 'POST':
        email = request.form['email']
        with Database() as db:
            db.execute(
                """
                SELECT guest_id, password_hash, salt FROM homestay.guest WHERE (email = %s);
                """,
                (email,)
            )
            account = db.fetchone()
        if account is None:
            return render_template('login.html', wrong_email=True)
        salt = bytes.fromhex(account['salt'])
        req_pass_hash = pbkdf2_hmac(
            'sha256', bytes(request.form['password'], 'utf-8'),
            salt, 100000
        )
        if req_pass_hash.hex() == account['password_hash']:
            session['guest_id'] = account['guest_id']
            return redirect(url_for('profile'))
        else:
            return render_template('login.html', wrong_pass=True)
    else:
        return render_template('login.html')

@app.route('/profile', methods=['GET', 'POST'])
def profile():
    if request.method == 'POST':
        if 'logout' in request.form:
            session.pop('guest_id', None)
    if 'guest_id' in session:
        with Database() as db:
            db.execute(
                """
                SELECT first_name, last_name FROM homestay.guest WHERE (guest_id = %s);
                """,
                (session['guest_id'],)
            )
            account = db.fetchone()
        return render_template('profile.html',
            first_name = account['first_name'],
            last_name = account['last_name']
        )
    else:
        return redirect(url_for('login'))

@app.route('/listings', methods=['GET', 'POST'])
def listings():
    with Database() as db:
        db.execute(
            """
            SELECT property_id, max_guests, bed_type, about, street_address, city,
                state_province, country, available_date FROM homestay.property;
            """
        )
        properties = db.fetchall()
    if not properties:
        return render_template('listings.html', no_listings=True)
    return render_template('listings.html', listings=properties)

@app.route('/p/<property_id>', methods=['GET', 'POST'])
def property_page(property_id):
    with Database() as db:
        db.execute(
            """
            SELECT * FROM homestay.property WHERE (property_id = %s);
            """,
            (property_id,)
        )
        prop = db.fetchone()
        if prop is None:
            return render_template('property_page.html', not_found=True)
        db.execute(
            """
            SELECT first_name, last_name FROM homestay.host WHERE (host_id = %s);
            """,
            (prop['host_id'],)
        )
        host = db.fetchone()
        db.execute(
            """
            SELECT * FROM homestay.pricing WHERE (pricing_id = %s);
            """,
            (prop['pricing_id'],)
        )
        pricing = db.fetchone()
    return render_template('property_page.html', prop=prop, host=host, pricing=pricing)
