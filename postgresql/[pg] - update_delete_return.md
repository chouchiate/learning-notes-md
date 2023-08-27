## [pg] - UPDATE and DELETE and RETURNING

### UPDATE

```sql
UPDATE products SET price = 10 WHERE price = 5;

UPDATE products SET price = price * 1.10;
--- update more than one column
UPDATE mytable SET a = 5, b = 3, c = 1 WHERE a > 0;
```


### DELETE

```sql
DELETE FROM products WHERE price = 10;

DELETE FROM products;
```

### RETURNING

```sql
---from table creation
CREATE TABLE users (firstname text, lastname text, id serial primary key);

INSERT INTO users (firstname, lastname) VALUES ('Joe', 'Cool') RETURNING id;
--- delete and return
UPDATE products SET price = price * 1.10
  WHERE price <= 99.99
  RETURNING name, price AS new_price;

DELETE FROM products
  WHERE obsoletion_date = 'today'
  RETURNING *;
```