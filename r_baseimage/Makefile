PROJECT_USER=describedata
PROJECT_NAME=r_baseimage
PROJECT_TAG=base202004

IMAGE_TAG=${PROJECT_USER}/${PROJECT_NAME}:${PROJECT_TAG}

DOCKER_USER=mcooney


docker-build-image: ${PROJECT_TAG}.Dockerfile
	docker build -t ${IMAGE_TAG} -f ${PROJECT_TAG}.Dockerfile .

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

