## [pg] - BETWEEN CLAUSE

###
```sql
SELECT
	customer_id,
	payment_id,
	amount,
 payment_date
FROM
	payment
WHERE
	WHERE payment_date  BETWEEN '2022-08-15 00:00:00' AND '2022-08-22 00:00:00'
-- same as WHERE payment_date  <= '2022-08-22 00:00:00' AND payment_date >= '2022-08-15 00:00:00'
```
![](https://www.postgresqltutorial.com/wp-content/uploads/2020/07/PostgreSQL-BETWEEN-two-dates.png)

