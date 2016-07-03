# docker vars
HOST_PORT=8890
CONT_PORT=8888
PORTS=-p $(HOST_PORT):$(CONT_PORT)
IMAGE=jupyter/datascience-notebook
VOLUMES=-v `pwd`/notebooks:/home/jovyan/work -v `pwd`/data:/home/joyvan/data
NAME=kaggle-notebook

.PHONY: run clean
.IGNORE: clean

run: clean
	docker run -d --name $(NAME) $(VOLUMES) $(PORTS) $(IMAGE) $(ARGS)

clean:
	docker rm -f $(NAME)
