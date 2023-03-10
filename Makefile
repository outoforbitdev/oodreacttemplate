project_name = oodreacttemplate
NAME := $(project_name)
PORT := 1798

.PHONY: build clean stop run deploy install

build :
	docker build -t $(project_name) .

clean : stop
	-docker rmi $(project_name)

stop :
	-docker stop $(NAME)
	-docker rm $(NAME)

run : stop build
	docker run -d -p $(PORT):80 --name $(NAME) $(project_name)

deploy : run

install:
	git submodule update --init --recursive --remote
	cd oodreacttemplate/ClientApp; npm install
