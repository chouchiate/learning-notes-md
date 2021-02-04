## Lesson URL

```
https://youtu.be/qw--VYLpxG4
```



## Create Table

```
CREATE TABLE person (

	id INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	gender VARCHAR(7),
	date_of_birth DATE,

)
```



## Insert data example

```
INSERT INTO person (first_name, last_name, gender, date_of_birth)
VALUES ('Anne', 'Smith', 'FEMALE', DATE '1988-01-09');
```



## Create Table with Bigserial Id

```
CREATE TABLE person (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR(5) NOT NULL,
	date_of_birth DATE NOT NULL,

)
```



## Insert data example

```
INSERT INTO person (
	first_name,
	last_name,
	gender,
	date_of_birth,
	email)
VALUES('Jake', 'Jones', 'MALE', DATE '1990-01-10', 'jake@gmail.com');
```



## Create SQL mock data

```
https://www.mockaroo.com/
```



## Add sql table from file

- windows

  ```sql
  \i 'D:\\Work/postreSql/person.sql'
  ```



# Select data

```SQL
LSELECT * FROM person;
SELECT first_name, last_name FROM person;
```



## Sort Data: Order By

```
SELECT * FROM person ORDER BY coutry_of_birth ACS;		//ascending
SELECT * FROM person ORDER BY coutry_of_birth DESC;		//descending
SELECT * FROM person ORDER BY id DESC;
SELECT * FROM person ORDER BY id, email;
```



## List Distinct

```
SELECT country_of_birth FROM person;
SELECT country_of_birth FROM person ORDER BY country_of_birth;
SELECT DISTINCT country_of_birth FROM person ORDER BY country_of_birth;
SELECT DISTINCT country_of_birth FROM person ORDER BY country_of_birth DESC;
```



## WHERE Clause

### Filter data base on condition

```
SELECT * FROM person WHERE gender = 'Female';
SELECT * FROM person WHERE gender = 'Male' AND (country_of_birth = 'Poland' OR country_of_birth = 'France');
```



## Conditional

```
SELECT 1 <= 2;
?column? | t
SELECT 1 <> 1;
?column? | f

```



## Limit

```
SELECT * FROM person LIMIT 10;
```



## Offset

```
SELECT * FROM person OFFSET 5 LIMIT 5;
```



## Fetch Keyword

```
SELECT * FROM person OFFSET 5 FETCH FIRST 5 ROW ONLY;
```



## In Keyword

```
SELECT * FROM person WHERE country_of_birth = 'China'
OR country_of_birth = 'France' OR country_of_birth = 'Brazil';

SELECT *
FROM person
WHERE country_of_birth IN ('China','Brazil','France')
ORDER BY country_of_birth ASC;
```

## Between Keyword

```
SELECT * FROM person
WHERE date_of_birth
BETWEEN DATE '2000-01-01' AND '2015-01-01';
```



## Like & ILike Operator

```
SELECT * FROM person WHERE email LIKE '%.com';
SELECT * FROM person WHERE email LIKE '%@microsoft.com';
SELECT * FROM person WHERE email LIKE '%@google.%';
SELECT * FROM person WHERE email LIKE '_______@%';

```



## Group By Keyword

```

```





