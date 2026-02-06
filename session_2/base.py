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
    sql="SELECT order_id, order_date, status, total_amount FROM orders JOIN customers ON orders.customer_id=customers.customer_id WHERE customers.email=?;"
    cursor=db.execute(sql,(email,))
    for row in cursor:
        order_id,order_date,status,total_amount=row[0],row[1],row[2],row[3]
        print(f"Order\n\tID: {order_id}\n\tDate: {order_date}\n\tStatus: {status}\n\tAmount: {total_amount}")

def task_4(db):
    cursor=db.execute("SELECT product_id, name, category, price FROM products WHERE price<2;")
    for row in cursor:
        product_id,name,category,price=row[0],row[1],row[2],row[3]
        print(f"Product\n\tID: {product_id}\n\tName: {name}\n\tCategory: {category}\n\tPrice: {price}")

def task_5(db):
    cursor=db.execute("SELECT customers.customer_id, SUM(total_amount) FROM customers LEFT JOIN orders ON orders.customer_id=customers.customer_id GROUP BY orders.customer_id ORDER BY SUM(total_amount) DESC LIMIT 5;")
    for row in cursor:
        print(f"Customer\n\tID: {row[0]}\n\tSpent: {row[1]}")

def task_6(db):
    sql="SELECT category, COUNT(orders.order_id) as order_count FROM products LEFT JOIN order_items ON products.product_id=order_items.product_id LEFT JOIN orders ON order_items.order_id=orders.order_id GROUP BY category;"
    df=pd.read_sql_query(sql,db)
    #print(df.columns.values)
    df.rename({"order_count":"orders"},axis="columns",inplace=True)
    axes=df.plot.bar(x="category",y="orders")
    figure=axes.get_figure()
    figure.subplots_adjust(bottom=0.3)
    figure.savefig('task 6.png')

def task_7(db):
    sql="SELECT AVG(items) FROM (SELECT COUNT(order_items.product_id) as items FROM orders LEFT JOIN order_items ON orders.order_id=order_items.order_id GROUP BY orders.order_id);"
    row=db.execute(sql).fetchone()
    print(f"Average number of different products per order: {row[0]}")

def task_8(db):
    sql="SELECT delivery_status, COUNT(delivery_id) as number FROM deliveries GROUP BY delivery_status;"
    df=pd.read_sql_query(sql,db)
    df.rename({"delivery_status":"Delivery Status","number":"Number"},axis="columns",inplace=True)
    axes=df.plot.bar(x="Delivery Status",y="Number")
    figure=axes.get_figure()
    figure.subplots_adjust(bottom=0.3)
    figure.savefig('task 8.png')

def main():
    db=get_connection()
    #task_1(db)
    #task_2(db)
    #task_3(db,r"lmartin@example.com")
    #task_4(db)
    #task_5(db)
    #task_6(db)
    #task_7(db)
    task_8(db)
    db.close()


if __name__=="__main__":
    main()
