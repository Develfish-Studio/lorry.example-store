.PHONY: build up down

up:
	docker compose \
	  --profile 'env' \
	  --profile 'app' \
	  up -d

down:
	docker compose --profile '*' down

build:
	@make --no-print-directory build/app/assembly_web

build/app/assembly_web:
	docker build \
	  --tag store/assembly_web:1.0.0-SNAPSHOT \
	  .
