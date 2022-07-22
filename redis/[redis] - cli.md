## [redis] - cli


### start cli

```bash
# enter redis-cli from bash, say, in docker
$ redis-cli
```

### use the following command to know the number of database
```bash
$redis-cli CONFIG GET databases
1) "databases"
2) "16"
```

###  list the databases for which some keys are defined
```bash
$redis-cli INFO keyspace
# Keyspace
db0:keys=10,expires=0
db1:keys=1,expires=0
db3:keys=1,expires=0
```

### debugging
* The EVAL command is what tells Redis to run the script which follows.
```bash
# Script arguments fall into two groups: KEYS and ARGV.
$ eval "redis.call('set', KEYS[1], ARGV[1])" 1 key:name value
```

### get list of keys
```bash
#
$redis-cli KEYS \*
#
$redis-cli KEYS N*
#
$redis-cli KEYS *
```

### get key-value

### pipe txt to redis

```txt
SET "AL" "Alabama"
SET "AK" "Alaska"
SET "AS" "American Samoa"
SET "AZ" "Arizona"
SET "AR" "Arkansas"
SET "CA" "California"
SET "CO" "Colorado"
SET "CT" "Connecticut"
SET "DE" "Delaware"
SET "DC" "District Of Columbia"
SET "FM" "Federated States Of Micronesia"
SET "FL" "Florida"
SET "GA" "Georgia"
SET "GU" "Guam"
SET "HI" "Hawaii"
SET "ID" "Idaho"
SET "IL" "Illinois"
SET "IN" "Indiana"
SET "IA" "Iowa"
SET "KS" "Kansas"
SET "KY" "Kentucky"
SET "LA" "Louisiana"
SET "ME" "Maine"
SET "MH" "Marshall Islands"
SET "MD" "Maryland"
SET "MA" "Massachusetts"
SET "MI" "Michigan"
SET "MN" "Minnesota"
SET "MS" "Mississippi"
SET "MO" "Missouri"
SET "MT" "Montana"
SET "NE" "Nebraska"
SET "NV" "Nevada"
SET "NH" "New Hampshire"
SET "NJ" "New Jersey"
SET "NM" "New Mexico"
SET "NY" "New York"
SET "NC" "North Carolina"
SET "ND" "North Dakota"
SET "MP" "Northern Mariana Islands"
SET "OH" "Ohio"
SET "OK" "Oklahoma"
SET "OR" "Oregon"
SET "PW" "Palau"
SET "PA" "Pennsylvania"
SET "PR" "Puerto Rico"
SET "RI" "Rhode Island"
SET "SC" "South Carolina"
SET "SD" "South Dakota"
SET "TN" "Tennessee"
SET "TX" "Texas"
SET "UT" "Utah"
SET "VT" "Vermont"
SET "VI" "Virgin Islands"
SET "VA" "Virginia"
SET "WA" "Washington"
SET "WV" "West Virginia"
SET "WI" "Wisconsin"
SET "WY" "Wyoming"

```
### pipe it with cat command
```bash
$ cat STATES.TXT | redis-cli --pipe
```

