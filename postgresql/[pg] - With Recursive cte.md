## [pg] - WITH RECURSIVE (Common Table Expression)

### SYNTAX
```sql
WITH RECURSIVE cte_name AS(
    CTE_query_definition -- non-recursive term
    UNION [ALL]
    CTE_query_definition  -- recursive term
) SELECT * FROM cte_name;
```

* Non-recursive term: a CTE query definition that forms the base result set of the CTE structure.

* Recursive term: one or more CTE query definitions joined with the non-recursive term using the UNION or UNION ALL operator. The recursive term references the CTE name itself.

* Termination check: the recursion stops when no rows are returned from the previous iteration.




