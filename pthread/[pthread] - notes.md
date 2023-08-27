## [pthread] - notes


* thread may be joinable or detached

### thread_info
```c
    struct thread_info {    /* Used as argument to thread_start() */
        pthread_t thread_id;        /* ID returned by pthread_create() */
        int       thread_num;       /* Application-defined thread # */
        char     *argv_string;      /* From command-line argument */
    };
```

### create
```c
> create a new thread in calling process

int pthread_create(pthread_t *restrict thread,
    const pthread_attr_t *restrict attr,
    void *(*start_routine)(void *),
    void *restrict arg);
```
[man](https://man7.org/linux/man-pages/man3/pthread_create.3.html)
### join
> join with terminated thread
```c
int pthread_join(pthread_t thread, void **retval);
```