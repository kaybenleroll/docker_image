PROJECT_USER=kaybenleroll
PROJECT_NAME=r_nlp
PROJECT_TAG=nlp202006

CONTAINER_NAME=kaybenleroll_nlpimage

DOCKER_USER=rstudio


IMAGE_TAG=${PROJECT_USER}/${PROJECT_NAME}:${PROJECT_TAG}


docker-build-image: Dockerfile
	docker build -t ${IMAGE_TAG} -f Dockerfile .

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

docker-login:
	cat ${HOME}/.dockerpass | docker login -u kaybenleroll --password-stdin


