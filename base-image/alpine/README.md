# Container Base Image - Alpine

#### [Docker Hub](https://hub.docker.com/_/alpine)

## Pull Docker Image
```shell
docker pull alpine
```

## Run bash
```shell
$ docker run [--rm] -it alpine /bin/sh

# --rm   will remove the container after exit
```

## Usage

```Dockerfile
FROM alpine:latest
```

## Rust add target
```shell
rustup target add x86_64-unknown-linux-musl
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
