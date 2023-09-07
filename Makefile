# Variables
COMPOSE_FILE = ./srcs/docker-compose.yml
LDC = docker compose

# Build the Docker images
build:
	mkdir -p ~/data ~/data/mariadb ~/data/wordpress
	$(LDC) -f $(COMPOSE_FILE) build --progress=plain


# Start the containers
up:
	$(LDC) -f $(COMPOSE_FILE) up --remove-orphans

# Start the containers detached
upd:
	$(LDC) -f $(COMPOSE_FILE) up -d

# Stop and remove the containers
down:
	$(LDC) -f $(COMPOSE_FILE) down

# Check the status of containers
ps:
	$(LDC) -f $(COMPOSE_FILE) ps

start_eval:
	-@docker stop $$(docker ps -qa)
	-@docker rm $$(docker ps -qa)
	-@docker rmi -f $$(docker images -qa)
	-@docker volume rm $$(docker volume ls -q)
	-@docker network rm $$(docker network ls -q) 2> /dev/null

# Clean up unused Docker images
clean:
	docker image prune -a

# Shortcut for stopping and removing containers, cleaning up images
fclean: down clean

# Rebuild and start the containers
re: down build up
red: down build upd

# Check the logs of a specific container
mariadb-logs:
	$(LDC) -f $(COMPOSE_FILE) logs -f mariadb

wordpress-logs:
	$(LDC) -f $(COMPOSE_FILE) logs -f wordpress
