Create a docker container from the image with something like this in the project root
```
sudo docker build -t mousezero/node .
```
Then run the container with something like this
```
docker run -d -p 8080:3000 mousezero/node
```
