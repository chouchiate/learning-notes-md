## [pg] - table

### CREATE
[clause](https://www.postgresql.org/docs/current/sql-createtable.html)
```sql
CREATE TABLE my_first_table (
    first_column text,
    second_column integer
);

CREATE TABLE products (
    product_no integer,
    name text,
    price numeric
);
```
### DROP
```sql
DROP TABLE products;
DROP TABLE my_first_table;
```

### Default Values
```sql
CREATE TABLE products (
    product_no integer,
    name text,
    price numeric DEFAULT 9.99
);

CREATE TABLE products (
    product_no integer DEFAULT nextval('products_product_no_seq'),
    ...
);

CREATE TABLE products (
    product_no SERIAL,
    ...
);
```

### Generated Column
* generate from other columns
```sql
CREATE TABLE people (
    ...,
    height_cm numeric,
    height_in numeric GENERATED ALWAYS AS (height_cm / 2.54) STORED
);
```

### CREATE FOREIGN TABLE
[doc](https://www.postgresql.org/docs/current/sql-createforeigntable.html)




