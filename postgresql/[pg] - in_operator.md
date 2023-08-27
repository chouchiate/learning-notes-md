## [pg] - IN operator

* use IN in WHERE clause to check if a value matches any value in a **list of values**.

```sql
-- syntax
value IN (value1,value2,...)
-- with sub-query
value IN (SELECT value FROM tbl_name);
```

### IN Operators in WHERE clause

```sql
SELECT customer_id,
	rental_id,
	return_date
FROM
	rental
WHERE
	customer_id IN (1, 2)
ORDER BY
	return_date DESC;
```

![](https://www.postgresqltutorial.com/wp-content/uploads/2020/07/PostgreSQL-In-Operator.png)

### IN Operators equivalent with = and OR
```sql
SELECT
	rental_id,
	customer_id,
	return_date
FROM
	rental
WHERE
	customer_id = 1 OR customer_id = 2
ORDER BY
	return_date DESC;
```

### NOT IN Operators
```sql
SELECT
	customer_id,
	rental_id,
	return_date
FROM
	rental
WHERE
	customer_id NOT IN (1, 2);
```
![](https://www.postgresqltutorial.com/wp-content/uploads/2020/07/PostgreSQL-NOT-IN-Operator.png)

### IN Operators with Sub-Query
```sql
SELECT customer_id
FROM rental
WHERE CAST (return_date AS DATE) = '2005-05-27'
ORDER BY customer_id;
```
![](https://www.postgresqltutorial.com/wp-content/uploads/2020/07/PostgreSQL-IN-customer-id-list.png)

```sql
SELECT
	customer_id,
	first_name,
	last_name
FROM
	customer
WHERE
	customer_id IN (
		SELECT customer_id
		FROM rental
		WHERE CAST (return_date AS DATE) = '2005-05-27'
	)
ORDER BY customer_id;

```

![](https://www.postgresqltutorial.com/wp-content/uploads/2020/07/PostgreSQL-IN-subquery-example.png)


