path=$(CURDIR)
build:
	docker build -t DART_LLM_Docker .
run:
	docker run -it -e DISPLAY=host.docker.internal:0 -v ${path}/src:/root/src --gpus all --name DART_LLM_Docker DART_LLM_Docker:latest /bin/bash
start:
	docker start DART_LLM_Docker
shell:
	docker exec -it DART_LLM_Docker /bin/bash
stop:
	docker stop DART_LLM_Docker
rm:
	docker rm DART_LLM_Docker

clone:
	git clone -b main-ros2 https://github.com/Unity-Technologies/ROS-TCP-Endpoint.git share/ros2_ws/src/ROS-TCP-Endpoint