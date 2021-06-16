







#### Step 3: 計算需要多少 machine



#### Latency Comparison Number (~2012)



---

| Type                                | Latency (ns)   | Latency (us) | Latency (ms) | Note          |
| ----------------------------------- | -------------- | ------------ | ------------ | ------------- |
| L1 cache reference                  | 0.5 ns         |              |              |               |
| Branch mispredict                   | 5 ns           |              |              |               |
| L2 cache reference                  | 7 ns           |              |              | 14 x L1 cache |
| Mutex lock/unlock                   | 25 ns          |              |              |               |
| Main memory reference               | 100 ns         |              |              |               |
| Compress 1K bytes with Zippy        | 3,000 ns       | 3 us         |              |               |
| Send 1K bytes over 1Gbps network    | 10,000 ns      | 10 us        |              |               |
| Read 4K randomly from SSD*          | 150,000 ns     | 150 us       |              |               |
| Read 1 MB sequentially from memory  | 250,000 ns     | 250 us       |              |               |
| Round 1 trip within same datacenter | 500,000 ns     | 500 us       |              |               |
| Read 1 MB sequentially from SSD*    | 1,000,000 ns   | 1,000 us     | 1 ms         |               |
| Disk seek                           | 10,000,000 ns  | 10,000 us    | 10 ms        |               |
| Read 1 MB sequentially fom disk     | 20,000,000 ns  | 20,000 us    | 20 ms        |               |
| Send packet CA->Netherlands->CA     | 150,000,000 ns | 150,000 us   | 150 ms       |               |



#### Step:  系統架構

>  [Harvard Web Development CS75 - David Malan] https://youtu.be/-W9F__D3oY4

#### VPSes vs. shared webhost

- DreamHost
- Go Daddy
- Host Gator
- Linode
- Pari Networks
- Slicehost
- VPSLAND

#### What is hypervisor in VPS?

#### Simpliest way of load balancing with DNS: Load Balancingt with BIND

```
www IN A 64.131.79.131
www IN A 64.131.79.132
www IN A 64.131.79.133
www IN A 64.131.79.134
```

try nslookup google.com

```
Server:		192.168.50.1
Address:	192.168.50.1#53

Non-authoritative answer:
Name:	google.com
Address: 172.217.160.110
```



#### What is RAID?

- multiple hard drives

```
RAID0 - Two identical hard drive (one file write striping to two hard drive - doubling speed of writing file)
RAID1 - Two hard drive, mirror data, store one file at both places simultaneously
RAID5 - Combination of RAID0/1, typically with 4 drives, both striping and redundancy
RAID6 - any two drives die can be replace for redundacy backup
RAID10
```



#### Some Load Balancer Solutions

```
# Software
	ELB	- Elastic Load Balancing
	HAProxy
	LVS - Linux Virtual Server

# Hardware
	Barracuda
	Cisco
	Citrix
	F5
```



#### Sticky Session Solution

```
Session Object
Cookie

End up in the same backend server
```

#### Caching

```

memcached - store in RAM
redis
```

#### memcached

```php
$memchaced = memcache_connect(HOST,PORT);
$user = memcache_get($memcache, $id);
if (is_null($user))
{
  $dbh = new PDO(DSN, USER, PASS);
  $result = $dbh->query("SELECT * FROM users WHERE id=$id");
  $user = $result->fetch(PDO:FETCH_ASSOC);
  memcache_set($memcache, $user['id'], $user);
}
```

#### Redis

```
```





#### Replication Database

Master -> slave

​		-> slave

--->	slave





