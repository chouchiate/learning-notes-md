## [grafana] - loki query



### label matching operator
* = : exactly equal
* != : not equal
* =~ : regex matches
* !~ : regex does not match

### label filter expression
* =
* !=
* =~
* !~
* >
* <
* >=
* <=

### Binary Operators
1.      + (addition)
2.      - (subtraction)
3.      * (multiplication)
4.      / (division)
5.      % (modulo)
6.      ^ (power/exponentiation)

### Log Pipeline
* Each expression is executed in left to right sequence for each log line.
*  If you want the regex dot character to match newlines you can use the single-line flag, like so: (?s)search_term.+ matches search_term\n.
```qs
{container="data-processor"} |= "SPS2021PA000197"
```

### JSON parser
```qs
{container="data-processor"} |= "AddMeasurement" | json  ts="ts" | ts == $MY_FILTER_VALUE
```


### External

* [doc](https://grafana.com/docs/loki/latest/logql/log_queries/)