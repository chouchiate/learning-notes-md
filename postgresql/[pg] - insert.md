## [pg] - INSERT command

```sql
CREATE TABLE products (
    product_no integer,
    name text,
    price numeric
);
-- insert one
INSERT INTO products VALUES (1, 'Cheese', 9.99);
-- insert multiple
INSERT INTO products (product_no, name, price) VALUES
    (1, 'Cheese', 9.99),
    (2, 'Bread', 1.99),
    (3, 'Milk', 2.99);

-- insert from result of query
INSERT INTO products (product_no, name, price)
  SELECT product_no, name, price FROM new_products
    WHERE release_date = 'today';
```

### source
[doc](https://www.postgresql.org/docs/current/sql-insert.html)
