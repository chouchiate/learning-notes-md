## [pg] - UNION and UNION ALL operators

* UNION operator combines result sets of two or more SELECT statements into a single result set.
* UNION operator removes all duplicate rows from the combined data set.

### SYNTAX
```sql
SELECT select_list_1
FROM table_expresssion_1
UNION
SELECT select_list_2
FROM table_expression_2
```

* UNION ALL retains all duplicate rows



