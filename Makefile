up:
	docker-compose up -d redis postgres s3
	docker-compose run --rm outline bash -c "yarn && yarn sequelize db:migrate"
	docker-compose up outline

build:
	docker-compose build --pull outline

prepare:
	docker-compose up -d redis postgres s3
	docker-compose run --rm outline bash -c "yarn && yarn sequelize db:migrate"

start:
	docker-compose up -d outline  nginx

test:
	docker-compose run --rm outline yarn test

watch:
	docker-compose run --rm outline yarn test:watch

destroy:
	docker-compose stop
	docker-compose rm -f

.PHONY: up build destroy test watch prepare start # let's go to reserve rules names

