## [redis] - **start docker**

**Create a Redis Server Image and Run it**

```makefile
REDIS_PORT ?= 63xx

stop-redis:
	@echo "stop redis..."
	@docker stop redis-docker | true

start-redis: stop-redis
	@echo "start redis..."
	@docker run -d --rm --name redis-docker \
		-p $(REDIS_PORT):63xx \
		redis:6.2.6-alpine

```

## **Golang Example**


## **Typescript Example**

