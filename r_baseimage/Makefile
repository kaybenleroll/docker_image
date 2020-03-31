DOCKER_USER=mcooney

PROJECT_USER=kaybenleroll
PROJECT_NAME=r_baseimage
PROJECT_TAG=base-202003

IMAGE_TAG=${PROJECT_USER}/${PROJECT_NAME}:${PROJECT_TAG}


docker-build-image: Dockerfile
	docker build -t ${IMAGE_TAG} -f Dockerfile .

docker-run:
	docker run --rm -d \
	  -p 8787:8787 \
	  -e USER=${DOCKER_USER} \
	  -e PASSWORD=quickpass \
	  ${IMAGE_TAG}

docker-stop:
	docker stop $(shell docker ps -q -a)

docker-clean:
	docker rm $(shell docker ps -q -a)

docker-push:
	docker push ${IMAGE_TAG}

docker-pull:
	docker pull ${IMAGE_TAG}
