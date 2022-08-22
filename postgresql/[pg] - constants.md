## [pg] - constants conventions




```sql
REAL '1.23'  -- string style
1.23::REAL   -- PostgreSQL (historical) style
```

### acceptable numeric constant
```sql
digits
digits.[digits][e[+-]digits]
[digits].digits[e[+-]digits]
digitse[+-]digits
```

### valid numeric constants
```sql
42
3.5
4.
.001
5e2
1.925e-3

```

### operators

```sql
+ - * / < > = ~ ! @ # % ^ & | ` ?
```

### Special characters

* A dollar sign ($) followed by digits is used to represent a positional parameter in the body of a function definition or a prepared statement. In other contexts the dollar sign can be part of an identifier or a dollar-quoted string constant.

* Parentheses (()) have their usual meaning to group expressions and enforce precedence. In some cases parentheses are required as part of the fixed syntax of a particular SQL command.

* Brackets ([]) are used to select the elements of an array. See Section 8.15 for more information on arrays.

* Commas (,) are used in some syntactical constructs to separate the elements of a list.

* The semicolon (;) terminates an SQL command. It cannot appear anywhere within a command, except within a string constant or quoted identifier.

* The colon (:) is used to select “slices” from arrays. (See Section 8.15.) In certain SQL dialects (such as Embedded SQL), the colon is used to prefix variable names.

* The asterisk (*) is used in some contexts to denote all the fields of a table row or composite value. It also has a special meaning when used as the argument of an aggregate function, namely that the aggregate does not require any explicit parameter.

* The period (.) is used in numeric constants, and to separate schema, table, and column names.

### Operator precedence


Operator/Element	Associativity	Description
.	left	table/column name separator
::	left	PostgreSQL-style typecast
[ ]	left	array element selection
+ -	right	unary plus, unary minus
^	left	exponentiation
* / %	left	multiplication, division, modulo
+ -	left	addition, subtraction
(any other operator)	left	all other native and user-defined operators
BETWEEN IN LIKE ILIKE SIMILAR	 	range containment, set membership, string matching
< > = <= >= <>	 	comparison operators
IS ISNULL NOTNULL	 	IS TRUE, IS FALSE, IS NULL, IS DISTINCT FROM, etc
NOT	right	logical negation
AND	left	logical conjunction
OR	left	logical disjunction

### source
[doc](https://www.postgresql.org/docs/current/sql-syntax-lexical.html)