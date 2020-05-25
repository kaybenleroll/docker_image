PROJECT_USER=kaybenleroll
PROJECT_NAME=r_baseimage
PROJECT_TAG=base202006

CONTAINER_NAME=kaybenleroll_baseimage

DOCKER_USER=rstudio


IMAGE_TAG=${PROJECT_USER}/${PROJECT_NAME}:${PROJECT_TAG}


docker-build-image: ${PROJECT_TAG}.Dockerfile
	docker build -t ${IMAGE_TAG} -f ${PROJECT_TAG}.Dockerfile .

docker-run:
	docker run --rm -d \
	  -p 8787:8787 \
	  -e USER=${DOCKER_USER} \
	  -e PASSWORD=quickpass \
		--name ${CONTAINER_NAME} \
	  ${IMAGE_TAG}

docker-stop:
	docker stop $(shell docker ps -q -a)

docker-clean:
	docker rm $(shell docker ps -q -a)

docker-push:
	docker push ${IMAGE_TAG}

docker-pull:
	docker pull ${IMAGE_TAG}



