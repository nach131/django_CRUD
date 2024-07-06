# Variables
DATA_DIRS = data/db data/static/media

# Default target
all: build

# Target to create directories
create-dirs:
	@echo "Creating data directories..."
	@mkdir -p $(DATA_DIRS)

# Target to build docker-compose
build: create-dirs
	@echo "Building Docker images..."
	@docker compose build

# Target to run and set up the application
up:
	@echo "Running setup tasks..."
	@docker compose run --rm app sh -c "python manage.py wait_for_db"
	@docker compose run --rm app sh -c "python manage.py test"
	@docker compose run --rm app sh -c "python manage.py makemigrations"
	# Uncomment the following line if you want to apply migrations
	# @docker compose run --rm app sh -c "python manage.py migrate"
	@docker compose up

down:
	@echo "Turning off everything."
	@docker compose down
# Target to clean up generated directories (optional)
clean:
	@echo "Cleaning up data directories..."
	@rm -rf $(DATA_DIRS)

fclean: down
	@echo "Delete All..."

.PHONY: all create-dirs build up clean down fclean
