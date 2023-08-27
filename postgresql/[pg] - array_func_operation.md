## [pg] - Array Function and Operation

[doc](https://www.postgresql.org/docs/current/functions-array.html)

### Array Operators
| Operator | Description | Example | Result |
|---|---|---|---|
| = | equal | SELECT ARRAY[1.1,2.1,3.1]::int[] = ARRAY[1,2,3] | t |
| <> | not equal | SELECT ARRAY[1,2,3] <> ARRAY[1,2,4] | t |
| < | less than | SELECT ARRAY[1,2,3] < ARRAY[1,2,4] | t |
| > | greater than | SELECT ARRAY[1,4,3] > ARRAY[1,2,4] | t |
| <= | less than or equal | SELECT ARRAY[1,2,3] <= ARRAY[1,2,3] | t |
| >= | greater than or equal | SELECT ARRAY[1,4,3] >= ARRAY[1,4,3] | t |
| @> | contains | SELECT ARRAY[1,4,3] @> ARRAY[3,1] | t |
| <@ | is contained by | SELECT ARRAY[2,7] <@ ARRAY[1,7,4,2,6] | t |
| && | overlap (has element in common) | SELECT ARRAY[1,4,3] && ARRAY[2,1] | t |
| \|\| | array-to-array concat | SELECT ARRAY[1,2,3] \|\| ARRAY[4,5,6] | {1,2,3,4,5,6} |
| \|\| | array-to-array concat | SELECT ARRAY[1,2,3] \|\| ARRAY[[4,5,6],[7,8,9]] | {{1,2,3},{4,5,6},{7,8,9}} |
| \|\| | element-to-array concat | 3 \|\| SELECT ARRAY[4,5,6] | {3,4,5,6} |
| \|\| | array-to-element concat | SELECT ARRAY[4,5,6] \|\| 7 | {4,5,6,7} |

### Array Functions
* **arr_append()**
    * this function appends element to the end of an array
    * Syntax
        ```sql
        array_append(any_array, any_element)
        ```
    * return type: any_array
    * Example
        ```sql
        SELECT array_append(ARRAY[2,9], 6)
        --   array_append
        --------------
        -- {2,9,6}
        -- (1 row)
        ```

* ** arr_cat()**
    * this function concatenates two arrays
    * Syntax
        ```sql
        array_cat(any_array, any_array)
        ```
    * return type: any_array
    * Example
        ```sql
        SELECT array_cat(ARRAY[1,2,3], ARRAY[4,5]);
        -- array_cat
        -------------
        -- {1,2,3,4,5}
        -- (1 row)
        ```
* **array_ndims()**
    * this function returns the number of dimensions of the array
    * Syntax
        ```sql
        array_ndims(any_array)
        ```
    * return type: int
    * Example:
        ```sql
        SELECT array_ndims(ARRAY[[1,2,3],[4,5,6]]);
        --- array_ndims
        -------------
        -- 2
        -- (1 row)
        ```
* **array_dims()**
    * this function returns a text representation of array's dimensions
    * Syntax:
        ```sql
        array_dims(any_array)
        ```
    * return type: text
    * Example:
        ```sql
        SELECT array_dims(ARRAY[[2,2,4],[5,3,6]]);
        -- array_dims
        ------------
        -- [1:2][1:3]
        -- (1 row)
        ```
* **array_fill()**
    * this function returns an array initialized with supplied value and dimensions
    * Syntax:
        ```sql
        array_fill(any_element, int[], [, int[]])
        ```
    * Return: any_array
    * Example:
        ```sql
        SELECT array_fill(7, ARRAY[3], ARRAY[2]);
        --   array_fill
        ---------------
        -- [2:4]={7,7,7}
        -- (1 row)
        ```
* **array_length()**
    * this function returns the length of the requested array dimension
    * Syntax:
        ```sql
        array_length(any_array, int)
        ```
    * return type: int
    * Example:
        ```sql
        SELECT array_length(array[1,2,3], 1);
        -- array_length
        --------------
        -- 3
        -- (1 row)
        ```
* **array_lower()**
    * this function returns lower bound of the requested array dimension.
    * syntax:
        ```sql
        array_lower(any_array, int)
        ```
    * return type: int
    * Example:
        ```sql
            SELECT array_lower('[0:2]={1,2,3}'::int[], 1);
            -- array_lower
            -------------
            -- 0
            -- (1 row)
        ```
* **array_prepend()**
    * this function appends an element to the beginning of an array
    * Syntax:
        ```sql
        array_prepend(any_element, any_array)
        ```
    * return type: any_array
    * Example:
        ```sql
        SELECT array_prepend(1, ARRAY[2,3]);
        -- array_prepend
        ---------------
        -- {1,2,3}
        -- (1 row)
        ```
* **array_remove()**
    * this function removes all elements equal to the given value from the array
    * Syntax:
        ```sql
        array_remove(any_array, any_element)
        ```
    * return type: any_array
    * Example:
        ```sql
        SELECT array_remove(ARRAY[1,2,3,2], 2);
        --  array_remove
        ---------------
        -- {1,3}
        -- (1 row)
        ```
* **array_replace()**
    * this function replaces each array element equal to the given value with a new value
    * Syntax:
        ```sql
        array_replace(any_array, any_element, any_element)
        ```
    * return type: any_array
    * Example:
        ```sql
        SELECT array_replace(ARRAY[1,2,5,4], 5, 3);
        --  array_replace
        ---------------
        -- {1,2,3,4}
        -- (1 row)
        ```
* **array_to_string()**
    * this function concatenate array elements using supplied delimiter and optional null string,
    * Syntax:
        ```sql
        array_to_string(any_array, text [, text])
        ```
    * return type: text
    * Example:
        ```sql
        SELECT array_to_string(ARRAY[1,2,3, NULL, 5], ',', '*');
        --  array_to_string
        -----------------
        -- 1,2,3,*,5
        -- (1 row)
        ```
* **array_upper(any_array, int)
    * this function returns upper bound of the requested array dimension
    * Syntax:
        ```sql
        array_upper(any_array, int)
        ```
    * Return type: int
    * Example:
        ```sql
        SELECT array_upper(ARRAY[1,8,3,7], 1);
        --  array_upper
        -------------
        -- 4
        -- (1 row)
        ```
* **string_to_array()**
    * this function splits string into array elements using supplied delimiter and optional null string
    * Syntax:
        ```sql
        string_to_array(text, text [, text])
        ```
    * return type: text[]
    * Example:
        ```sql
        SELECT string_to_array('xx~^~yy~^~zz', '~^~', 'yy');
        --  string_to_array
        -----------------
        -- {xx,NULL,zz}
        -- (1 row)
        ```
* **unnest()**
    * this function expands an array to a set of rows.
    * Syntax:
        ```sql
        unnest(any_array)
        ```
    * return type: setof any_element
    * Example:
        ```sql
        SELECT unnest(ARRAY[1,2]);
        --  unnest
        --------
        --  1
        --  2
        -- (2 rows)
        ```



