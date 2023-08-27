## [pg] - RANGE type and Functions

### Range Operators

#### * operator
> Computes the intersection of the ranges.
```sql
    --- anyrange * anyrange → anyrange
    int8range(5,15) * int8range(10,20) → [10,15)
```



### built-in RANGES types
* int4range — Range of integer, int4multirange — corresponding Multirange
* int8range — Range of bigint, int8multirange — corresponding Multirange
*
* numrange — Range of numeric, nummultirange — corresponding Multirange
* tsrange — Range of timestamp without time zone, tsmultirange — corresponding Multirange
* tstzrange — Range of timestamp with time zone, tstzmultirange — corresponding Multirange
* daterange — Range of date, datemultirange — corresponding Multirange


### tsrange - timestamp range



### tstzrange - timestamp with timezone range



### examples
* [db_friddle](https://dbfiddle.uk/?rdbms=postgres_12&fiddle=ad3eda66b1214ff82bbb83a74bd1193d)

### Can I digest this?
```sql
CREATE OR REPLACE FUNCTION extract_interval(TSTZRANGE) RETURNS interval AS
$func$
select upper($1) - lower($1);
$func$ LANGUAGE sql STABLE;

CREATE OR REPLACE FUNCTION extract_interval(TSRANGE) RETURNS interval AS
$func$
select upper($1) - lower($1);
$func$ LANGUAGE sql STABLE;


CREATE OR REPLACE FUNCTION extract_days(TSTZRANGE) RETURNS integer AS
$func$
select (date_trunc('day',upper($1))::DATE - date_trunc('day',lower($1))::DATE) + 1;
$func$ LANGUAGE sql;

CREATE OR REPLACE FUNCTION extract_days(TSRANGE) RETURNS integer AS
$func$
select (date_trunc('day',upper($1))::DATE - date_trunc('day',lower($1))::DATE) + 1;
$func$ LANGUAGE sql;


WITH tzr AS (SELECT tstzrange('2013-10-01 10:00-07', '2013-10-03 05:15-07') AS dttz, tstzrange('2013-10-01 10:00', '2013-10-03 05:15') AS dt)
SELECT  extract_interval(dttz) as interval_with_tz,
        extract_interval(dt) as interval_no_tz,
        extract_days(dttz) as days_with_tz,
        extract_days(dt) as days_no_tz
FROM tzr;
```
