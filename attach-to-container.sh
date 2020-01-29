#!/usr/bin/env bash

# Check that file containing the image name exists.
if ! [ -f image_name.txt ]; then
  echo "Could not find image_name.txt."
  exit 1
fi

# Get the name of the container image.
image=$(cat image_name.txt)

# Find the running container.
container=$(docker ps --filter ancestor=$image --latest --quiet)

# this is apparently dangerous, according to http://wiki.ros.org/docker/Tutorials/GUI
xhost +local:root

# Attach to the container.
docker exec -it $container $SHELL

# this apparently fixes the vulnerability listed above
xhost -local:root