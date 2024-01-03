all: up

up:
	@docker compose -f docker-compose.yml up -d --build

down:
	@docker compose -f docker-compose.yml down

# clean: down
# 	@if [ -z $$(docker image ls -qa) ]; then \
# 		echo "No images found."; \
# 	else \
# 		docker image rm -f $$(docker images -qa); \
# 	fi

# 	@if [ -z ]
clean:
	docker compose down --rmi all --volumes

fclean: clean
	docker system prune -af

re: fclean up

.PHONY: all up down clean fclean re
