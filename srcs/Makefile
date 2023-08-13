# Variables
COMPOSE_FILE = docker-compose.yml
DOCKER_COMPOSE = docker-compose

# Build the Docker images
build:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) build

# Start the containers
up:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up -d

# Stop and remove the containers
down:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down

# Check the status of containers
ps:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) ps

start_eval:
	docker stop $(docker ps -qa);
	docker rm $(docker ps -qa);
	docker rmi -f $(docker images -qa);
	docker volume rm $(docker volume ls -qa);
	docker network rm $(docker network ls -q) 2> /dev/null

# Clean up unused Docker images
clean:
	docker image prune -a

# Shortcut for stopping and removing containers, cleaning up images
fclean: down clean

# Rebuild and start the containers
re: down build up

# Check the logs of a specific container
logs-mariadb:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) logs -f mariadb

logs-wordpress:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) logs -f wordpress

