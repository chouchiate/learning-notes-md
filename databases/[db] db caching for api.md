## [db] Caching to Speed up API

Caching is a way to serve content faster. Caching happens at different levels in a web application:

Edge caching or CDN
Database caching
Server caching (API caching)
Browser caching
CDN is used to cache static assets in geographically distributed servers. It sends the assets faster to the end user from the cache.

Database caching is the caching natively used by every database. Every database has smart algorithms to optimize reads and writes. This caching depends primarily on the structure of the database. You can optimize your database caching by tweaking the schema.

Indexing in a database is one way of optimizing database reads. The database also has a working set of data in-memory to handle frequent requests to the same data.

Server caching is the custom caching of data in a server application. Usually this caching heavily depends on the business need. Highly optional for small applications that don’t have enough concurrent users.

Browsers cache the static assets based on the cache expiry headers. Also, browsers cache the GET requests smartly to avoid unnecessary data calls.

In this article, we will see different caching strategies that happen in the API (i.e., server level caching).


On an API level, there are many optimizations you can do to solve such issues. Some of the solutions include paginating data fetches from the database, caching read data that are the same for many users or visitors, and database sharding.

### **Cache Life Cycle and Expiry**
The lifecycle of caches play a major role. Invalidating a cache is one of the most difficult computer science problems.

We’re going to talk about cache with time to live (TTL) and cache without TTL.

Cache with TTL

A cache with TTL is the most commonly used cache. When your data is frequently updated and you want to expire your cache in regular intervals, you can use cache with a time limit. The cache will get deleted automatically once the time interval has passed.

Server sessions and live sports scores are examples of caches with TTL.

Cache without TTL

A cache without TTL is used for caching needs that don’t need to be updated frequently.

Course content in course websites and heavy static content sites like multi-author blogs often use caches without TTL.
Real world example for cache without TTL are,

Content will be published and updated infrequently, so it’s easier to cache it. Cache invalidation is easy too.

There are several strategies in caching. Some of them include cache aside (or lazy loading), read through cache, and write through cache.