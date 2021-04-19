import pymysql
import numpy as np

db = pymysql.Connection(
    host="8.130.53.81",
    port=3306,
    user="root",
    passwd="du123456",
    db="CSCI_3907",
    charset='utf8'
)

cursor = db.cursor()

# a) urban restaurants have the lowest average consumption
cursor.execute("""SELECT city, AVG(average_cost_for_two) avg_val
from 
(SELECT *
from zomato
where average_cost_for_two > 0) as resu
GROUP BY city
ORDER BY avg_val
LIMIT 1""")

result = cursor.fetchone()

print(result)

# b) City with largest number of votes。

cursor.execute("""SELECT city, sum(votes) sum_val
from zomato
GROUP BY city
ORDER BY sum_val desc
LIMIT 1""")

result = cursor.fetchone()
print(result)

# c) The number of Chinese restaurants in each country。

cursor.execute("""SELECT
result.country_code,
country_code.country,
result.count_val
FROM
(
SELECT
country_code,
COUNT(1) AS count_val
FROM
(
SELECT
*
FROM
zomato
WHERE
cuisines LIKE "%Chinese%"
) AS chinese_resu
GROUP BY
country_code
) AS result
LEFT JOIN country_code ON country_code.`﻿country_code` = result.country_code""")

results = cursor.fetchall()
print(results)

# d)	Number of restaurants and average spending in each country。
cursor.execute("""SELECT result.country_code, country_code.country, result.avg_val, result.count_val
from(
SELECT country_code, COUNT(1) as count_val, AVG(average_cost_for_two) avg_val
from zomato
GROUP BY country_code) as result
LEFT JOIN country_code on country_code.`﻿country_code` = result.country_code""")

results = cursor.fetchall()
print(results)

db.close()
