import sqlite3
import pandas as pd
import matplotlib as mpl

def get_connection(db_path="orders.db"):
    """
    Establish a connection to the SQLite database.
    Returns a connection object.
    """
    conn=sqlite3.connect(db_path)
    conn.row_factory=sqlite3.Row
    return conn

def task_1(db):
    cursor=db.execute("SELECT category FROM products GROUP BY category;")
    for row in cursor:
        print(row[0])

def task_2(db):
    row=db.execute("SELECT COUNT(customer_id) FROM customers;").fetchone()
    print(f"Total number of customers: {row[0]}")

def task_3(db,email):
    sql="SELECT order_id,order_date,status,total_amount FROM orders JOIN customers ON orders.customer_id=customers.customer_id WHERE customers.email=?;"
    cursor=db.execute(sql,(email,))
    for row in cursor:
        order_id,order_date,status,total_amount=row[0],row[1],row[2],row[3]
        print(f"Order\n\tID: {order_id}\n\tDate: {order_date}\n\tStatus: {status}\n\tAmount: {total_amount}")

def main():
    db=get_connection()
    task_1(db)
    task_2(db)
    task_3(db,r"lmartin@example.com")
    db.close()


if __name__=="__main__":
    main()
