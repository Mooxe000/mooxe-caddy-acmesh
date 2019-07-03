#
ImageName := mooxe/caddy_acme.sh

build:
	docker build -t ${ImageName} .

rebuild:
	docker build --no-cache -t ${ImageName} .

in:
	docker run \
		--name mooxe_acmesh \
			--rm \
			-ti \
			-p 80:80 \
			-p 443:443 \
			-v $$(pwd)/caddy:/root/caddy/conf \
			-v $$(pwd)/dotCaddy:/root/.caddy \
			-v $$(pwd)/logs:/root/caddy/logs \
			-v $$(pwd)/start.sh:/root/caddy/start.sh \
			${ImageName} \
			/bin/bash

publish:
	docker push ${ImageName}
