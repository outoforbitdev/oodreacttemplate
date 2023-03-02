project_name = oodreacttemplate

.PHONY: build clean stop run deploy

build :
	docker build -t $(project_name) .

clean : stop
	-docker rmi $(project_name)

stop :
	-docker stop $(project_name)
	-docker rm $(project_name)

run : stop build
	docker run -d -p $(PORT):80 --name $(project_name) $(project_name)

deploy : clean run
