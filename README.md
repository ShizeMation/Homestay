# Homestay
## Databases I Project: Home Rental System

#### Developers: Shize Li, Ann Soong
#### This is a school project. Any resemblance to actual businesses and/or organizations is purely coincidental.

### Setup (Windows):
1. Run a postgresql database with the following settings:
    ```
    host: localhost
    database: 'postgres'
    user: 'postgres'
    password: 'postgres'
    ```
2. Install Python 3.4 or above.
3. Clone this repository.
4. In the repository root folder, create a virtual environment:
    ```
    py -m venv env
    ```
5. Activate the virtual environment:
    ```
    env\Scripts\activate
    ```
6. Install Flask and psycopg2:
    ```
    pip install flask psycopg2
    ```
7. Navigate into the project folder:
    ```
    cd homestay
    ```
8. Make the database:
    ```
    py makedb.py
    ```
9. Run the server:
    ```
    py start.py
    ```
10. If it runs successfully, a URL will be given to you for accessing the web interface.

#### Note: you must activate the environment (step 5) before running the project or working on the project!
