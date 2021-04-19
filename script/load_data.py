import pymysql
import numpy as np

db = pymysql.Connection(
    host="8.130.53.81",
    port=3306,
    user="root",
    password="123456",
    db="CSCI_3907",
    charset='utf8'
)

cursor = db.cursor()

zomato_data = np.loadtxt("../data/zomato.csv")

sql = "INSERT INTO zomato(restaurant_id, restaurant_name\
       country_code, city, address, locality, locality_verbose\
       longitude, latitude\
       cuisines, average_cost_for_two, currency\
       has_table_booking, has_online_delivery, is_delivering_now, switch_to_order_menu\
       price_range, aggregate_rating, rating_color, rating_text, votes\
       ) \
       VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"

try:
    cursor.executemany(sql, zomato_data)
    db.commit()
except:
    db.rollback()

db.close()
