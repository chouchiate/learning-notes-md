## [mysql] - generate random data



```sql
INSERT INTO Allis_digitalPower.batterydata
SELECT 
	

;

```

### Generate random values (range of random numbers)
```sql
FLOOR(RAND() * (<max> - <min> + 1)) + <min>

```


### Generate random array of date

```sql
WITH RECURSIVE nrows(date) AS (
SELECT MAKEDATE(2021,333) UNION ALL 
SELECT DATE_ADD(date,INTERVAL 1 day) FROM nrows WHERE  date<=CURRENT_DATE
)
SELECT date FROM nrows;

```

### trial one

```sql
INSERT INTO Allis_digitalPower.batterydata (accout, battery_type, field, location, battery_id, tv, tc, batt1, batt2, fullcap, vper, rec, cycno, balstat)
SELECT 
	random_string(15) AS account,
  random_string(15 AS battery_type,
  random_string(15) AS field,
  random_string(15) AS location,
  CAST(RAND()*(10-5)+5 AS CHAR(15)) AS battery_id,
  FLOOR(RAND()* (110.9 - 105.1 + 1) + 105.1) AS tv,
  FLOOR(RAND()* (50.9 - 10.1 + 1) + 10.1 ) AS tc,
  FLOOR(RAND()* (100.9 - 30.1 + 1) + 30.1 ) AS batt1,
  FLOOR(RAND()* (100.9 - 30.1 + 1) + 30.1 ) AS batt2,
  FLOOR(RAND()* (100.0 - 1.1 + 1) + 1.1 ) AS fullcap,
  FLOOR(RAND()* (100.0 - 1.1 + 1) + 1.1 ) AS vper,
  FLOOR(RAND()* (100.0 - 1.1 + 1) + 1.1 ) AS rec,
  FLOOR(RAND()* (100 - 1 + 1) + 1 ) AS cycno,
  FLOOR(RAND()* (100 - 1 + 1) + 1) AS balstat;


CREATE TEMPORARY TABLE tmp_series(val INT);
DROP TEMPORARY TABLE
```

### trial two

```sql
select written_at from (
    select
        date_format(
        adddate('2011-1-1', @num:=@num+1),
        '%Y-%m-%d'
    ) written_at
    from
        batterydata,
    (select @num:=-1) num
    limit
        366
) as dt
# where year(written_at)=2011

```


### trial three

```sql
SELECT 
	UNIX_TIMESTAMP(
		adddate('1970-01-01 08:00:00', INTERVAL @num:=@num+1 SECOND)
	) date
FROM
	batterydata,
    (select @num:=-1) aa
LIMIT 5;


SELECT 
	@num:=@num+1
FROM
	batterydata,
    (SELECT @num:=-1) aa
LIMIT 5;


```

### trial 4
> This function takes three arguments - start value, end value, and step value - and returns a table with a single column "val" that contains a series of numbers starting from the start value and incrementing by the step value until the end value is reached.

> Here's an example of how to use this function to generate a series of numbers from 1 to 10:


```sql 
-- answer from chatGPT
DROP FUNCTION IF EXISTS generate_series;
DELIMITER //

CREATE FUNCTION generate_series(start_val INT, end_val INT, step_val INT)
-- error here at RETURNS TABLE (unknown)
RETURNS TABLE(val INT)
BEGIN
  DECLARE i INT DEFAULT start_val;
  CREATE TEMPORARY TABLE tmp_series(val INT);
  WHILE i <= end_val DO
    INSERT INTO tmp_series VALUES (i);
    SET i = i + step_val;
  END WHILE;
  SELECT val FROM tmp_series;
  DROP TEMPORARY TABLE tmp_series;
END//

DELIMITER ;

```


### trial 5 
* (100 rows of random nubmer from 0 to 100 - working example)

