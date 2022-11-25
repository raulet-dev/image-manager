#!/bin/bash
if [ $# -eq 0 ];
then
  echo "Missing arguments"
  echo "commands:"
  echo "pull: pull image or list of images from source"
  echo "push: push image from source to target"
  echo "example of use:"
  echo "pull from docker.io/alpine:latest and push to my.registry.com/docker.io/alpine:latest"
  echo "you can use the image name or a file containing a list of images, one image per line"
  echo "bash $0 pull <<< docker.io/alpine:latest"
  echo "bash $0 push my.registry.com < file"
  exit 1
else
  case $1 in
    pull)
      echo "pulling images"
      while read -t 1 STRING
        do
          echo "pull $STRING"
          docker pull $STRING
        done
      echo "done"
      ;;
    push)
      if [ "$2" == "" ];
      then
        echo "Missing arguments"
        echo "commands:"
        echo "pull: pull image or list of images from source"
        echo "push: push image from source to target"
        echo "example of use:"
        echo "pull from docker.io/alpine:latest and push to my.registry.com/docker.io/alpine:latest"
        echo "you can use the image name or a file containing a list of images, one image per line"
        echo "bash image-manager.sh pull <<< docker.io/alpine:latest"
        echo "bash image-manager.sh push my.registry.com < file"
        exit 1
      fi
      echo "pushing images"
      while read -t 1 STRING
        do
          echo "push to $2/$STRING"
          docker tag $STRING $2/$STRING
          docker push $2/$STRING
        done
      echo "done"
      ;;
    *)
      echo "Wrong arguments, please use pull or push"
  esac
fi
