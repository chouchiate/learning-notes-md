## [pg] - GROUP BY Clause
> PostgreSQL evaluates the GROUP BY clause after the FROM and WHERE clauses and before the HAVING SELECT, DISTINCT, ORDER BY and LIMIT clauses.

![](https://www.postgresqltutorial.com/wp-content/uploads/2020/07/PostgreSQL-GROUP-BY-1.png)


### data schema
```go
type paymentSchema struct {
    paymentID *uuid.UUID
    customerID string
    staffID string
    rentalID string
    amount int
    paymentDate time.Time
}
```
![](https://www.postgresqltutorial.com/wp-content/uploads/2019/12/payment.png)

---

### GROUP BY without aggregate function

```sql
SELECT
   customer_id
FROM
   payment
GROUP BY
   customer_id;
```
* the GROUP BY works like the DISTINCT clause that removes duplicate rows
![](https://www.postgresqltutorial.com/wp-content/uploads/2019/12/PostgreSQL-Group-By-example.png)
---
### GROUP BY with SUM() function
> The GROUP BY clause sorts the result set by customer id and adds up the amount that belongs to the same customer

```sql
SELECT
	customer_id,
	SUM (amount)
FROM
	payment
GROUP BY
	customer_id;
```
![](https://www.postgresqltutorial.com/wp-content/uploads/2019/12/PostgreSQL-Group-By-with-SUM.png)
---
### GROUP BY WITH SUM and ORDER BY
```sql
SELECT
	customer_id,
	SUM (amount)
FROM
	payment
GROUP BY
	customer_id
ORDER BY
	SUM (amount) DESC;
```

![](https://www.postgresqltutorial.com/wp-content/uploads/2019/12/PostgreSQL-Group-By-and-Order-By.png)
---
### using GROUP BY with JOIN clause

```sql
SELECT
	first_name || ' ' || last_name full_name,
	SUM (amount) amount
FROM
	payment
INNER JOIN customer USING (customer_id)
GROUP BY
	full_name
ORDER BY amount DESC;

```
![](https://www.postgresqltutorial.com/wp-content/uploads/2020/07/PostgreSQL-Group-By-with-join.png)

---

### using GROUP BY with COUNT function
* To find the number of payment transactions that each staff has been processed
  * group the rows in the payment table by the values in the staff_id column * use the COUNT() function to get the number of transactions

```sql
SELECT
	staff_id,
	COUNT (payment_id)
FROM
	payment
GROUP BY
	staff_id;

-- The GROUP BY clause divides the rows in the payment into groups and groups them by value in the staff_id column.

-- For each group, it returns the number of rows by using the COUNT() function.
```
![](https://www.postgresqltutorial.com/wp-content/uploads/2019/12/PostgreSQL-Group-By-and-Count.png)

---

### using GROUP by with multiple columns

```sql
SELECT
	customer_id,
	staff_id,
	SUM(amount)
FROM
	payment
GROUP BY
	staff_id,
	customer_id
ORDER BY
    customer_id;

-- the GROUP BY clause divides the rows in the payment table by the values in the customer_id and staff_id columns

-- For each group of (customer_id, staff_id), the SUM() calculates the total amount.
```

![](https://www.postgresqltutorial.com/wp-content/uploads/2019/12/PostgreSQL-Group-By-multiple-columns.png)

---

### using GROUP BY with date columns using DATE() function
*  To group payments by dates, you use the DATE() function to convert timestamps to dates first and then group payments by the result date
```sql
SELECT
	DATE(payment_date) paid_date,
	SUM(amount) sum
FROM
	payment
GROUP BY
	DATE(payment_date);
```
![](https://www.postgresqltutorial.com/wp-content/uploads/2019/12/PostgreSQL-Group-By-dates.png)




