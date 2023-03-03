project_name = oodreacttemplate
NAME := $(project_name)

.PHONY: build clean stop run deploy

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
