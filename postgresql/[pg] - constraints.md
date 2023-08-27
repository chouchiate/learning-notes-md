## [pg] - CONSTRAINTS

### Check Constraints
* value in a certain column must satisfy a Boolean (truth-value) expression
```sql
CREATE TABLE products (
    product_no integer,
    name text,
    price numeric CHECK (price > 0)
);
```

* the third one is a table constraint
```sql
CREATE TABLE products (
    product_no integer,
    name text,
    price numeric CHECK (price > 0),
    discounted_price numeric CHECK (discounted_price > 0),
    CHECK (price > discounted_price)
);
```
### Not-Null Constraints

```sql
CREATE TABLE products (
    product_no integer NOT NULL,
    name text NOT NULL,
    price numeric
);
```


### Unique Constraints
* ensure that the data contained in a column, or a group of columns, is unique among all the rows in the table.
```sql

CREATE TABLE products (
    product_no integer UNIQUE,
    name text,
    price numeric
);
```

### Primary Keys
> indicates that a column, or group of columns, can be used as a unique identifier for rows in the table.
```sql
CREATE TABLE products (
    product_no integer PRIMARY KEY,
    name text,
    price numeric
);
-- span more than one column
CREATE TABLE example (
    a integer,
    b integer,
    c integer,
    PRIMARY KEY (a, c)
);
```

### Foreign Keys


```sql
CREATE TABLE products (
    product_no integer PRIMARY KEY,
    name text,
    price numeric
);

-- referencing products

CREATE TABLE orders (
    order_id integer PRIMARY KEY,
    product_no integer REFERENCES products (product_no),
    quantity integer
);

--- same

CREATE TABLE orders (
    order_id integer PRIMARY KEY,
    product_no integer REFERENCES products,
    quantity integer
);
```

```sql
CREATE TABLE t1 (
  a integer PRIMARY KEY,
  b integer,
  c integer,
  FOREIGN KEY (b, c) REFERENCES other_table (c1, c2)
);
```
### Exclusion Constraints

