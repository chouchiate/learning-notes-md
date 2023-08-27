## [pg] - DISTINCT keyword
> remove duplicate rows from a result set

The DISTINCT clause can be applied to one or more columns in the select list of the SELECT statement.

```sql
-- the combination of values in both column1 and column2 columns will be used for evaluating the duplicate.
SELECT
   DISTINCT column1, column2
FROM
   table_name;
```

###