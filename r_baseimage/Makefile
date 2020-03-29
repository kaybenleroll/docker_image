DOCKER_USER=mcooney
PROJECT_USER=kaybenleroll
PROJECT_NAME=r_baseimage
PROJECT_TAG=3.6.1


docker-build-image: Dockerfile
	docker build -t ${PROJECT_USER}/${PROJECT_NAME}:ref_${PROJECT_TAG} -f Dockerfile .

docker-run:
	docker run --rm -d \
	  -p 8787:8787 \
	  -e USER=${DOCKER_USER} \
	  -e PASSWORD=quickpass \
	  ${PROJECT_USER}/${PROJECT_NAME}:${PROJECT_TAG}

docker-stop:
	docker stop $(shell docker ps -q -a)

docker-clean:
	docker rm $(shell docker ps -q -a)

