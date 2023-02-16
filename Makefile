project_name = oodreacttemplate

build :
	docker build -t $(project_name) .

clean :
	$(MAKE) stop
	-docker rmi $(project_name)

stop:
	-docker stop $(project_name)
	-docker rm $(project_name)

run :
	$(MAKE) stop
	$(MAKE) build
	docker run -d -p 1798:80 --name $(project_name) $(project_name)

deploy:
	$(MAKE) clear
	$(MAKE) run
