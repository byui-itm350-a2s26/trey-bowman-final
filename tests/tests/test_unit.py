import sqlite3
import os


DATABASE = "test_tasks.db"


def create_test_database():

    conn = sqlite3.connect(DATABASE)

    cursor = conn.cursor()

    cursor.execute("""
        CREATE TABLE IF NOT EXISTS tasks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            task TEXT NOT NULL,
            completed INTEGER DEFAULT 0
        )
    """)

    conn.commit()
    conn.close()


def test_database_creation():

    create_test_database()

    assert os.path.exists(DATABASE)


def test_add_task():

    create_test_database()

    conn = sqlite3.connect(DATABASE)

    cursor = conn.cursor()

    cursor.execute(
        "INSERT INTO tasks(task) VALUES(?)",
        ("Study Docker",)
    )

    conn.commit()

    cursor.execute(
        "SELECT task FROM tasks"
    )

    result = cursor.fetchone()

    conn.close()

    assert result[0] == "Study Docker"