```sql
DROP TABLE IF EXISTS my_table;
CREATE TABLE `my_table` (
  `my_column` INT NULL,
  `my_digit` DECIMAL(5,1) NULL,
  `my_timestamp_column` TIMESTAMP NULL,
  `my_unix_timestamp_column` INT NULL,
  `my_integer_string_column` VARCHAR(45) NULL,
  `my_integer1_column` INT NULL,
  `my_integer2_column` INT NULL
);

INSERT INTO my_table (
  my_column, 
  my_digit, 
  my_timestamp_column, 
  my_unix_timestamp_column, 
  my_integer_string_column,
  my_integer1_column,
  my_integer2_column
) 
SELECT 
	ROUND(RAND()*100) AS random_numbers,
  ROUND(RAND()*100) AS random_digits,
	DATE_ADD('2023-03-22', INTERVAL ROUND(RAND() * DATEDIFF('2023-03-22', '2023-02-22')) DAY) 
    + INTERVAL ROUND(RAND() * 86399) SECOND AS random_timestamps,
  UNIX_TIMESTAMP(
    DATE_ADD('2023-03-22', INTERVAL ROUND(RAND() * DATEDIFF('2023-03-22', '2023-02-22')) DAY) 
    + INTERVAL ROUND(RAND() * 86399) SECOND
) AS random_unix_timestamps,
  CAST(ROUND(RAND() * (344150 - 344100 + 1) - 344100) AS CHAR) AS random_integer_strings,
  FLOOR(RAND() * (100 - 50 + 1)) + 50 AS random_integer1,
  FLOOR(RAND() * (200 - 150 + 1)) + 150 AS random_integer2  
FROM (
    SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 
    UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10 UNION SELECT 11 
    UNION SELECT 12 UNION SELECT 13 UNION SELECT 14 UNION SELECT 15 UNION SELECT 16 
    UNION SELECT 17 UNION SELECT 18 UNION SELECT 19 UNION SELECT 20 UNION SELECT 21 
    UNION SELECT 22 UNION SELECT 23 UNION SELECT 24 UNION SELECT 25 UNION SELECT 26 
    UNION SELECT 27 UNION SELECT 28 UNION SELECT 29 UNION SELECT 30 UNION SELECT 31 
    UNION SELECT 32 UNION SELECT 33 UNION SELECT 34 UNION SELECT 35 UNION SELECT 36 
    UNION SELECT 37 UNION SELECT 38 UNION SELECT 39 UNION SELECT 40 UNION SELECT 41 
    UNION SELECT 42 UNION SELECT 43 UNION SELECT 44 UNION SELECT 45 UNION SELECT 46 
    UNION SELECT 47 UNION SELECT 48 UNION SELECT 49 UNION SELECT 50 UNION SELECT 51 
    UNION SELECT 52 UNION SELECT 53 UNION SELECT 54 UNION SELECT 55 UNION SELECT 56 
    UNION SELECT 57 UNION SELECT 58 UNION SELECT 59 UNION SELECT 60 UNION SELECT 61 
    UNION SELECT 62 UNION SELECT 63 UNION SELECT 64 UNION SELECT 65 UNION SELECT 66 
    UNION SELECT 67 UNION SELECT 68 UNION SELECT 69 UNION SELECT 70 UNION SELECT 71 
    UNION SELECT 72 UNION SELECT 73 UNION SELECT 74 UNION SELECT 75 UNION SELECT 76 
    UNION SELECT 77 UNION SELECT 78 UNION SELECT 79 UNION SELECT 80 UNION SELECT 81 
    UNION SELECT 82 UNION SELECT 83 UNION SELECT 84 UNION SELECT 85 UNION SELECT 86 
    UNION SELECT 87 UNION SELECT 88 UNION SELECT 89 UNION SELECT 90 UNION SELECT 91 
    UNION SELECT 92 UNION SELECT 93 UNION SELECT 94 UNION SELECT 95 UNION SELECT 96 
    UNION SELECT 97 UNION SELECT 98 UNION SELECT 99 UNION SELECT 100
) AS sequence;
```

### final battery data work


