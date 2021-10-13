# Nginx 

## Base Image for container
```
docker pull nginx:alpine
```


## Sample angular application deployment in nginx

1. [Dockerfile](../../language/angular/Dockerfile)
2. [nginx.conf](../../language/angular/nginx.conf)

### Angular build required `--base-href` option when we deploy into sub directory
```shell
ng build --base-href=/sub-dir/
```