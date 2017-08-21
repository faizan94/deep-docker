# Deep Dockerfile

It contains dockerfile which will install jupyter and open it on port 8888 and install some required packegs for Data Science, Machine Learning and Deep Learning.

### Build command
```
docker build -t deep_image .
```

## Run deep image without any linkage

### Run container command
```
docker run -d -p 8888:8888 --name deep deep_image
```

## Run deep image with mongo db

### Install and run mongo
```
docker pull mongo
docker run -d --name myMongoDB mongo
```

### Run container and link with mongodb
```
docker run -d -p 8888:8888 --link=myMongoDB:mongodb --name deep deep_image
```

## Some extra commands

### Open bash when container is running command
```
docker exec -it deep bash 
```

### Copy docker files from host to docker 
```
docker cp foo.txt deep:/foo.txt
```