```sql
DROP TABLE IF EXISTS `Allis_digitalPower`.`batterydata`;
CREATE TABLE `Allis_digitalPower`.`batterydata` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `battery_id` VARCHAR(10) NOT NULL,
  `gateway_id` VARCHAR(10) NOT NULL,
  `written_at` INT NULL,
  `tv` DECIMAL(5,1) NULL,
  `tc` DECIMAL(5,1) NULL,
  `batt1` DECIMAL(5,1) NULL,
  `batt2` DECIMAL(5,1) NULL,
  `fullcap` DECIMAL(5,1) NULL,
  `vper` DECIMAL(5,1) NULL,
  `rec` DECIMAL(5,1) NULL,
  `cycno` INT NULL,
  `balstat` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);

INSERT INTO batterydata (
  written_at,
  battery_id, 
  gateway_id,
  tv, 
  tc,
  batt1,
  batt2,
  fullcap,
  vper,
  rec,
  cycno,
  balstat  
)

SELECT 
  UNIX_TIMESTAMP(
    DATE_ADD('2023-03-22', INTERVAL ROUND(RAND() * DATEDIFF('2023-03-22', '2023-02-22')) DAY) 
    + INTERVAL ROUND(RAND() * 86399) SECOND
  ) AS random_unix_timestamps,
  CAST(ROUND(RAND() * (344150 - 344100 + 1) + 344100) AS CHAR) AS random_battery_id,
  CONCAT(
	"GW-", 
	CAST(ROUND(RAND() * (3000 - 2000 + 1) + 2000) AS CHAR)) AS random_gateway_id,
  FLOOR(RAND() * (130 - 100 + 1)) + 100 AS random_tv,
	ROUND(RAND()*50) AS random_tc,
  ROUND(RAND()*100) AS random_batt1,
	ROUND(RAND()*100) AS random_batt2,
  ROUND(RAND()*100) AS random_fullcap,    
  ROUND(RAND()*100) AS random_vper,   
  ROUND(RAND()*100) AS random_rec,     
  ROUND(RAND()*100) AS random_cycno,     
  ROUND(RAND()*100) AS random_balstat
FROM (
    SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 
    UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10 UNION SELECT 11 
    UNION SELECT 12 UNION SELECT 13 UNION SELECT 14 UNION SELECT 15 UNION SELECT 16 
    UNION SELECT 17 UNION SELECT 18 UNION SELECT 19 UNION SELECT 20 UNION SELECT 21 
    UNION SELECT 22 UNION SELECT 23 UNION SELECT 24 UNION SELECT 25 UNION SELECT 26 
    UNION SELECT 27 UNION SELECT 28 UNION SELECT 29 UNION SELECT 30 UNION SELECT 31 
    UNION SELECT 32 UNION SELECT 33 UNION SELECT 34 UNION SELECT 35 UNION SELECT 36 
    UNION SELECT 37 UNION SELECT 38 UNION SELECT 39 UNION SELECT 40 UNION SELECT 41 
    UNION SELECT 42 UNION SELECT 43 UNION SELECT 44 UNION SELECT 45 UNION SELECT 46 
    UNION SELECT 47 UNION SELECT 48 UNION SELECT 49 UNION SELECT 50 UNION SELECT 51 
    UNION SELECT 52 UNION SELECT 53 UNION SELECT 54 UNION SELECT 55 UNION SELECT 56 
    UNION SELECT 57 UNION SELECT 58 UNION SELECT 59 UNION SELECT 60 UNION SELECT 61 
    UNION SELECT 62 UNION SELECT 63 UNION SELECT 64 UNION SELECT 65 UNION SELECT 66 
    UNION SELECT 67 UNION SELECT 68 UNION SELECT 69 UNION SELECT 70 UNION SELECT 71 
    UNION SELECT 72 UNION SELECT 73 UNION SELECT 74 UNION SELECT 75 UNION SELECT 76 
    UNION SELECT 77 UNION SELECT 78 UNION SELECT 79 UNION SELECT 80 UNION SELECT 81 
    UNION SELECT 82 UNION SELECT 83 UNION SELECT 84 UNION SELECT 85 UNION SELECT 86 
    UNION SELECT 87 UNION SELECT 88 UNION SELECT 89 UNION SELECT 90 UNION SELECT 91 
    UNION SELECT 92 UNION SELECT 93 UNION SELECT 94 UNION SELECT 95 UNION SELECT 96 
    UNION SELECT 97 UNION SELECT 98 UNION SELECT 99 UNION SELECT 100
) AS sequence;
```