## [redis] - commands

### SET
- 存入/複寫 value 給指定 key. 丟棄舊的 time to live 值
#### options
* EX seconds -- Set the specified expire time, in seconds.
* PX milliseconds -- Set the specified expire time, in milliseconds.
* EXAT timestamp-seconds -- Set the specified Unix time at which the key will expire in seconds.
* PXAT timestamp-milliseconds -- Set the specified Unix time at which the key will * expire, in milliseconds.
* NX -- Only set the key if it does not already exist.
* XX -- Only set the key if it already exist.
* KEEPTTL -- Retain the time to live associated with the key.
* GET -- Return the old string stored at key, or nil if key did not exist. An error is returned and SET aborted if the value stored at key is not a string.

[SET](https://redis.io/commands/set/)

### MSET
> * MSET key value [key value ...]
> * Time Complexity: O(N) where N is the number of keys to set.


### Redis Sorted Set commands (有序集合命令)
|# | 命令 | 描述 |
| --- | --- | --- |
| 1 | ZADD key score1 member1 [score2 member2] | 向有序集合添加一個或多個成員 或更新已存在成員 |
| 2 | ZCARD key | 獲取友序集合成員數 |
| 3 | ZCOUNT key min max | 計算在有序集合中指定區間分數的成員數 |
| 4 | ZINCRBY key increment member | 有序集合中對指定成員的分數加上增量 (increment) |
| 5 | ZINTERSTORE destination numkeys key [key...] | 計算給定的一個或多個有序集的交集並將結果儲存在新的有序集合 destination 中 |
| 6 | ZLEXCOUNT key min max| 有序集合中計算指定字典區間內成員數量|
| 7| ZRANGE key start stop [WITHSCORES|通過索引區間返回有序集合指定區間成員 |
| 8| ZRANGEBYLEX key min max [LIMIT offset count|通過字典區間返回有序集合成員 |
| 9| ZRANGEBYSCORE key min max[WITHSCORES] [LIMIT] |通過分數返回有序集合指定區間內成員 |
| 10|ZRANK key member |返回有序集合中指定成員索引 |
| 11|ZREM key member [member...] |移除有序集合中的一個或多個成員 |
| 12|ZREMRANGERBYLEX key min max |移除有序集合中給定字典區間的所有成員 |
| 13|ZREMRANGEBYRANK key start stop |移除有序集合中給定的排名區間所有成員 |
| 14|ZREMRANGEBYSCORE key min max |移除有序集合中給定分數區間所有成員 |
| 15|ZREVRANGE key start stop [WITHSCORES] |返回有序集合中指定區間的成員 通過索引 分處從高到低 |
| 16|ZREVRANGEBYSCORE key max min [WITHSCORES] |返回有序集中指定分數區間內的成員 分數從高到低排序 |
| 17|ZREVRANK key member |非回有序集合中指定成員的排名 有序集成員案分數值遞減 從大到小排序 |
| 18|ZSCORE key member |返回有序集中 成員的分數值 |
| 19|ZUNIONSTORE destination numkeys key [key...] |計算給定一個或多個有序集的開集 儲存在新key 中 |
| 20|ZSCAN key cursor [MATCH pattern] [COUNT count] |迭代有序集合中的元素 |

