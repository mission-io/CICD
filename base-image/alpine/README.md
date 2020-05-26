# Container Base Image - Alpine

## [Docker Hub](https://hub.docker.com/_/alpine)

## Pull Docker Image
```shell
docker pull alpine
```

## Usage
```Dockerfile
FROM alpine:latest
```
## Install componants
```shell
apk update && \\
apk add nodejs --no-cache && node -v && \\
apk add npm --no-cache && npm -v
```

## Create user group
```shell
addgroup -S <group-name>
```

## Create user 
```shell
adduser -S <user-name> -G  <group-name>
```
