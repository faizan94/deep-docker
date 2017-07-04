# Deep Dockerfile

It contains dockerfile which will install keras, jupyterm, tensorflow, 

### Build command
docker build -t deep_image .

### Run container command
docker run -d -p 8888:8888 --name deep deep_image

### Run container and link with mongodb
docker run -d -p 8888:8888 --link=myMongoDB:mongodb --name deep deep_image

### Open bash when container is running command
docker exec -it deep_image bash 

