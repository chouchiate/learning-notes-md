## [pg] - Docker

**Create a Postgres Docker Image and Run it**

```makefile
stop-pg:
	@echo "stop postgres..."
	@docker stop back-pg | true

restart-pg: stop-pg
	@echo "start postgres..."
	@docker run -d --rm --name back-pg \
				-p $(DB_PORT):5432 \
				-e POSTGRES_DB=$(DB_DBNAME) \
				-e POSTGRES_USER=$(DB_USER) \
				-e POSTGRES_PASSWORD=$(DB_PASSWORD) \
				postgres:13.4
	@until (docker exec back-pg pg_isready -U postgres); do \
		echo "[`date`] Waiting for Postgres to be ready"; \
		sleep 1; \
	done

```