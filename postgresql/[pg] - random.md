## [pg] random
* The following statement returns a random number between 0 and 1.
```sql
select random();
--  0.867320362944156
--  (1 row)

```
* To generate a random number between 1 and 11, you use the following statement:
```sql
SELECT random() * 10 + 1 AS RAND_1_11;
-- rand_1_11
------------------
-- 7.75778411421925
-- (1 row)

```
* apply the floor() function to the expression as follows:
```sql
SELECT floor(random() * 10 + 1)::int;
--  floor
-------
--     9
-- (1 row)
```
* to generate a random number between two integers l and h, you use the following statement:
```sql
SELECT floor(random() * (h-l+1) + l)::int;
```
* develop a user-defined function that returns a random number between two numbers l and h:
```sql
CREATE OR REPLACE FUNCTION random_between(low INT ,high INT)
   RETURNS INT AS
$$
BEGIN
   RETURN floor(random()* (high-low + 1) + low);
END;
$$ language 'plpgsql' STRICT;
```
* usage
```sql
SELECT random_between(1,100);
--  random_between
----------------
-- 81
-- (1 row)
```
* get multiple random numbers between two integers
```sql
SELECT random_between(1,100)
FROM generate_series(1,5);
 -- random_between
----------------
-- 37
-- 82
-- 19
-- 92
-- 43
-- (5 rows)
```

### Generate Random Table
```sql
SELECT generate_series(1,10) AS id, md5(random()::text) AS descr;
```