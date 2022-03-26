build:
	docker build -t rafaelzimmermann/arweave .

run-shell-it: build
	docker run -it rafaelzimmermann/arweave bash

buildx:
	docker buildx create --name multiplatform --platform linux/arm64,linux/amd64,linux/arm/v7 && docker buildx use multiplatform

releasemulti-%:
	docker buildx build --platform linux/amd64 -t rafaelzimmermann/arweave:$* --push .

run: build
	docker run --mount type=bind,source=${STORAGE_PATH},destination=/data -p 1984:1984 rafaelzimmermann/arweave -w=${WALLET}
