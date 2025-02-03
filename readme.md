# Build the docker file
1. use docker buildx 
```
docker buildx build -t [username]/[name_image] .
```
2. Run the built container 
```
docker run -d --restart unless-stopped --name [SomeName] -v $(pwd)/pb_data:/pb/pb_data -p [port]:8080 [username]/[name_image]
```
3. go inside the docker container to make superuser (For first login)
```
docker exec -it [name of container] sh
cd pb/
./pocketbase superuser upsert [EMAIL] [PASS]
```
4. Just go to localhost:port to login 