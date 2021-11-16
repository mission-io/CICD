# Angular


## Known compile/build Errors

### Error

```shell
FATAL ERROR: Ineffective mark-compacts near heap limit Allocation failed - JavaScript heap out of memory
```

### Solution

Set the following environment variable to resolve the javascript heap out of memeory.

```shell
ENV NODE_OPTIONS=--max_old_space_size=2048
```

[Example Dockerfile for Angular project](./Dockerfile)

## Angular 1.x to Container - Prerequisite

1. File name and folder name should be lower case due to linux os support. (Linux path is case sensitive)
2. 