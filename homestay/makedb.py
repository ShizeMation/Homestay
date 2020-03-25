from homestay.database import Database

def makedb():
    with Database() as db:
        db.execute(
            """
            DROP TABLE IF EXISTS TestTable;
            """
        )
        db.execute(
            """
            CREATE TABLE TestTable (
                test_id int PRIMARY KEY,
                test_txt text,
                test_bl bool
            );
            """
        )
        db.execute(
            """
            INSERT INTO TestTable VALUES (%s, %s, %s);
            INSERT INTO TestTable VALUES (%s, %s, %s);
            """,
            (212, "crow", False, 556, "squid", True)
        )

if __name__ == "__main__":
    makedb()
