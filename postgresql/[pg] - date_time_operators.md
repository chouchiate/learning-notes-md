## [pg] - date/time functions and operators



### get random date/time between two timestamps
```sql
select timestamp '2014-01-10 20:00:00' +
       random() * (timestamp '2014-01-20 20:00:00' -
                   timestamp '2014-01-10 10:00:00')
```
