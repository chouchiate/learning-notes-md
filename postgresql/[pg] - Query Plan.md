# [pg] - **Query Plan Learning Notes**

#### Query Plan Structure

```
Sort
└── Hash Join
    ├── Seq Scan
    └── Hash
        └── Bitmap Heap Scan
            └── Bitmap Index Scan
```


# **Reference**

[blog](https://thoughtbot.com/blog/reading-an-explain-analyze-query-plan)

[explain](https://www.postgresql.org/docs/9.4/using-explain.html)

