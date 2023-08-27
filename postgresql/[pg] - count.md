## [pg] - COUNT clauses


### COUNT ALL

```sql
SELECT COUNT( ALL grade )
FROM customer;
```

### DISTINCT COUNT

```sql
-- syntax
COUNT(DISTINCT expr,[expr...])
```

* cust_code has multiple repeated cust_code in table
* COUNT only unique cust_code
* result will appear with the heading "Number of employees",
```sql
SELECT COUNT ( DISTINCT cust_code ) AS "Number of employees"
FROM orders;
```




