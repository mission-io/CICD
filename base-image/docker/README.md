# Containe Base Image - Docker

#### [Docker Hub](https://hub.docker.com/_/docker)

## Rremove <none> tag images
```sh
docker images | grep none | awk '{ print $3; }' | xargs docker rmi
```