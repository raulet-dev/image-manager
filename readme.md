## This script is for pull images from one docker reg and push in a different docker reg following the same path structure:
### Is usefull when you have to pull a list of images from outside a proxy docker reg, and push them again inside a proxy docker reg.



# commands:

```pull```: pull image or list of images from source

```push```: push image from source to target

# example of use:

pull from docker.io/alpine:latest and push to my.registry.com/docker.io/alpine:latest
you can use the image name or a file containing a list of images, one image per line

- ```bash image-manager.sh pull <<< docker.io/alpine:latest``` or ```bash image-manager.sh pull < file```

- Change proxy

- Docker login to the new docker reg

- ```bash image-manager.sh push my.registry.com <<< docker.io/alpine:latest``` or ```bash image-manager.sh push my.registry.com < file```
