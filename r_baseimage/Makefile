PROJECT_USER=kaybenleroll
PROJECT_NAME=r_baseimage
PROJECT_TAG=base202111

CONTAINER_NAME=kaybenleroll_baseimage

DOCKER_USER=rstudio
DOCKER_PASS=password
DOCKER_UID=$(shell id -u)
DOCKER_GID=$(shell id -g)

RSTUDIO_PORT=8787

IMAGE_TAG=${PROJECT_USER}/${PROJECT_NAME}:${PROJECT_TAG}


docker-build-image: Dockerfile
	docker build -t ${IMAGE_TAG} -f Dockerfile .

docker-run:
	docker run --rm -d \
	  -p ${RSTUDIO_PORT}:8787 \
	  -e USER=${DOCKER_USER} \
	  -e PASSWORD=${DOCKER_PASS} \
	  -e USERID=${DOCKER_UID} \
	  -e GROUPID=${DOCKER_GID} \
	  --name ${CONTAINER_NAME} \
	  ${IMAGE_TAG}

docker-bash:
	docker exec -it -u ${DOCKER_USER} ${CONTAINER_NAME} bash

docker-stop:
	docker stop ${CONTAINER_NAME}

docker-stop-all:
	docker stop $(shell docker ps -q -a)

docker-clean:
	docker rm $(shell docker ps -q -a)

docker-push:
	docker push ${IMAGE_TAG}

docker-pull:
	docker pull ${IMAGE_TAG}

docker-login:
	cat ${HOME}/.dockerpass | docker login -u kaybenleroll --password-stdin

