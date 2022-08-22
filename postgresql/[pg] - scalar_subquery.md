## [pg] - Scalar SubQuery

* A scalar subquery is an ordinary SELECT query in parentheses that returns exactly one row with **one column**.

```sql
SELECT name, (SELECT max(pop) FROM cities WHERE cities.state = states.name)
    FROM states;
```