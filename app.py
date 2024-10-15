import os
import psycopg2

# Establish connection using environment variables from .env file
def get_db_connection():
    connection = psycopg2.connect(
        host=os.getenv("DB_HOST"),
        port=os.getenv("DB_PORT"),
        database=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD")
    )
    return connection

# Example query to test the connection
def test_connection():
    try:
        connection = get_db_connection()
        cursor = connection.cursor()

        # Print PostgreSQL version to verify the connection
        cursor.execute("SELECT version();")
        print(cursor.fetchone())

        # Run initialization SQL file (init.sql)
        with open('init-db/init.sql', 'r') as f:
            cursor.execute(f.read())
            connection.commit()

        cursor.close()
        connection.close()

    except Exception as e:
        print(f"Error connecting to the database: {e}")

if __name__ == "__main__":
    test_connection()
